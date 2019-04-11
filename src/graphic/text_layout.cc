/*
 * Copyright (C) 2006-2019 by the Widelands Development Team
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
 *
 */

#include "graphic/text_layout.h"

#include <map>

#include <SDL_ttf.h>
#include <boost/algorithm/string.hpp>
#include <boost/format.hpp>

#include "graphic/font_handler.h"
#include "graphic/graphic.h"
#include "graphic/image.h"
#include "graphic/text/bidi.h"
#include "graphic/text/font_set.h"
#include "graphic/text_constants.h"

namespace {
bool is_paragraph(const std::string& text) {
	return boost::starts_with(text, "<p");
}

bool is_div(const std::string& text) {
	return boost::starts_with(text, "<div");
}
}  // namespace

void replace_entities(std::string* text) {
	boost::replace_all(*text, "&gt;", ">");
	boost::replace_all(*text, "&lt;", "<");
	boost::replace_all(*text, "&nbsp;", " ");
	boost::replace_all(*text, "&amp;", "&");  // Must be performed last
}

int text_width(const std::string& text, int ptsize) {
	return UI::g_fh
	   ->render(as_editorfont(
	      text.substr(0, g_gr->max_texture_size_for_font_rendering() / text_height() - 1),
	      ptsize - UI::g_fh->fontset()->size_offset()))
	   ->width();
}

int text_height(int ptsize, UI::FontSet::Face face) {
	return UI::g_fh
	   ->render(as_aligned(UI::g_fh->fontset()->representative_character(), UI::Align::kLeft,
	                       ptsize - UI::g_fh->fontset()->size_offset(), RGBColor(0, 0, 0), face))
	   ->height();
}

std::string richtext_escape(const std::string& given_text) {
	std::string text = given_text;
	boost::replace_all(text, "&", "&amp;");  // Must be performed first
	boost::replace_all(text, ">", "&gt;");
	boost::replace_all(text, "<", "&lt;");
	return text;
}

std::string as_game_tip(const std::string& txt) {
	static boost::format f(
	   "<rt><p align=center><font color=21211b face=serif size=16>%s</font></p></rt>");
	f % txt;
	return f.str();
}

std::string
as_uifont(const std::string& txt, int size, const RGBColor& clr, UI::FontSet::Face face) {
	return as_aligned(txt, UI::Align::kLeft, size, clr, face);
}

std::string
as_condensed(const std::string& text, UI::Align align, int ptsize, const RGBColor& clr) {
	return as_aligned(text, align, ptsize, clr, UI::FontSet::Face::kCondensed);
}

std::string as_editorfont(const std::string& text, int ptsize, const RGBColor& clr) {
	// UI Text is always bold due to historic reasons
	static boost::format f(
	   "<rt keep_spaces=1><p><font face=sans size=%i bold=1 shadow=1 color=%s>%s</font></p></rt>");
	f % ptsize;
	f % clr.hex_value();
	f % richtext_escape(text);
	return f.str();
}

std::string as_aligned(const std::string& txt,
                       UI::Align align,
                       int ptsize,
                       const RGBColor& clr,
                       UI::FontSet::Face face) {
	std::string alignment = "left";
	switch (align) {
	case UI::Align::kCenter:
		alignment = "center";
		break;
	case UI::Align::kRight:
		alignment = "right";
		break;
	case UI::Align::kLeft:
		alignment = "left";
		break;
	}

	std::string font_face = "sans";

	switch (face) {
	case UI::FontSet::Face::kCondensed:
		font_face = "condensed";
		break;
	case UI::FontSet::Face::kSerif:
		font_face = "serif";
		break;
	case UI::FontSet::Face::kSans:
		font_face = "sans";
		break;
	}

	// UI Text is always bold due to historic reasons
	static boost::format f(
	   "<rt><p align=%s><font face=%s size=%i bold=1 shadow=1 color=%s>%s</font></p></rt>");
	f % alignment;
	f % font_face;
	f % ptsize;
	f % clr.hex_value();
	f % txt;
	return f.str();
}

/// Bullet list item
std::string as_listitem(const std::string& txt, int ptsize, const RGBColor& clr) {
	static boost::format f("<div width=100%%><div><p><font size=%d "
	                       "color=%s>•</font></p></div><div><p><space gap=6></p></div><div "
	                       "width=*><p><font size=%d color=%s>%s<vspace "
	                       "gap=6></font></p></div></div>");
	f % ptsize % clr.hex_value() % ptsize % clr.hex_value() % txt;
	return f.str();
}

std::string as_richtext(const std::string& txt) {
	static boost::format f("<rt>%s</rt>");
	f % txt;
	return f.str();
}

std::string as_tooltip(const std::string& txt) {
	static boost::format f("<rt><p><font face=sans size=%i bold=1 color=%s>%s</font></p></rt>");

	f % UI_FONT_SIZE_SMALL;
	f % UI_FONT_TOOLTIP_CLR.hex_value();
	f % txt;
	return f.str();
}

std::string as_waresinfo(const std::string& txt) {
	static boost::format f("<rt><p><font face=condensed size=10 bold=0 color=%s>%s</font></p></rt>");
	f % UI_FONT_TOOLTIP_CLR.hex_value();
	f % txt;
	return f.str();
}

std::string as_message(const std::string& heading, const std::string& body) {
	return (
	   (boost::format(
	       "<rt><p><font size=18 bold=1 color=D1D1D1>%s<br></font></p><vspace gap=6>%s</rt>") %
	    heading %
	    (is_paragraph(body) || is_div(body) ?
	        body :
	        (boost::format("<p><font size=%d>%s</font></p>") % UI_FONT_SIZE_MESSAGE % body).str()))
	      .str());
}

std::string as_heading_with_content(const std::string& header,
                                    const std::string& content,
                                    UI::PanelStyle style,
                                    bool is_first,
                                    bool noescape) {
	switch (style) {
	case UI::PanelStyle::kFsMenu:
		return (boost::format(
		           "<p><font size=%i bold=1 shadow=1>%s%s <font color=D1D1D1>%s</font></font></p>") %
		        UI_FONT_SIZE_SMALL % (is_first ? "" : "<vspace gap=9>") %
		        (noescape ? header : richtext_escape(header)) %
		        (noescape ? content : richtext_escape(content)))
		   .str();
	case UI::PanelStyle::kWui:
		return (boost::format(
		           "<p><font size=%i>%s<font bold=1 color=D1D1D1>%s</font> %s</font></p>") %
		        UI_FONT_SIZE_SMALL % (is_first ? "" : "<vspace gap=6>") %
		        (noescape ? header : richtext_escape(header)) %
		        (noescape ? content : richtext_escape(content)))
		   .str();
	}
	NEVER_HERE();
}

std::string as_heading(const std::string& txt, UI::PanelStyle style, bool is_first) {
	switch (style) {
	case UI::PanelStyle::kFsMenu:
		return (boost::format("<p><font size=%i bold=1 shadow=1>%s%s</font></p>") %
		        UI_FONT_SIZE_SMALL % (is_first ? "" : "<vspace gap=9>") % richtext_escape(txt))
		   .str();
	case UI::PanelStyle::kWui:
		return (boost::format("<p><font size=%i bold=1 color=D1D1D1>%s%s</font></p>") %
		        UI_FONT_SIZE_SMALL % (is_first ? "" : "<vspace gap=6>") % richtext_escape(txt))
		   .str();
	}
	NEVER_HERE();
}
std::string as_content(const std::string& txt, UI::PanelStyle style) {
	switch (style) {
	case UI::PanelStyle::kFsMenu:
		return (boost::format("<p><font size=%i color=D1D1D1 shadow=1><vspace gap=2>%s</font></p>") %
		        UI_FONT_SIZE_SMALL % richtext_escape(txt))
		   .str();
	case UI::PanelStyle::kWui:
		return (boost::format("<p><font size=%i><vspace gap=2>%s</font></p>") %
		        (UI_FONT_SIZE_SMALL - 2) % richtext_escape(txt))
		   .str();
	}
	NEVER_HERE();
}

std::string as_text_with_hotkey(const std::string& text, const std::string& hotkey) {
	return (boost::format("%1% <font bold=0 italic=1>(%2%)</font>") % text % hotkey).str();
}

std::shared_ptr<const UI::RenderedText>
autofit_ui_text(const std::string& text, int width, RGBColor color, int fontsize) {
	std::shared_ptr<const UI::RenderedText> result =
	   UI::g_fh->render(as_uifont(richtext_escape(text), fontsize, color));
	if (width > 0) {  // Autofit
		for (; result->width() > width && fontsize >= kMinimumFontSize; --fontsize) {
			result = UI::g_fh->render(
			   as_condensed(richtext_escape(text), UI::Align::kLeft, fontsize, color));
		}
	}
	return result;
}

namespace UI {

/**
 * This mirrors the horizontal alignment for RTL languages.
 *
 * Do not store this value as it is based on the global font setting.
 *
 * If 'checkme' is not empty, mirror the alignment if the first 20 characters contain an RTL
 * character. Otherwise, mirror if the current fontset is RTL.
 */
Align mirror_alignment(Align alignment, const std::string& checkme) {
	bool do_swap_alignment = checkme.empty() ? UI::g_fh->fontset()->is_rtl() :
	                                           i18n::has_rtl_character(checkme.c_str(), 20);
	if (do_swap_alignment) {
		switch (alignment) {
		case Align::kLeft:
			alignment = Align::kRight;
			break;
		case Align::kRight:
			alignment = Align::kLeft;
			break;
		case Align::kCenter:
			break;
		}
	}
	return alignment;
}

/**
 * Align pt horizontally to match align based on width w.
 *
 * When correcting for align, we never move from pixel boundaries to
 * sub-pixels, because this might lead from pixel-perfect rendering to
 * subsampled rendering - this can lead to blurry texts. That is why we
 * never do float divisions in this function.
 */
void correct_for_align(Align align, uint32_t w, Vector2i* pt) {

	if (align == Align::kCenter)
		pt->x -= w / 2;
	else if (align == Align::kRight)
		pt->x -= w;
}

/**
 * Adjust the y coordinate in 'point 'pt' to vertically center an element with height 'h'.
 */
void center_vertically(uint32_t h, Vector2i* pt) {
	pt->y -= h / 2;
}
}  // namespace UI

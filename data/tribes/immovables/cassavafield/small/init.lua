dirname = path.dirname(__file__)

tribes:new_immovable_type {
   msgctxt = "immovable",
   name = "cassavarootfield_small",
   -- TRANSLATORS: This is an immovable name used in lists of immovables
   descname = pgettext("immovable", "Cassavroot Field (small)"),
   helptext_script = dirname .. "helptexts.lua",
   icon = dirname .. "menu.png",
   size = "small",
   attributes = { "field" },
   programs = {
      program = {
         "animate=idle 45000",
         "transform=cassavarootfield_medium",
      }
   },

   animation_directory = dirname,
   spritesheets = {
      idle = {
         hotspot = {6, 14},
         frames = 4,
         columns = 2,
         rows = 2,
         fps = 2
      }
   }
}

-- =========================
-- Some formating functions
-- =========================

include "scripting/formatting.lua"
include "scripting/format_scenario.lua"

function lutius(title, text)
   return speech("map:Lutius.png", "2F9131", title, text)
end
function saledus2(title, text)
   return speech("map:Saledus2.png", "8F9131", title, text)
end
function saledus3(title, text)
   return speech("map:Saledus3.png", "8F9131", title, text)
end
function saledus4(title, text)
   return speech("map:Saledus2.png", "8F9131", title, text)
end
function amalea1(title, text)
   return speech("map:Amalea.png", "AF7511", title, text)
end
function amalea2(title, text)
   return speech("map:Amalea2.png", "AF7511", title, text)
end
function amalea3(title, text)
   return speech("map:Amalea3.png", "AF7511", title, text)
end
function vesta(title, text)
   return speech("map:Vesta.png", "D0D0D0", title, text)
end
function marcus(title, text)
   return speech("map:Markus.png", "1175AF", title, text)
end




-- =======================================================================
--                           Texts - No logic here
-- =======================================================================


-- ===========
-- objectives
-- ===========
obj_dismantle_buildings = {
    name = "dismantle_unproductive_buildings",
    title=_"Dismantle the unproductive buildings",
    number = 1,
    body = objective_text(_"Dismantle buildings",
       listitem_bullet(_[[Dismantle all unproductive small buildings to get some resources for new buildings. Remember to check the messages and the building stats for unproductive buildings.]])
    ),
}

obj_clear_roads = {
   name = "clear_roads",
   title=_"Clear all unnecessary roads",
   number = 1,
   body = objective_text(_"Clear road network",
      listitem_bullet(_[[Resolve the chaotic road network by clearing all unnecessary roads.]])
   ),
}

obj_find_farm_plans = {
   name = "find_farm_construction_plans",
   title=_"Find the construction plans for the farms",
   number = 1,
   body = objective_text(_"Find the farm construction plans",
      listitem_bullet(_[[Recover the construction plans for the farms. Search for them in the hills east of our border.]])
   ),
}

obj_build_quarries_and_lumberjacks = {
   name = "build_quarries_and_lumberjacks",
   title=_"Build at least 3 lumberjack’s houses and 2 quarries",
   number = 1,
   body = objective_text(_"Quarries and lumberjacks",
      listitem_bullet(_[[Build at least 3 lumberjack’s houses and 2 quarries to renew our building material supply chain.]])
   ),
}

obj_produce_fish = {
   name = "produce_fish",
   title=_"Produce Fish and Rations",
   number = 1,
   body = objective_text(_"Food production",
      listitem_bullet(_[[Find and catch some fish. Afterwards produce rations for our miners.]])
   ),
}

obj_replace_foresters = {
   name = "replace_foresters",
   title=_"Replace the old and uneffective forester's houses",
   number = 1,
   body = objective_text(_"Build 2 new forester's houses",
      listitem_bullet(_[[Replace the 2 forester’s houses by new ones to increase productivity.]])
   ),
}

obj_find_monastery = {
   name = "find_monastery",
   title=_"Find the monastery in the north",
   number = 1,
   body = objective_text(_"Find the monastery",
      listitem_bullet(_[[Find the monastery in the north to obtain the improved technology for our wheat production chain.]])),
}

obj_deal_with_vesta = {
   name = "deal_with_vesta",
   title=_"Deal with Vesta to get the technology",
   number = 1,
   body = objective_text(_"Diplomacy: Trade or War",
      listitem_bullet(_[[Decide: either collect 35 wheat and 15 wine for Vesta in one of our warehouses or conquer the monastery.]])),
}

obj_heroes = {
   name = "train_heroes",
   title=_"Train at least 3 heroes",
   number = 1,
   body = objective_text(_"Training of heroes",
      listitem_bullet(_[[Use your resources wisely to train at least 3 heroes.]])),
}

obj_produce_tools = {
   name = "produce_tools",
   title=_"Produce at least 10 tools",
   number = 1,
   body = objective_text(_"Tool production",
      listitem_bullet(_[[Produce at least 10 tools to improve your economy. Remember the possibility to control the production in the economy settings.]])),
}

obj_recruit_soldiers = {
   name = "recruit_soldiers",
   title=_"Recruit new soldiers",
   number = 1,
   body = objective_text(_"Recruiting new soldiers",
      listitem_bullet(_[[Recruit at least 10 new soldiers in your barracks. Don't forget to forge weapons and armour for them.]])
   ),
}

obj_conquer_all = {
   name = "conquer_all",
   title=_"Defeat the Barbarians",
   number = 1,
   body = objective_text(_"Defeat the enemy",
      listitem_bullet(_[[End the Barbarian intrusion in your very own part of the world.]])
   ),
}

obj_charcoal = {
   name = "charcoal",
   title=_"Build 2 charcoal kiln",
   number = 1,
   body = objective_text(_"Build 2 charcoal kiln",
      listitem_bullet(_[[Build 2 charcoal kiln to support the iron industry. Be aware to ensure a constant log supply for them.]])
   ),
}

obj_training = {
   name = "train_your_soldiers",
   title=_"Increase your military strength by training your soldiers",
   number = 1,
   body = objective_text(_"Training is important",
      listitem_bullet(_[[Train your soldiers hard and train them fast. You need to increase your military strength.]])
   ),
}

obj_upgrade = {
   name = "upgrade",
   title=_"Build a training camp and upgrade the colosseum",
   number = 1,
   body = objective_text(_"Build more efficient training buildings",
      listitem_bullet(_[[Build a trainingcamp and upgrade your colosseum to an arena.]])
   ),
}

-- ==================
-- Texts to the user
-- ==================

-- Diary of Lutius

diary_page_1 = {
   title =_"Home, sweet home",
   body=lutius(_"Diary of Lutius",
      -- TRANSLATORS: Lutius - Diary
      _([[Finally we managed to get home. I am so glad to see our beautiful country again. I really look forward for a walk on our lovely coast and for a hunt in our deep forests.]])
      .. paragraphdivider() ..
      -- TRANSLATORS: Lutius - Diary
      _([[I guess Saledus and Amalea are deeply delighted as well.]])),
   posy=1,
}

diary_page_2= {
   title=_"Tools, tools, tools",
   body= lutius(_"Diary of Lutius",
      -- TRANSLATORS: Lutius - Diary
      _([[Praise the gods. We just ensured a constant tool supply. Now we should be able to expand our economy.]])),
   posy=1,
}

diary_page_3= {
   title=_"Military strength",
   body= lutius(_"Diary of Lutius",
      -- TRANSLATORS: Lutius - Diary
      _([[Thank goodness. Now we have everything ready to fully train our soldiers. Finally we will increase our military strength.]])),
   posy=1,
}

diary_page_4 = {
   title=_"Battle is won",
   body= lutius(_"Diary of Lutius",
      -- TRANSLATORS: Lutius - Diary
      _([[Yes my fellow comrades, we have done it. We managed all the challenges that were imposed on us. And not to forget we have expelled the Barbarians out of our country. But this was only a battle won, the war is even yet to begin. Let's see what the future still holds for us.]])
	  .. paragraphdivider() ..
      _([[You have completed this mission. You may continue playing if you wish, otherwise move on to the next mission.]])),
   posy=1,
}


-- Lutius 

lutius_1 = {
   title=_"Chaos",
   body= lutius(_"Lutius disappointed",
      -- TRANSLATORS: Lutius
      _([[Oh no. Amalea is right. In fact I can't see any productivity at all. And the road network seems to be a complete mess as well. Who might be responsible for this chaos?]])),
   posy=1,
}

lutius_2 = {
   title=_"Explanation needed",
   body= lutius(_"Lutius greets the official",
      -- TRANSLATORS: Lutius
      _([[Ave. Who are you and what happened to our beautiful land?]])),
   posy=1,
}

lutius_3 = {
   title=_"Difficult times",
   body= lutius(_"Lutius accepting the challenge",
      -- TRANSLATORS: Lutius
      _([[Mayor, we have to thank you for your efforts to safeguard our city. And we will do our very best to recover from the chaos. But unfortunately it seems to be very difficult.]])
      .. paragraphdivider() ..
      -- TRANSLATORS: Lutius
      _([[I am really afraid, we could be totally unprepared should the Barbarians decide to attack us.]])),
   posy=1,
}


-- Marcus (mayor of Fremil)

marcus_1 = {
   title=_"Welcome Back",
   body= marcus(_"A high Fremil official is advancing…",
      -- TRANSLATORS: Marcus - Mayor of Fremil welcoming Lutius and explaining the chaos
      _([[Ave Sire. The people and me we are so glad to see you returning back home. We really could use some good leadership around here.]])
	  .. paragraphdivider() ..
      _([[As you have already noticed, things have gone terribly wrong around here after you left.]])),
   posy=1,
}

marcus_2 = {
   title=_"a long story",
   body= marcus(_"The official sighs deeply…",
      -- TRANSLATORS: Marcus - Mayor of Fremil welcoming Lutius and explaining the chaos
      _([[Sire. The king left Fremil a long time ago to fight against the Barbarians. As this duty was demanding his full dedication he delegated the authority to run the city to his former secretary and instated him as his surrogate around here.]])
	  .. paragraphdivider() ..
      _([[But this was one of his worst decisions ever. The secretary got blinded by his new power. His selfish instincts were as awful as his total stupidity and inability to govern the city.]])
	  .. paragraphdivider() ..
      _([[After a while the people discovered the truth and expelled the bloody moron. Afterwards they elected me as mayor of this city. But recovering the chaos seems to be a task to big for my abilities alone.]])),
   posy=1,
}


-- Amalea

amalea = {
    title=_"Amalea looks puzzled",
    body= amalea1(_"Amalea is doubtful…",
    -- TRANSLATORS: Amalea
    _([[Saledus. On the one hand you are right it really is a delight to see our homeland again. But on the other hand I have the impression that something went deeply wrong here.]])
    .. paragraphdivider() ..
    -- TRANSLATORS: Amalea
    _([[Have a look on the economy. There is nearly no productivity. Who ever managed our country while we were absent, created a huge mess. I'm not quite sure how we can fix this, if at all possible.]])),

    posy=1,
}

amalea_1 = {
   title=_"Amalea investigates",
   body= amalea2(_"Amalea is nodding thougtfully…",
      -- TRANSLATORS: Amalea
      _([[Lutius, in my opinion this will be a very difficult challenge again. But I'm afraid, we're doomed to manage this situation. To make things even worse I discovered a bad issue in our warehouses. They're empty. You can hardly find a grain of dust left in there: No wares, no tools, no workers and no soldiers as well.]])
      .. paragraphdivider() ..
      -- TRANSLATORS: Amalea
      _([[So, first of all we need some building materials to start correcting the mistakes made by the infamous secretary. I think we should try to dismantle the unproductive small buildings to collect their leftover building materials and regain them in our headquarters. As far as I can see now the fisherman's huts and the quarries don't have any resources available. The lumberjack's houses and the well additionally seem to be unefficient and worn out.]])
      .. paragraphdivider() ..
      -- TRANSLATORS: Amalea
      _([[Additionally we should restrict the input of all buildings which consume any of our building materials to zero. Or maybe we could even pause the production in all bigger buildings and get the workers some rest until we have produced some of their input wares.]]))
      .. new_objectives(obj_dismantle_buildings),
   posy=1,
   h=500,
}

amalea_2 = {
   title=_"Amalea has bad news",
   body= amalea3(_"Amalea recommends…",
      -- TRANSLATORS: Amalea
      _([[Brother, I'm really worried to deliver bad news again. As you can see our farms have no productivity and we can't dismantle them. Only destroying them is possible.]])
      .. paragraphdivider() ..
      -- TRANSLATORS: Amalea
      _([[This is caused by the sad fact that our people has lost the plans about how to construct and operate a farm. For this reason they have zero productivity and the constructors don't know how to dismantle them either.]])
	  .. paragraphdivider() ..
      -- TRANSLATORS: Amalea
      _([[So we urgently need to recover the plans regarding the construction and operation of farms. One older constructor told me that they might have been concealed in a cave in the hills east of our border.]]))
	  .. new_objectives(obj_find_farm_plans),
   posy=1,
   h=500,
}

amalea_3 = {
   title=_"Amalea looks confident",
   body= amalea2(_"Amalea is more confident",
      -- TRANSLATORS: Amalea
      _([[Lutius, now we have some options. As we have gained some construction materials we can start to rebuild our economy.]])
      .. paragraphdivider() ..
      -- TRANSLATORS: Amalea
      _([[First of all we need more construction materials. So we should build at least 3 lumberjack's houses and 2 quarries.]])
      .. paragraphdivider() ..
      -- TRANSLATORS: Amalea
      _([[Oh, before I forget, there is another task to accomplish. While our builders are doing their job, somebody should clear the mess in our road network in the meantime. The messy chaos is wasting so many building sites.]]))
      .. new_objectives(obj_build_quarries_and_lumberjacks, obj_clear_roads),
   posy=1,
   h=500,
}

amalea_4 = {
   title=_"Amalea is somewhat relieved",
   body= amalea2(_"Amalea is giving a deep sigh…",
      -- TRANSLATORS: Amalea
      _([[Praise the gods, Lutius. We have found the plans how to build and operate a farm.]])
      .. paragraphdivider() ..
      -- TRANSLATORS: Amalea
      _([[Now we can start to build farms to produce some beer which our miners need so desperatly.]])
      .. paragraphdivider() ..
      -- TRANSLATORS: Amalea
      _([[But I'm afraid that this problem hasn't been the last in our economy.]])),
   posy=1,
   h=500,
}

amalea_5 = {
   title=_"Amalea has good news",
   body= amalea2(_"Amalea smiles for the first time in weeks…",
      -- TRANSLATORS: Amalea
      _([[Lutius, well done so far. I just got the news that we have finished the basic buildings to get some construction materials.]])
      .. paragraphdivider() ..
      -- TRANSLATORS: Amalea
      _([[This is offering us more options to get the mess in our economy solved.]])
      .. paragraphdivider() ..
      -- TRANSLATORS: Amalea
      _([[I really think we can start to look forward into our future now. I pray that we can make ourselves comfortable in our homeland again.]])
      .. paragraphdivider() ..
      -- TRANSLATORS: Amalea
      _([[But this will be still hard work. For now we should start to find some fish and build some huts for our fishermen. As all the fish has been caught at our coast we should try our luck in the eastern part of our territory.]])
      .. paragraphdivider() ..
      -- TRANSLATORS: Amalea
      _([[After we have managed this we could start making rations in our tavern.]]))
      .. new_objectives(obj_produce_fish),
   posy=1,
   h=500,
}

amalea_6 = {
   title=_"Amalea is pleased",
   body= amalea3(_"Amalea is nodding her head…",
      -- TRANSLATORS: Amalea
      _([[Well done. Well done. Now our road network looks a lot more structured than before.]])
      .. paragraphdivider() ..
      -- TRANSLATORS: Amalea
      _([[Now we can focus on rebuilding our economy.]])),
   posy=1,
   h=400,
}

amalea_7 = {
   title=_"Amalea shakes her head",
   body= amalea2(_"Amalea is getting fed up with all the problems in this economy…",
      -- TRANSLATORS: Amalea
      _([[Brother for the sake of Neptune, I just discovered another problem. It seems that really very few things are working as expected in this economy.]])
      .. paragraphdivider() ..
	  -- TRANSLATORS: Amalea
      _([[One of our lumberjacks told me that the reproduction of our forests is far behind his experience and expectations. So I had a deep look on our foresters effectiveness.]])
      .. paragraphdivider() ..
	  -- TRANSLATORS: Amalea
      _([[And guess what? They are very old. Their houses and tools are worn and their seed is degenerated. For this reason they need much more time to plant a tree then usual.]])
      .. paragraphdivider() ..
	  -- TRANSLATORS: Amalea
      _([[The only solution is to build 2 new forester's houses near our lumberjacks. Be sure to first build a new forester's house and then eventually destroy the old one or at least expel the forester to change houses. Dismantling them is also possible but will not return any wares because they are so torn.]]))
	  .. new_objectives(obj_replace_foresters),
   posy=1,
   h=500,
}

amalea_8 = {
   title=_"Amalea laughs sarcastic",
   body= amalea1(_"Amalea is laughing sarcastically…",
      -- TRANSLATORS: Amalea
      _([[Well, Lutius, we have just solved another weird behaviour in our economy. Now our lumberjacks would be supplied with enough wood to enhance our economy.]])
      .. paragraphdivider() ..
	  -- TRANSLATORS: Amalea
      _([[I am really very curious what will go wrong next.]])),
   posy=1,
}

amalea_9 = {
   title=_"Amalea shrugs her shoulders",
   body= amalea3(_"Amalea is getting used to bad news…",
      -- TRANSLATORS: Amalea
      _([[Alright Lutius, here is another problem: After the production of some beer and some flour I found out that the technology in the mills and the breweries we have is somewhat outdated. This way they consume far too much resources.]])
      .. paragraphdivider() ..
	  -- TRANSLATORS: Amalea
      _([[And you wouldn't believe it, nobody knows how to improve the technology nor how to build more efficient buildings. I only heard there shall be a monastery in the north where the priestesses might know how to improve our technology.]])
      .. paragraphdivider() ..
	  -- TRANSLATORS: Amalea
      _([[But I'm not sure if they will give us their knowledge for free. Anyway, we have no choice. We need to find them to improve our economy.]]))
	  .. new_objectives(obj_find_monastery),
   posy=1,
   h=500,
}

amalea_10 = {
   title=_"Amalea looks happy",
   body= amalea2(_"Amalea comes in…",
      -- TRANSLATORS: Amalea
      _([[Brother, I think this is rather a fair offer. And some good will from any of our gods could be very helpful as well.]])
      .. paragraphdivider() ..
      -- TRANSLATORS: Amalea
      _([[The only problem might be, that it will take some time to collect all the wares. Especially, we will need to shorten the supply to our mines drastically, which gives us a drawback in metal production.]])),
   posy=1,
}


amalea_11 = {
   title=_"Amalea looks sad",
   body= amalea1(_"Amalea is really sad…",
      -- TRANSLATORS: Amalea
      _([[I’m not sure if that was the right thing to do. Yes, we have obtained the plans, but we will never know if and how Vesta and her sisters could have helped us against the Barbarians.]])
      .. paragraphdivider() ..
	  -- TRANSLATORS: Amalea
      _([[Furthermore we will have to live with the guilt of destroying a temple of an Empire god on our souls.]])),
   posy=1,
}

amalea_12 = {
   title=_"Amalea is very content",
   body= amalea2(_"Amalea is clapping her hands…",
      -- TRANSLATORS: Amalea
      _([[Well done. Now we are able to build more effective buildings to refine our wheat. And best of all we have a new ally who just provided us with lots of water, flour and beer. Now I really think that nothing can stop us to get stronger and conquer back our homeland.]])),
   posy=1,
}

amalea_13 = {
   title=_"Amalea is satisfied",
   body= amalea3(_"Amalea is satisfied with the progress…",
      -- TRANSLATORS: Amalea
      _([[Alright Lutius, another problem solved. Still more to come. As we are able to produce food now, we should immediatly start to mine some coal and iron ore. After all we need more tools to back up our economy and build more and different production sites.]])
      .. paragraphdivider() ..
	  -- TRANSLATORS: Amalea
      _([[But due to recent experience I assume that something is wrong with our mines as well. It's propably a good idea to send a geologist to check whether there are enough resources in the vicinity of our mines.]])
      .. paragraphdivider() ..
	  -- TRANSLATORS: Amalea
      _([[As soon as we have melted some iron we need to start to produce tools. Perhaps we should control the production of them via the economy settings. In the meantime we can start to build the buildings we need most urgently. I think we still miss a vineyard in our economy.]]))
	  .. new_objectives(obj_produce_tools),
   posy=1,
   h=500,
}

amalea_14 = {
   title=_"Amalea advising",
   body= amalea3(_"Amalea is providing economic advise…",
      -- TRANSLATORS: Amalea
      _([[Lutius, it seems that our coal supply is a little bit weak. So we need to expand and explore all mineable areas for more coal.]])
	  .. paragraphdivider() ..
      -- TRANSLATORS: Amalea
      _([[In the meantime it might help to build some charcoal kiln for buffering any mining shortfalls with charcoal. But be careful to ensure a continous log supply afterwards.]]))
      .. new_objectives(obj_charcoal),  
   posy=1,
   h=500,
}

amalea_15 = {
   title=_"Amalea is in a good manner",
   body= amalea2(_"Amalea is celebrating success…",
      -- TRANSLATORS: Amalea
      _([[Lutius. Another issue is solved. Now the charcoal will backup our metal industry and we can concentrate on our exploration and military strength.]])),
   posy=1,
}

amalea_16 = {
   title=_"Amalea thoughtful",
   body= amalea2(_"Amalea is sad about the news…",
      -- TRANSLATORS: Amalea
      _([[Lutius. I have bad news to report. One of our buildings was just destroyed due to a fireplace got uncontrolled. I fear this might be a sign of the goddess Vesta being still in a bad mood.]])),
   posy=1,
}

amalea_17 = {
   title=_"Amalea positively surprised",
   body= amalea2(_"Amalea is celebrating a happy event…",
      -- TRANSLATORS: Amalea
      _([[Lutius. I don't know how, but we have been gifted with some beer and wine. During our recent inventory taking we found the additional wares. Maybe the goddess Vesta is still supporting us.]])),
   posy=1,
}

amalea_18 = {
   title=_"Amalea analyses",
   body= amalea1(_"Amalea reminds…",
      -- TRANSLATORS: Amalea
      _([[Lutius. I just have analyzed our economy somewhat further. I think there might be a problem with our farms. They don't show any productivity although there is space enough to plant wheat.]])
      .. paragraphdivider() ..
      -- TRANSLATORS: Amalea
      _([[I think we should have a deeper look into the issue and open the Building window of one of them.]])),
   posy=1,
}

amalea_19 = {
   title=_"Amalea's restrictions",
   body= amalea1(_"Amalea restricted building possibilities…",
      -- TRANSLATORS: Amalea
      _([[Lutius. The most critical ressource in the current state of our economy is wood.]])
      .. paragraphdivider() ..
      -- TRANSLATORS: Amalea
      _([[Therefore I took the freedom to restrict our current buildingoptions to the lumberjack's house until we have dismantled all necessary small buildings.]])),
   posy=1,
}

   
-- Saledus

saledus = {
    title=_"Military Strength",
    body= saledus2(_"Saledus looks very relaxed…",
       -- TRANSLATORS: Saledus
       _([[Sire, it is really a great pleasure to be at home again. And the best of all things: I can see we still have some military strength. I can count five towers and a fortress in our vicinity to guard us.]])),
    posy=1,
}

saledus_1 = {
   title=_"We could use the military instead",
   body= saledus2(_"Saledus raises his hand…",
      -- TRANSLATORS: Saledus
      _([[Sire, If we need to get the technology very quickly why not conquer it. We could defeat the little monastery in an instant.]])
	  .. paragraphdivider() ..
      -- TRANSLATORS: Saledus
      _([[The only problem might be that probably the gods will not be that amused if we destroy a temple of them. And you never know what this could lead to.]]))
      .. new_objectives(obj_deal_with_vesta),  
   posy=1,
   h=500,
}

saledus_2 = {
   title=_"Easy victory",
   body= saledus3(_"Saledus cheering proudly…",
      -- TRANSLATORS: Saledus
      _([[Sire, our armies just swept over the priests and conquered the plans. That was rather an easy victory.]])),
   posy=1,
}

saledus_3 = {
   title=_"Defiance",
   body= saledus2(_"Saledus is keeping his point…",
      -- TRANSLATORS: Saledus
      _([[Sire, I admit this has been proven to be a very good deal. But we could have had the plans much earlier. Anyhow we will not be able to make any deals with the Barbarians, so we better keep our soldiers in a good mood and train them adequately.]])),
   posy=1,
}

saledus_4 = {
   title=_"Pride",
   body= saledus2(_"Saledus is keeping his point…",
      -- TRANSLATORS: Saledus
      _([[Sire, I admit that we have accumulated some bad karma, but in wartime sometimes the end justifies the means. And we won't be able to make any deals with the Barbarians either, so we better keep our soldiers in good mood and train them adequately.]])),
   posy=1,
}


saledus_5 = {
   title=_" Military Strength",
   body= saledus2(_"Saledus is asking for a stronger army…",
      -- TRANSLATORS: Saledus
      _([[Now that we have produced some tools, I think it is time to diverge some of our iron and coal to start some military production.]])
      .. paragraphdivider() ..
      -- TRANSLATORS: Saledus
      _([[I am really worried about the weakness of our army. We should start to increase our military power. For the beginning we should start to recruit at least 10 new soldiers.]])
	  .. paragraphdivider() ..
      -- TRANSLATORS: Saledus
      _([[Remember we need to produce wooden spears and helmets to recruit them in the barracks. Perhaps we could start to train them in the arena as well.]]))
	  .. new_objectives(obj_recruit_soldiers),
   posy=1,
   h=500,
}

saledus_6 = {
   title=_"Training is needed",
   body= saledus3(_"Saledus still has security concerns…",
      -- TRANSLATORS: Saledus
      _([[Sire, although we have started to recruit new soldiers we still need to train them well. It is important to increase the strength of our soldiers as fast as we can.]])
      .. paragraphdivider() ..
      _([[Unfortunately we only have an arena and a very old and small training camp with very little storage capacity. And guess what none of our builders knows how to improve this. But we need to use what we have to get prepared for battle.]]))
	  .. new_objectives(obj_training),
   posy=1,
   h=500,
}

saledus_7 = {
   title=_"Praise the army of the empire",
   body= saledus2(_"Saledus is happy…",
      -- TRANSLATORS: Saledus
      _([[Sire, after training a bunch of recruits our trainers together with our builders developed better and more efficient training buildings.]])
      .. paragraphdivider() ..
      _([[Now we could really improve our army and build the military strength that we will need to defend our country.]]))
	  .. new_objectives(obj_upgrade),
   posy=1,
   h=500,
}

saledus_8 = {
   title=_"We just need another hero",
   body= saledus4(_"Saledus is in a good mood…",
      -- TRANSLATORS: Saledus
      _([[Sire, after we now have more and better beer together with enhanced training facilities we should be able to train as much heroes as we can.]])
      .. paragraphdivider() ..
      _([[It will give us great advantage in battle if our soldiers are much more powerful than the Barbarians. So we need to spend our resources wisely to get heroes as soon as we can.]])
      .. paragraphdivider() ..
      _([[I would say for the beginning 3 fully trained heroes would be sufficient. But don't forget to send them to the frontline, cause they are not that useful back at home.]]))
	  .. new_objectives(obj_heroes),
   posy=1,
   h=500,
}

saledus_9 = {
   title=_"We should expell the Barbarians",
   body= saledus3(_"Saledus is excited…",
      -- TRANSLATORS: Saledus
      _([[Now that we have some fully trained soldiers it is time to expell the Barbarians of our homeland.]])
      .. paragraphdivider() ..
      _([[Let's finish them off and regain control over our lands. They should regret deeply they ever came.]]))
      .. new_objectives(obj_conquer_all),
   posy=1,
   h=500,
}   
   
saledus_10 = {
   title=_"Victory is our's",
   body= saledus2(_"Saledus is cheering out…",
      -- TRANSLATORS: Saledus
      _([[Sire, finally we have defeated the Barbarians. We have expelled even the last of them. May they never come back.]])
      .. paragraphdivider() ..
      _([[Now it is time to find out why this big mess around could have happened. But first of all we should have a beer or two to celebrate our victory and our newfound freedom.]])),
   posy=1,
}

saledus_11 = {
   title=_"The enemy is near...",
   body= saledus3(_"Saledus is alerted…",
      -- TRANSLATORS: Saledus
      _([[Sire. Although we have not enough fully trained soldiers yet, we just have made contact with the enemy.]])
      .. paragraphdivider() ..
      _([[We shall finish them off and regain control over our lands. They should regret deeply they ever came.]]))
      .. new_objectives(obj_conquer_all),
   posy=1,
   h=500,
}  



-- Vesta

vesta_0 = {
   title=_"Worship to be gifted",
   body= vesta(_"Vesta is demanding a sacrifice for the gods...",
      -- TRANSLATORS: Vesta
      _([[Ave Lutius. If you want us to help you, you first have to worship our gods. Therefore deliver 35 wheat and 15 wine to prepare a worthy sacrifice for our gods.]])),
   posy=1,
}

vesta_1 = {
   title=_"May the gods bless you",
   body= vesta(_"Vesta is blessing us...",
      -- TRANSLATORS: Vesta
      _([[Ave Lutius. You have served our gods well. You will not only be gifted with the improvements to your technology but with some goods that you could use so daringly as well. Furthermore we will pray for you and join your party to safeguard our land from the Barbarians.]])),
   posy=1,
}

vesta_2 = {
   title=_"Damn you...",
   body= vesta(_"Vesta is cursing us...",
      -- TRANSLATORS: Vesta
      _([[Damn you Lutius, for killing peacefull sisters of the goddess vesta. May your life and your land be cursed and may the wrath of the goods diminish your family from the earth.]])),
   posy=1,
}

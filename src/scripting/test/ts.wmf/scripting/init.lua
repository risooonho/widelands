require 'lunit'

lunit.setprivfenv()
lunit.import "assertions"

-- =======================================================================
--                                Field test                               
-- =======================================================================
field_tests = lunit.TestCase("Field creation")
function field_tests:test_create()
   c = wl.map.Field(25,32)
   assert_equal(c.x, 25)
   assert_equal(c.y, 32)
end
function field_tests:test_create_xistobig()
   assert_error("x should be too big", function() wl.map.Field(64, 23) end)
end
function field_tests:test_create_yistobig()
   assert_error("y should be too big", function() wl.map.Field(25, 64) end)
end
function field_tests:test_create_xisnegativ()
   assert_error("x is negativ", function() wl.map.Field(-12, 23) end)
end
function field_tests:test_create_yisnegativ()
   assert_error("y is negativ", function() wl.map.Field(25, -12) end)
end
function field_tests:test_direct_change_impossible()
   assert_error("c.x should be read only", function() c.x = 12 end) 
   assert_error("c.y should be read only", function() c.y = 12 end) 
end
function field_tests:test_r_neighbour()
   c = wl.map.Field(25,40)
   assert_equal(wl.map.Field(26,40), c.rn)
   c = wl.map.Field(63,40)
   assert_equal(wl.map.Field(0,40), c.rn)
end
function field_tests:test_l_neighbour()
   c = wl.map.Field(25,40)
   assert_equal(wl.map.Field(24,40), c.ln)
   c = wl.map.Field(0,40)
   assert_equal(wl.map.Field(63,40), c.ln)
end
function field_tests:test_trn_neighbour()
   c = wl.map.Field(25,40)
   assert_equal(wl.map.Field(25,39), c.trn)
   assert_equal(wl.map.Field(26,38), c.trn.trn)
   assert_equal(wl.map.Field(26,37), c.trn.trn.trn)
   c = wl.map.Field(0,0)
   assert_equal(wl.map.Field(0,63), c.trn)
   assert_equal(wl.map.Field(1,62), c.trn.trn)
   assert_equal(wl.map.Field(1,61), c.trn.trn.trn)
end
function field_tests:test_tln_neighbour()
   c = wl.map.Field(25,40)
   assert_equal(wl.map.Field(24,39), c.tln)
   assert_equal(wl.map.Field(24,38), c.tln.tln)
   assert_equal(wl.map.Field(23,37), c.tln.tln.tln)
   c = wl.map.Field(1,1)
   assert_equal(wl.map.Field(1,0), c.tln)
   assert_equal(wl.map.Field(0,63), c.tln.tln)
   assert_equal(wl.map.Field(0,62), c.tln.tln.tln)
end
function field_tests:test_bln_neighbour()
   c = wl.map.Field(26,37)
   assert_equal(wl.map.Field(26,38), c.bln)
   assert_equal(wl.map.Field(25,39), c.bln.bln)
   assert_equal(wl.map.Field(25,40), c.bln.bln.bln)

   c = wl.map.Field(1,61)
   assert_equal(wl.map.Field(1,62), c.bln)
   assert_equal(wl.map.Field(0,63), c.bln.bln)
   assert_equal(wl.map.Field(0,0), c.bln.bln.bln)
end
function field_tests:test_brn_neighbour()
   c = wl.map.Field(35,22)
   assert_equal(wl.map.Field(35,23), c.brn)
   assert_equal(wl.map.Field(36,24), c.brn.brn)
   assert_equal(wl.map.Field(36,25), c.brn.brn.brn)

   c = wl.map.Field(63,63)
   assert_equal(wl.map.Field(0,0), c.brn)
   assert_equal(wl.map.Field(0,1), c.brn.brn)
   assert_equal(wl.map.Field(1,2), c.brn.brn.brn)
end
function field_tests:test_equality()
   c = wl.map.Field(32,33)
   c1 = wl.map.Field(32,33)

   assert_equal(c,c1)
end
function field_tests:test_inequality()
   c = wl.map.Field(32,33)
   c1 = wl.map.Field(33,32)

   assert_not_equal(c,c1)
end
function field_tests:test_getting_height()
   assert_equal(10, wl.map.Field(32,33).height)
end
function field_tests:test_setting_height()
   f = wl.map.Field(32,33)
   f.height = 12
   assert_equal(12, wl.map.Field(32,33).height)
   f.height = 10
end
function field_tests:test_setting_illegal_negativ_height()
   assert_error("height must be positive", function()
      wl.map.Field(50,40).height =  -12
   end)
end
function field_tests:test_setting_illegal_too_big_height()
   assert_error("height must be <= 60", function()
      wl.map.Field(50,40).height = 61
   end)
end
function field_tests:test_getting_terr()
   assert_equal("steppe", wl.map.Field(50,40).terr)
end
function field_tests:test_getting_terd()
   assert_equal("steppe", wl.map.Field(50,40).terd)
end
function field_tests:test_setting_terr()
   f = wl.map.Field(50,40)
   f.terr = "wasser"
   assert_equal("wasser", f.terr)
   f.terr = "steppe"
end
function field_tests:test_setting_terd()
   f = wl.map.Field(50,40)
   f.terd = "wasser"
   assert_equal("wasser", f.terd)
   f.terd = "steppe"
end
function field_tests:test_region_radius_zero()
   f = wl.map.Field(50,40)
   list = f:region(0)
   assert_equal(1, #list)
   assert_equal(f, list[1])
end
function field_tests:test_region_radius_one()
   f = wl.map.Field(50,40)
   list = f:region(1)
   assert_equal(7, #list)
end
function field_tests:test_hollow_region_radius_one()
   f = wl.map.Field(50,40)
   list = f:region(2,1)
   assert_equal(13, #list)
end




-- =======================================================================
--                         BaseImmovable Usage Tests                          
-- =======================================================================

-- ====================
-- Creation & Deletion 
-- ====================
-- Note: these next functions implicitly also check that inheritance
-- works because serial is a property of a MapObject.
immovable_creation_tests = lunit.TestCase("Immovable Creation")
function immovable_creation_tests:test_create()
   imm = wl.map.create_immovable("tree1", wl.map.Field(9, 10))
   imm2 = wl.map.create_immovable("tree2", wl.map.Field(10, 10))
   assert_table(imm) 
   assert_table(imm2)
   assert_true(imm.serial > 0)
   assert_true(imm2.serial > 0)
   assert_true(imm2.serial > imm.serial)

   imm:remove()
   imm2:remove()
end
function immovable_creation_tests:test_create_wrong_usage()
   assert_error("Needs table, not integer", function() 
      wl.map.create_immovable("tree1", 9, 10) end)
end


-- ===================
-- Simple usage tests 
-- ===================
immovable_tests = lunit.TestCase("Immovable usage")
function immovable_tests:setup()
   self.i = wl.map.create_immovable("tree1", wl.map.Field(9, 10))
end
function immovable_tests:teardown()
   pcall(self.i.remove, self.i)
end

function immovable_tests:test_wrongusage()
   self.i:remove()
   assert_error("Should not be able to remove an object twice!",
      function() self.i:remove() end 
   )
end
function immovable_tests:test_serial_is_readonly()
   assert_error("Serial should be read only", function() self.i.serial = 12 end)
end
function immovable_tests:test_field_access()
   f = wl.map.Field(9,10)
   assert_equal("tree1", f.immovable.name)
end
function immovable_tests:test_map_object_equality()
   f = wl.map.Field(9,10)
   assert_equal(self.i, f.immovable)
end
function immovable_tests:test_field_immovable_nil_when_not_set()
   f = wl.map.Field(10,10)
   assert_equal(nil, f.immovable)
end
function immovable_tests:test_field_immovable_is_read_only()
   f = wl.map.Field(10,10)
   assert_error("f.immovable should be read only!", function()
      f.immovable = self.i
   end)
end


-- ==============
-- Property tests 
-- ==============
immovable_property_tests = lunit.TestCase("Immovable sizes")
function immovable_property_tests:setup()
   self.none = wl.map.create_immovable("pebble1", wl.map.Field(9, 10))
   self.small = wl.map.create_immovable("tree1", wl.map.Field(10, 10))
   -- No medium bob in world. Need a user immovable here!!! TODO
   -- self.medium = wl.map.create_immovable("tree1", 10, 10)
   self.big = wl.map.create_immovable("stones4", wl.map.Field(15, 10))
end
function immovable_property_tests:teardown()
   pcall(self.none.remove, self.none)
   pcall(self.small.remove, self.small)
   -- pcall(self.medium.remove, self.medium)
   pcall(self.big.remove, self.big)
end

function immovable_property_tests:test_size_none()
   assert_equal("none", self.none.size)
end
function immovable_property_tests:test_size_small()
   assert_equal("small", self.small.size)
end
function immovable_property_tests:test_size_big()
   assert_equal("big", self.big.size)
end
function immovable_property_tests:test_name_pebble()
   assert_equal("pebble1", self.none.name)
end
function immovable_property_tests:test_nsme_tree()
   assert_equal("tree1", self.small.name)
end
function immovable_property_tests:test_name_stone()
   assert_equal("stones4", self.big.name)
end

function immovable_property_tests:test_name_stone()
   assert_equal("stones4", self.big.name)
end

-- ====================
-- Find immovables test
-- ====================
-- find_immovables = lunit.TestCase("Find immovables")
-- function immovable_property_tests:teardown()
--    pcall(self.none.remove, self.none)
--    pcall(self.small.remove, self.small)
--    -- pcall(self.medium.remove, self.medium)
--    pcall(self.big.remove, self.big)
-- end

-- function immovable_tests:test_position()
--   assert_equal(self.i.pos.x, 9)
--   assert_equal(self.i.pos.y, 10)
--end

-- ===========
-- Player test 
-- ===========
player_tests = lunit.TestCase("Player tests sizes")
function player_tests:test_number_property()
   assert_equal(1, wl.game.Player(1).number)
end
function player_tests:test_number_property2()
   assert_equal(2, wl.game.Player(2).number)
end
-- TODO: test accessing illegal values for Player

function player_tests:test_create_flag()
   f = wl.map.Field(10,10)
   k = wl.game.Player(1):place_flag(f, true)
   assert_equal(k.player.number, 1)
   k:remove()
   -- TODO: this test doesn't clean up after itself: the player remains owner
   -- TODO: of the field
end
-- This test is currently disabled because of issue #2938438
-- function player_tests:test_create_flag2()
--    f = wl.map.Field(20,10)
--    k = wl.game.Player(2):place_flag(f, true)
--    assert_equal(k.player.number, 2)
--    k:remove()
--    -- TODO: this test doesn't clean up after itself: the player remains owner
--    -- TODO: of the field
-- end
-- TODO: set non forcing placement of flags

function player_tests:test_force_building()
   f = wl.map.Field(10,10)
   k = wl.game.Player(1):place_building("headquarters", f)
   assert_equal(1, k.player.number)
   assert_equal("warehouse", k.building_type)
   k:remove()
   -- TODO: this test doesn't clean up after itself: the player remains owner
   -- TODO: of the field
end

-- =========================
-- Warehouses Functionality 
-- =========================
warehouse_tests = lunit.TestCase("warehouse tests")
function warehouse_tests:setup()
   self.f = wl.map.Field(10,10)
   self.p = wl.game.Player(1)
   self.w = self.p:place_building("headquarters", f)
end
function warehouse_tests:teardown()
   pcall(self.w.remove, self.w)
   -- TODO: these tests do not clean up after itself: the player remains owner
   -- TODO: of the field
end

function warehouse_tests:test_upcasting_from_immovable_to_building()
   i = self.f.immovable
   assert_equal(i, self.w)
   assert_function(i.set_wares) -- set_wares is non nil
end

function warehouse_tests:test_set_ware_illegal_ware()
   function ill()
      self.w:set_wares("sdjsgfhg", 100)
   end
   assert_error("Illegal ware should throw an error!", ill)
end
function warehouse_tests:test_set_get_wares_string_arg()
   assert_equal(0, self.w:get_wares("trunk"))
   self.w:set_wares("trunk", 190)
   assert_equal(190, self.w:get_wares("trunk"))
end
function warehouse_tests:test_set_get_wares_table_arg()
   k = self.w:get_wares{"trunk", "raw_stone"}
   assert_equal(0, k.trunk)
   assert_equal(0, k.raw_stone)
   self.w:set_wares{trunk=190, raw_stone=170}
   k = self.w:get_wares{"trunk", "raw_stone"}
   assert_equal(190, k.trunk)
   assert_equal(170, k.raw_stone)
end
function warehouse_tests:test_set_get_wares_set_is_not_increase()
   k = self.w:get_wares{"trunk", "raw_stone"}
   k.trunk = 20
   k.raw_stone = 40
   self.w:set_wares(k)
   k = self.w:get_wares{"trunk", "raw_stone"}
   assert_equal(20, k.trunk)
   assert_equal(40, k.raw_stone)

   k.trunk = 10
   k.raw_stone = 20
   self.w:set_wares(k)
   k = self.w:get_wares{"trunk", "raw_stone"}
   assert_equal(10, k.trunk)
   assert_equal(20, k.raw_stone)
end

function warehouse_tests:test_set_worker_illegal_worker()
   function ill()
      self.w:set_workers("sdjsgfhg", 100)
   end
   assert_error("Illegal worker should throw an error!", ill)
end
function warehouse_tests:test_set_get_workers_string_arg()
   assert_equal(0, self.w:get_workers("builder"))
   self.w:set_workers("builder", 190)
   assert_equal(190, self.w:get_workers("builder"))
end
function warehouse_tests:test_set_get_workers_table_arg()
   k = self.w:get_workers{"builder", "lumberjack"}
   assert_equal(0, k.builder)
   assert_equal(0, k.lumberjack)
   self.w:set_workers{builder=190, lumberjack=170}
   k = self.w:get_workers{"builder", "lumberjack"}
   assert_equal(190, k.builder)
   assert_equal(170, k.lumberjack)
end
function warehouse_tests:test_set_get_workers_set_is_not_increase()
   k = self.w:get_workers{"builder", "lumberjack"}
   k.builder = 20
   k.lumberjack = 40
   self.w:set_workers(k)
   k = self.w:get_workers{"builder", "lumberjack"}
   assert_equal(20, k.builder)
   assert_equal(40, k.lumberjack)

   k.builder = 10
   k.lumberjack = 20
   self.w:set_workers(k)
   k = self.w:get_workers{"builder", "lumberjack"}
   assert_equal(10, k.builder)
   assert_equal(20, k.lumberjack)
end

-- ===================
-- Flag functionality 
-- ===================
flag_tests = lunit.TestCase("flag tests")
function flag_tests:setup()
   self.p = wl.game.Player(1)
   self.f = self.p:place_flag(wl.map.Field(13,10), 1)
end
function flag_tests:teardown()
   pcall(self.f.remove, self.f)
end

function flag_tests:test_add_ware_illegal_ware()
   function ill()
      self.f:add_ware("kjhsh")
   end
   assert_error("Illegal ware", ill)
end
function flag_tests:test_add_too_many_wares()
   for i=1,7 do self.f:add_ware("trunk") end
   self.f:add_ware("raw_stone") -- should be fine

   function one_more() self.f:add_ware("trunk") end
   assert_error("Should be too much", one_more)
end
function flag_tests:test_add_ware()
   self.f:add_ware("trunk")
   -- TODO: there is currently no way to check if this is alright
end

for n,v in pairs(_G) do
   print (n,v)
end

wl.debug.set_see_all(1)

rv = lunit:run()
if rv == 0 then -- No errors in the testsuite. Exit the game
   wl.debug.exit()
end


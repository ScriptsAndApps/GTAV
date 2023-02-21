local function mpx() return stats.get_int("MPPLY_LAST_MP_CHAR") end
local RefIn=107	--Refill Inventory, Numpad+
local function refillInventory()
	stats.set_int("MP"..mpx().."_NO_BOUGHT_YUM_SNACKS", 30)
	stats.set_int("MP"..mpx().."_NO_BOUGHT_HEALTH_SNACKS", 15)
	stats.set_int("MP"..mpx().."_NO_BOUGHT_EPIC_SNACKS", 5)
	stats.set_int("MP"..mpx().."_NUMBER_OF_ORANGE_BOUGHT", 10)
	stats.set_int("MP"..mpx().."_NUMBER_OF_BOURGE_BOUGHT", 10)
	stats.set_int("MP"..mpx().."_NUMBER_OF_CHAMP_BOUGHT", 5)
	stats.set_int("MP"..mpx().."_CIGARETTES_BOUGHT", 20)
	stats.set_int("MP"..mpx().."_MP_CHAR_ARMOUR_5_COUNT", 10)
	stats.set_int("MP"..mpx().."_BREATHING_APPAR_BOUGHT", 20)
end
menu.register_hotkey(RefIn, refillInventory)
menu.add_action("Refill Inventory (Numpad+)", refillInventory)
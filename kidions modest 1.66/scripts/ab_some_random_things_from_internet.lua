local subb = menu.add_submenu("-- random items from interwebs --")


 subb:add_toggle("disable engine auto stop", function()
    	if localplayer == nil then
    		return nil
    	end
     
    	return localplayer:get_config_flag(241)
    end, function(value)
    	localplayer:set_config_flag(241, value)
    end)

    subb:add_toggle("freeze player", function()
    	if localplayer == nil then
    		return nil
    	end
     
    	return localplayer:get_config_flag(292)
    end, function(value)
    	localplayer:set_config_flag(292, value)
    end)
     
    subb:add_toggle("attack friendlies", function()
    	if localplayer == nil then
    		return nil
    	end
     
    	return localplayer:get_config_flag(140)
    end, function(value)
    	localplayer:set_config_flag(140, value)
    end)





     local function GetPickupHash()
    	for p in replayinterface.get_pickups() do
    		if p ~= nil then
    			return p:get_pickup_hash()
    		end
    	end
    end
     
    local function GetPickupModelHash()
    	for p in replayinterface.get_pickups() do
    		if p ~= nil then
    			return p:get_model_hash()
    		end
    	end
    end
     
    local function SetPickupHash(value)
    	--stub
    end
     
    local function SetPickupModelHash(value)
    	--stub
    end
     
    subb:add_int_range("PickupHash", 1, -2140000000, 2140000000, GetPickupHash, SetPickupHash)
    subb:add_int_range("PickupModelHash", 1, -2140000000, 2140000000, GetPickupModelHash, SetPickupModelHash)





local function TeleportMoneyPickupsToMe()
	for p in replayinterface.get_pickups() do
		if p ~= nil and p:get_pickup_hash() == -31919185 then
			p:set_position(localplayer:get_position())
		end
	end
end
 
subb:add_action("TeleportMoneyPickupsToMe", TeleportMoneyPickupsToMe)

-- 1.66
subb:add_action("Trigger weazel bank shootout event", function()
        globals.set_int(262145 + 34058, 1) -- Tunable: ENABLE_MAZEBANKSHOOTOUT_DLC22022
        globals.set_int(2756257 + 3 + 1, 172)
        globals.set_int(2756257 + 2, 6)
    end)
	
subb:add_int_range("Bank Shootout Event ", 172, 0, 172, function()
return globals.get_int(2756259+3+1)
end, function(value)
globals.set_int(262145+34058, 1) -- ENABLE_MAZEBANKSHOOTOUT_DLC22022
globals.set_int(2756259+3+1, value)
globals.set_int(2756259+2, 6)
end)
	
	
	--1.66
	    local function mpxx()
    	return "MP" .. stats.get_int("MPPLY_LAST_MP_CHAR") .. "_"
    end
     
    subb:add_action("Unlock Festive Surprise", function()
    	stats.set_bool_masked(mpxx() .. "PSTAT_BOOL2", true, 7)  --  Free Vapid Clique
    	stats.set_bool_masked(mpxx() .. "PSTAT_BOOL2", true, 8)  --  Free Buzzard Attack Chopper
    	stats.set_bool_masked(mpxx() .. "PSTAT_BOOL2", true, 9)  --  Free Insurgent Pick-Up
    end)
     
    --  DC: Rockstar Dev Jr#4828 | UC: CheatChris
	

     
    subb:add_action("Unlock Go Go Monkey Blista", function()
    	stats.set_masked_int(mpxx() .. "BUSINESSBATPSTAT_INT380", 20, 40, 8)  --  Unlock for Go Go Monkey Blista
    end)
     
    --  DC: Rockstar Dev Jr#4828 | UC: CheatChris
	
	
	
	local STRKM52=52929;
subb:add_action("Crack Casino Fingerprint 1.64", function()
	local heist_script = script("fm_mission_controller")
	if heist_script and heist_script:is_active() then
		if heist_script:get_int(STRKM52) == 3 or heist_script:get_int(STRKM52) == 4 then
			heist_script:set_int(STRKM52, 5)
		end
	end
end)
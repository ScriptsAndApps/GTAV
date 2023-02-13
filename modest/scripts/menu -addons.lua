    menu.add_toggle("Snow", function()	
    	return globals.get_boolean(262145 + 4724) 
    end, function(value)
    	globals.set_boolean(262145 + 4724, value)
    end)

    menu.add_toggle("Tiny Player", function()	
    	if localplayer == nil then
    		return nil
    	end
     
    	return localplayer:get_config_flag(223)
    end, function(value)
    	localplayer:set_config_flag(223, value)
    end)


    function GetWeaponExplosionType()
    	localweapon = localplayer:get_current_weapon()
    	return localweapon:get_explosion_type()
    end
     
    function GetWeaponDamageType()
    	localweapon = localplayer:get_current_weapon()
    	return localweapon:get_damage_type()
    end
     
    function GetWeaponRange()
    	localweapon = localplayer:get_current_weapon()
    	return localweapon:get_range()
    end
     
    function SetWeaponExplosionType(value)
    	localweapon = localplayer:get_current_weapon()
    	if localweapon ~= nil then
    		localweapon:set_explosion_type(value)
    	end
    end
     
    function SetWeaponDamageType(value)
    	localweapon = localplayer:get_current_weapon()
    	if localweapon ~= nil then
    		localweapon:set_damage_type(value)
    	end
    end
     
    function SetWeaponRange(value)
    	localweapon = localplayer:get_current_weapon()
    	if localweapon ~= nil then
    		localweapon:set_range(value)
    	end
    end
     
    local original_explosion_type = -1
    local original_damage_type = -1
    local original_range = -1
     
    function IsAtomizer()
    	explosion_type = GetWeaponExplosionType()
    	return explosion_type == 70
    end
     
    function SetAtomizer(value)
    	if localplayer ~= nil and value then
    		ChangeWeaponStats(70, 5, 9999)
    	else
    		ResetWeaponStats()
    	end
    end
     
    function IsZeppelinBoom()
    	explosion_type = GetWeaponExplosionType()
    	return explosion_type == 37
    end
     
    function SetZeppelinBoom(value)
    	if localplayer ~= nil and value then
    		ChangeWeaponStats(37, 5, 9999)
    	else
    		ResetWeaponStats()
    	end
    end
     
    function ChangeWeaponStats(new_expl, new_type, new_range)
    	--save old values
    	original_explosion_type = GetWeaponExplosionType()
    	original_damage_type = GetWeaponDamageType()
    	original_range = GetWeaponRange()
    	--set new values
    	SetWeaponExplosionType(new_expl)
    	SetWeaponDamageType(new_type)
    	SetWeaponRange(new_range)
    end
     
    function ResetWeaponStats()
    	SetWeaponExplosionType(original_explosion_type)
    	SetWeaponDamageType(original_damage_type)
    	SetWeaponRange(original_range)
    end
     
    menu.add_toggle("Constant Atomizer", IsAtomizer, SetAtomizer)
    menu.add_toggle("HUGE Explosions", IsZeppelinBoom, SetZeppelinBoom)




function DropFireworks()
	PedDrop()
	
	execution_limit = 99
	i=0
	repeat
		for p in replayinterface.get_pickups() do
			if p == nil then
				goto continue
			end
		
			if p:get_amount() == 1337 then
				p:set_amount(20)
				p:set_pickup_hash(0x22B15640)
				p:set_position(localplayer:get_position())
				return
			end
		
			::continue::
			i=i+1
		end
	until i == execution_limit
end
 
menu.add_action("Drop Fireworks", DropFireworks)






    menu.add_toggle("limp", function()
    	if localplayer == nil then
    		return nil
    	end
     
    	return localplayer:get_config_flag(166)
    end, function(value)
    	localplayer:set_config_flag(166, value)
    end)
     
    menu.add_toggle("limp with weapon", function()
    	if localplayer == nil then
    		return nil
    	end
     
    	return localplayer:get_config_flag(187)
    end, function(value)
    	localplayer:set_config_flag(187, value)
    end)
     
    menu.add_toggle("disable engine auto stop", function()
    	if localplayer == nil then
    		return nil
    	end
     
    	return localplayer:get_config_flag(241)
    end, function(value)
    	localplayer:set_config_flag(241, value)
    end)
     
    menu.add_toggle("freeze player", function()
    	if localplayer == nil then
    		return nil
    	end
     
    	return localplayer:get_config_flag(292)
    end, function(value)
    	localplayer:set_config_flag(292, value)
    end)
     
    menu.add_toggle("attack friendlies", function()
    	if localplayer == nil then
    		return nil
    	end
     
    	return localplayer:get_config_flag(140)
    end, function(value)
    	localplayer:set_config_flag(140, value)
    end)



    menu.add_float_range("Street Race Multiplier", 1.0, 1, 50, function() 
    	return globals.get_float(262145 + 31118)
    end, function(value)
    	globals.set_float(262145 + 31118, value)
    end)
     
    menu.add_float_range("Pursuit Race Multiplier", 1.0, 1, 50, function() 
    	return globals.get_float(262145 + 31119)
    end, function(value)
    	globals.set_float(262145 + 31119, value)
    end)
     
    menu.add_float_range("Scramble Multiplier", 1.0, 1, 50, function() 
    	return globals.get_float(262145 + 31120)
    end, function(value)
    	globals.set_float(262145 + 31120, value)
    end)
     
    menu.add_float_range("Head2Head Multiplier", 1.0, 1, 50, function() 
    	return globals.get_float(262145 + 31121)
    end, function(value)
    	globals.set_float(262145 + 31121, value)
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
     
    menu.add_int_range("PickupHash", 1, -2140000000, 2140000000, GetPickupHash, SetPickupHash)
    menu.add_int_range("PickupModelHash", 1, -2140000000, 2140000000, GetPickupModelHash, SetPickupModelHash)




local function TeleportMoneyPickupsToMe()
	for p in replayinterface.get_pickups() do
		if p ~= nil and p:get_pickup_hash() == -31919185 then
			p:set_position(localplayer:get_position())
		end
	end
end
 
menu.add_action("TeleportMoneyPickupsToMe", TeleportMoneyPickupsToMe)









    menu.add_float_range("Street Race Multiplier", 1.0, 1, 50, function() 
    	return globals.get_float(262145 + 31118)
    end, function(value)
    	globals.set_float(262145 + 31118, value)
    end)
     
    menu.add_float_range("Pursuit Race Multiplier", 1.0, 1, 50, function() 
    	return globals.get_float(262145 + 31119)
    end, function(value)
    	globals.set_float(262145 + 31119, value)
    end)
     
    menu.add_float_range("Scramble Multiplier", 1.0, 1, 50, function() 
    	return globals.get_float(262145 + 31120)
    end, function(value)
    	globals.set_float(262145 + 31120, value)
    end)
     
    menu.add_float_range("Head2Head Multiplier", 40000.0, 1, 40000, function() 
    	return globals.get_float(262145 + 31121)
    end, function(value)
    	globals.set_float(262145 + 31121, value)
    end)

















    function GetWeaponExplosionType()
	    if localplayer ~= nil then 
			localweapon = localplayer:get_current_weapon()
			return localweapon:get_explosion_type()
		end 
		return 0
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
		    menu:max_all_ammo()
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
    menu.add_toggle("SHOOT HUGE Explosions", IsZeppelinBoom, SetZeppelinBoom)
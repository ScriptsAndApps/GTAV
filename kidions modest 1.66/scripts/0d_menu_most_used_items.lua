local subb = menu.add_submenu("-- Most used menu items--")

--------------------------------------------------------------------------------------------------
-- teleport to waypoint (better with history)
--------------------------------------------------------------------------------------------------
local function sqrt(i)
	return i^0.5
end
local function DistanceToSqr(vec1, vec2)
	return ((vec2.x - vec1.x)^2) + ((vec2.y - vec1.y)^2) + ((vec2.z - vec1.z)^2)
end
local function Distance(vec1, vec2)
	return sqrt(DistanceToSqr(vec1, vec2))
end
local lastwaypointlocation = vector3(0, 0, 0)
local function better_teleport_to_waypoint()

	if localplayer ~= nil then
	
		if lastwaypointlocation == vector3(0, 0, 0) then
		    local currentlocationn = localplayer:get_position()
			menu:teleport_to_waypoint()
			if currentlocationn ~= localplayer:get_position() then
				lastwaypointlocation = localplayer:get_position()
			end
		else
			if Distance(lastwaypointlocation,localplayer:get_position()) > 1 then
				local currentlocationn = localplayer:get_position()
				menu:teleport_to_waypoint()
				if currentlocationn == localplayer:get_position() then
					if not localplayer:is_in_vehicle() then
						localplayer:set_position(lastwaypointlocation)
					else
					    localplayer:get_current_vehicle():set_initial_drive_force(0)
					    localplayer:get_current_vehicle():set_initial_drive_max_flat_velocity(0)
						localplayer:get_current_vehicle():set_initial_drive_gears(0)	
						local carnow = localplayer:get_current_vehicle():get_position()

						
						localplayer:get_current_vehicle():set_position(carnow)
						localplayer:get_current_vehicle():set_position(lastwaypointlocation)								
						localplayer:get_current_vehicle():set_initial_drive_force(0)
					    localplayer:get_current_vehicle():set_initial_drive_max_flat_velocity(0)
						localplayer:get_current_vehicle():set_initial_drive_gears(0)	
						
						
						localplayer:get_current_vehicle():set_position(carnow)
						localplayer:get_current_vehicle():set_position(lastwaypointlocation)								
						localplayer:get_current_vehicle():set_initial_drive_force(0)
					    localplayer:get_current_vehicle():set_initial_drive_max_flat_velocity(0)
						localplayer:get_current_vehicle():set_initial_drive_gears(0)	
						
						
						localplayer:get_current_vehicle():set_position(carnow)
						localplayer:get_current_vehicle():set_position(lastwaypointlocation)								
						localplayer:get_current_vehicle():set_initial_drive_force(0)
					    localplayer:get_current_vehicle():set_initial_drive_max_flat_velocity(0)
						localplayer:get_current_vehicle():set_initial_drive_gears(0)	
						
						
						localplayer:get_current_vehicle():set_position(carnow)
						localplayer:get_current_vehicle():set_position(lastwaypointlocation)								
						localplayer:get_current_vehicle():set_initial_drive_force(0)
					    localplayer:get_current_vehicle():set_initial_drive_max_flat_velocity(0)
						localplayer:get_current_vehicle():set_initial_drive_gears(0)	
						
						
						localplayer:get_current_vehicle():set_position(carnow)
						localplayer:get_current_vehicle():set_position(lastwaypointlocation)								
						localplayer:get_current_vehicle():set_initial_drive_force(0)
					    localplayer:get_current_vehicle():set_initial_drive_max_flat_velocity(0)
						localplayer:get_current_vehicle():set_initial_drive_gears(0)	
						
					end

				else
					lastwaypointlocation = localplayer:get_position()
				end
			else
				local currentlocationn = localplayer:get_position()
				menu:teleport_to_waypoint()
				if currentlocationn ~= localplayer:get_position() then
					lastwaypointlocation = localplayer:get_position()
				end
			end
			
		end
		
	else
	    menu:teleport_to_waypoint()
	end

end ----

--F12 TelePort To WAYPOINT--
menu.register_hotkey(123, better_teleport_to_waypoint)
subb:add_action("Teleport to WAYPOINT (F12)",  better_teleport_to_waypoint)
--------------------------------------------------------------------------------------------------

--F11 TelePort To Objective--
menu.register_hotkey(122, function() menu:teleport_to_objective() end)
subb:add_action("Teleport to objective(F11)",  function() menu:teleport_to_objective() end)

--F10  inside person vehicle --
menu.register_hotkey(121, function()  menu:enter_personal_vehicle()  menu:retrieve_personal_vehicle() end)
subb:add_action("Get inside person vehicle (F10)",  function()  menu:enter_personal_vehicle()  menu:retrieve_personal_vehicle() end)

--F6 TelePort IN PERSONAL VEHICLE --
menu.register_hotkey(117,  function() menu:teleport_to_current_vehicle()  menu:retrieve_personal_vehicle() end)
subb:add_action("Teleport to person vehicle (F6)", function() menu:teleport_to_current_vehicle()  menu:retrieve_personal_vehicle() end)



--------------------------------------------------------------------------------------------------
-- teleport to center)
--------------------------------------------------------------------------------------------------

local function tp_ceneter()
	if localplayer ~= nil then
		if not localplayer:is_in_vehicle() then
			localplayer:set_position(vector3(-374,-126,38.67340851))
		else
			localplayer:get_current_vehicle():set_position(vector3(-374,-126,38.67340851))
		end
	end
end ----

--F7 TelePort To WAYPOINT--
menu.register_hotkey(118, tp_ceneter)
subb:add_action("Teleport to Customs (F7)",  tp_ceneter)
--------------------------------------------------------------------------------------------------


--F8 heal all --
menu.register_hotkey(119,  function() menu:heal_all() menu:heal_player()  menu:heal_vehicle() end)
subb:add_action("Heal all (F8)", function() menu:heal_all() menu:heal_player()  menu:heal_vehicle() end)


--F9 TelePort to PERSONAL VEHICLE --
--menu.register_hotkey(120,  function() menu:teleport_to_current_vehicle() end)
--subb:add_action("Teleport to person vehicle (F9)", function() menu:teleport_to_current_vehicle() end)
subb:add_action("refill ammo + upgrade", function() 


     if  localplayer ~= nil and localplayer:get_current_weapon() ~= nil then   
                -- rapid shots -- 
                localplayer:get_current_weapon():set_time_between_shots(0.1)
                localplayer:get_current_weapon():set_range(90000)
                localplayer:get_current_weapon():set_spread(0.1)
                localplayer:get_current_weapon():set_lock_on_range(10000)
                
                -- full ammo weapon --
                localplayer:get_current_weapon():set_current_ammo(localplayer:get_current_weapon():get_max_mp_ammo())
              
        end
end)
subb:add_action("menu.level_current_vehicle() ", function() menu:level_current_vehicle() end)
subb:add_action(" menu:deliver_personal_vehicle()  ", function() menu:deliver_personal_vehicle()  end)

 
subb:add_action("menu.kill_all_enemies()", function() menu:kill_all_enemies() end)
subb:add_action("menu.kill_all_mission_peds() ", function() menu:kill_all_mission_peds() end)
subb:add_action("menu.kill_all_mission_vehicles()", function() menu:kill_all_mission_vehicles() end)
subb:add_action("menu.kill_all_npcs()", function() menu:kill_all_npcs() end)
subb:add_action("menu.max_all_ammo()", function() menu:max_all_ammo() end)
subb:add_action("menu.deliver_personal_vehicle() ", function() menu:deliver_personal_vehicle()  end)
subb:add_action("menu.instant_bullshark()", function() menu:instant_bullshark()  end)
subb:add_action("menu.instant_minigun()", function() menu:instant_minigun() end)
subb:add_action("menu.detach_objects() ", function() menu:detach_objects()  end)

subb:add_action("menu.repair_online_vehicle() ", function() menu:repair_online_vehicle()  end)
subb:add_action("menu.remove_insurance_claims() ", function() menu:remove_insurance_claims()  end)
subb:add_action("menu.teleport_to_current_vehicle()", function() menu:teleport_to_current_vehicle()  end)
subb:add_action("menu.set_assisted_aim(true) ", function() menu:set_assisted_aim(true)  end)
subb:add_action("menu.set_big_map(true)", function() menu:set_big_map(true)  end)
subb:add_action("menu.deliver_kosatka()", function() menu:deliver_kosatka()  end)
subb:add_action("menu.clear_wanted_level()", function() menu:clear_wanted_level()  end)
subb:add_action("menu.retrieve_personal_vehicle() ", function() menu:retrieve_personal_vehicle() end)
subb:add_action(" menu.set_bribe_authorities(bool value)", function() menu:set_bribe_authorities(true)  end)
subb:add_action(" menu.set_cops_turn_blind_eye(bool value)", function() menu:set_cops_turn_blind_eye(true)  end)
subb:add_action(" menu.set_disable_vehicle_kick(bool value)", function() menu:set_disable_vehicle_kick(true)  end)
subb:add_action(" suicide_player()", function() menu:suicide_player() end)

-------------------------------------------------------------------------------------------------------
-- Add set wanted level -> advanced menu item showcase
-------------------------------------------------------------------------------------------------------

local Wanted_script_title = "Wanted Level"
local wantedlevel = 0
local function create_wanted_title()
    if wantedlevel > 0 then
           local l_Wanted_script_title = Wanted_script_title .. " | < " ..  wantedlevel .. " >"
	   return l_Wanted_script_title
    else
           local l_Wanted_script_title = Wanted_script_title .. " | < Clear >"
	   return l_Wanted_script_title
    end
end --End of function --
local function Wanted_script_clicked()
      if localplayer ~= nil then
              localplayer:set_wanted_level(wantedlevel)
      end
end --End of function --
local function Wanted_script_set_title()
    local l_Wanted_script_title = create_wanted_title()
    return l_Wanted_script_title 
end --End of function --
local function Wanted_script_next_item()
    if wantedlevel < 5 then
        wantedlevel = wantedlevel + 1
    end
    --Wanted_script_clicked()
    return create_wanted_title()
end --End of function --
local function Wanted_script_previous_item()
    if wantedlevel > 0 then
        wantedlevel = wantedlevel - 1
    end
    --Wanted_script_clicked()
    return create_wanted_title()
end --End of function --
subb:add_bare_item(Wanted_script_title, Wanted_script_set_title, function() Wanted_script_clicked()  return "Wanted Level | error" end, Wanted_script_previous_item, Wanted_script_next_item)

-------------------------------------------------------------------------------------------------------



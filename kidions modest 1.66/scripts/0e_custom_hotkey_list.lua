local subb = menu.add_submenu("-- All hotkeys list --")

subb:add_action("Nupad dell . > teleport with arrows", function() end)

subb:add_action("F1 > record", function() end)

subb:add_action("F2 > disable insta record", function() end)

subb:add_action("F3 > enable insta record", function() end)

subb:add_action("F4 > RefillBoost/undead off radar", function() end)

subb:add_action("F5 > hide/show menu", function() end)

subb:add_action("F6 > Get in Personal Vehicle", function() end)

subb:add_action("F7 > Teleport to Customs", function() end)
subb:add_action("F8 > Heal all", function() end)
subb:add_action("F9 > drop weapon ", function() end)
subb:add_action("F10 > Get in Personal Vehicle", function() end)
subb:add_action("F11 > teleport Objective", function() end)
subb:add_action("F12 > teleport Waypoint", function() end)

subb:add_action("Numpad+ > Refill Snacks", function() end)
subb:add_action("Pause|Break > EmptySession", function() end)
subb:add_action("Page_up > NewSession", function() end)

subb:add_action("Numpad9 >", function() end)
subb:add_action("Pagedown > ", function() end)





local function mpx() return stats.get_int("MPPLY_LAST_MP_CHAR") end




local GHk=144		--Godmode+ toggle hot key

local QTP=110				--QuickTP Toggle, Numpad Delete
local QTPf=38			--	TelePort Forward, Up Arrow key
local QTPu=39			--	TelePort Upward, Right Arrow key
local QTPd=40			--	TelePort rotation, Down Arrow key
local QTPrr=37			--	TelePort Downward, Left Arrow key

local function GD()
    GOD = localplayer:get_godmode()
    if localplayer ~=nil then 
        if not GOD then
            --if not localplayer:get_godmode() then localplayer:set_godmode(true) end
           -- if not localplayer:get_no_ragdoll() then localplayer:set_no_ragdoll(true) end
           -- if not localplayer:get_seatbelt() then localplayer:set_seatbelt(true) end
        else
            if localplayer:get_godmode() then localplayer:set_godmode(false) end
            if localplayer:get_no_ragdoll() then localplayer:set_no_ragdoll(false) end
            if localplayer:get_seatbelt() then localplayer:set_seatbelt(false) end
        end
    end 
end
menu.register_hotkey(GHk, function() GD() end)


local TPF, TPU, TPD ,TPR = nil, nil, nil, nil
local enable3 = true
local function TPup()
	if not enable3 then return end
    if localplayer ==nil then return end
	local newpos = localplayer:get_position() + vector3(0,0,2.5)
        
	if not localplayer:is_in_vehicle() then
		localplayer:set_position(newpos)
        localplayer:set_freeze_momentum(true) 
		localplayer:set_config_flag(292, true) -- PED_FLAG_FREEZE
		localplayer:set_config_flag(301, true) -- PED_FLAG_IS_STILL
		localplayer:set_position(newpos)
		sleep(0.2)
		localplayer:set_freeze_momentum(false) 
	    localplayer:set_config_flag(292, false) -- PED_FLAG_FREEZE
		localplayer:set_config_flag(301, false) -- PED_FLAG_IS_STILL
        
	else
            local acc = 5
                if localplayer:get_current_vehicle() ~= nil then 
                    if localplayer:get_current_vehicle():get_acceleration() > 0 then
                    acc=localplayer:get_current_vehicle():get_acceleration()
                    end
                     localplayer:get_current_vehicle():set_acceleration(0)
                    localplayer:get_current_vehicle():set_position(newpos)
                    localplayer:get_current_vehicle():set_acceleration(acc)
                end
    
	
	end
    
end

local function TPdn()
	if not enable3 then return end
     if not localplayer ==nil then return end
	local newpos = localplayer:get_position() + vector3(0,0,-2.5)
	if not localplayer:is_in_vehicle() then
		localplayer:set_position(newpos) 
        localplayer:set_freeze_momentum(true) 
		localplayer:set_config_flag(292, true) -- PED_FLAG_FREEZE
		localplayer:set_config_flag(301, true) -- PED_FLAG_IS_STILL
		localplayer:set_position(newpos)
		sleep(0.2)
		localplayer:set_freeze_momentum(false) 
	    localplayer:set_config_flag(292, false) -- PED_FLAG_FREEZE
		localplayer:set_config_flag(301, false) -- PED_FLAG_IS_STILL
	else
		  local acc = 5
                if localplayer:get_current_vehicle() ~= nil then 
                    if localplayer:get_current_vehicle():get_acceleration() > 0 then
                        acc=localplayer:get_current_vehicle():get_acceleration()
                    end
                     localplayer:get_current_vehicle():set_acceleration(0)
                    localplayer:get_current_vehicle():set_position(newpos)
                    localplayer:get_current_vehicle():set_acceleration(acc)
                end
    
	end
end

local function TPfr()
	if not enable3 then return end
     if localplayer ==nil then return end
    local newpos = localplayer:get_position() 
    local heading = localplayer:get_heading()
            
        newpos.x = newpos.x + heading.x * 10
        newpos.y = newpos.y + heading.y * 10
    
	if not localplayer:is_in_vehicle() then
		localplayer:set_position(newpos)  
        localplayer:set_freeze_momentum(true) 
		localplayer:set_config_flag(292, true) -- PED_FLAG_FREEZE
		localplayer:set_config_flag(301, true) -- PED_FLAG_IS_STILL
		localplayer:set_position(newpos)
		sleep(0.2)
		localplayer:set_freeze_momentum(false) 
	    localplayer:set_config_flag(292, false) -- PED_FLAG_FREEZE
		localplayer:set_config_flag(301, false) -- PED_FLAG_IS_STILL
	else
		  local acc = 5
                if localplayer:get_current_vehicle() ~= nil then 
                    if localplayer:get_current_vehicle():get_acceleration() > 0 then
                        acc=localplayer:get_current_vehicle():get_acceleration()
                    end
                     localplayer:get_current_vehicle():set_acceleration(0)
                    localplayer:get_current_vehicle():set_position(newpos)
                    localplayer:get_current_vehicle():set_acceleration(acc)
                end
    
	end
    
    -- 	menu.teleport_forward()
    
    
end

local function TProt()
	if not enable3 then return end
     if localplayer == nil then return end
    localplayer:set_rotation(localplayer:get_rotation()+ vector3(0.3,0,0))
    local newpos = localplayer:get_position() 
    local heading = localplayer:get_heading()
            
        newpos.x = newpos.x + heading.x * 1
        newpos.y = newpos.y + heading.y * 1
    	if not localplayer:is_in_vehicle() then
            localplayer:set_position(newpos)
			localplayer:set_freeze_momentum(true) 
		    localplayer:set_config_flag(292, true) -- PED_FLAG_FREEZE
			localplayer:set_config_flag(301, true) -- PED_FLAG_IS_STILL
			localplayer:set_position(newpos)
			sleep(0.2)
			localplayer:set_freeze_momentum(false) 
			localplayer:set_config_flag(292, false) -- PED_FLAG_FREEZE
			localplayer:set_config_flag(301, false) -- PED_FLAG_IS_STILL
        else
             local acc = 5
                if localplayer:get_current_vehicle() ~= nil then 
                    if localplayer:get_current_vehicle():get_acceleration() > 0 then
                        acc=localplayer:get_current_vehicle():get_acceleration()
                    end
                     localplayer:get_current_vehicle():set_acceleration(0)
                    localplayer:get_current_vehicle():set_position(newpos)
                    localplayer:get_current_vehicle():set_acceleration(acc)
                end
    
        end
    
end

local function TPHk(e)
	if e then
		TPD = menu.register_hotkey(QTPd, TPdn)
		TPF = menu.register_hotkey(QTPf, TPfr)
		TPU = menu.register_hotkey(QTPu, TPup)
		TPR = menu.register_hotkey(QTPrr, TProt)
	else
		if  TPD ~=nil then
			menu.remove_hotkey(TPD)
			menu.remove_hotkey(TPF)
			menu.remove_hotkey(TPU)
			menu.remove_hotkey(TPR)
		end
	end
end
------
local function TelePort()
	enable3 = not enable3 
	TPHk(enable3)
end
menu.register_hotkey(QTP, TelePort)

    menu.add_toggle("Tiny Player", function()	
    	if localplayer == nil then
    		return nil
    	end
     
    	return localplayer:get_config_flag(223)
    end, function(value)
    	localplayer:set_config_flag(223, value)
    end)
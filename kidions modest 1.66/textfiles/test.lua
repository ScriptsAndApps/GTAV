
-------------------------------------------------------------------------------------------------------
-- Add set wanted level -> advanced menu item showcase
-------------------------------------------------------------------------------------------------------

local Wanted_script_title = "Wanted Level"
local wantedlevel = 3
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
menu.add_bare_item(Wanted_script_title, Wanted_script_set_title, function() Wanted_script_clicked()  return "Wanted Level | error" end, Wanted_script_previous_item, Wanted_script_next_item)

-------------------------------------------------------------------------------------------------------


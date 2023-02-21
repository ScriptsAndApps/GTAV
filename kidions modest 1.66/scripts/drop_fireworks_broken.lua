
function DropFireworks()
	--PedDrop()
	
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

function init(self)
	-- Add initialization code here
	-- Remove this function if not needed
	msg.post(".", "acquire_input_focus")
	print("Character initialized.")
end
function on_input(self, action_id, action)
	if action_id == hash("right") and action.repeated then
		print("Right!")
		local pos = go.get_position()
		pos.x = pos.x + 25
		go.set_position(pos)
	elseif action_id == hash("left") and action.repeated then
		print("Left!")
		local pos = go.get_position()
	    pos.x = pos.x - 25
		go.set_position(pos)
	elseif action_id == hash("up") and action.repeated then
		print("Up")
		local pos = go.get_position()
		pos.y = pos.y + 25
		go.set_position(pos)
	elseif action_id == hash("down") and action.repeated then
		print("Down!")
		local pos = go.get_position()
		pos.y = pos.y - 25
		go.set_position(pos)
	elseif action_id == hash("esc") and action.pressed then
		print("ESC pressed !")
		msg.post("loader:/go#loader", "load_menu")
	end
end



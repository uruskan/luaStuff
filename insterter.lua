_G.insert = function(id) 
	local items = game:GetObjects("http://www.roblox.com/asset/?id="..id)
	for _,v in next,items do 
		v.Parent = #game.Selection:Get() == 1 and game.Selection:Get()[1] or workspace
	end
	game.Selection:Set(items)
end
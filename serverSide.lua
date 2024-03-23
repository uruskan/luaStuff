print("Server Script Running")
local res = game:GetService("ReplicatedStorage")
local gEvent = Instance.new("RemoteEvent",res)
print("Event created on the server!")
gEvent.Name = "giveEvent"

local function give(player,iName)
	print("Item ", iName , "will be given to", player.Name)
	local char = player.Character or player.CharacterAdded:wait()	
	print("Player's character is :",char)
	char:WaitForChild("Humanoid"):EquipTool(res:FindFirstChild(iName))
end
gEvent.OnServerEvent:Connect(give)

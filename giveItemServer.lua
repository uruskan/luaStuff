print("Server Script Running")
local Players = game:GetService("Players")
 
-- Memoization: since these results are rarely (if ever) going to change
-- all we have to do is check a cache table for the name.
-- If we find the name, then we have no work to do! Just return the user id (fast).
-- If we don't find the name (cache miss), go look it up (takes time).
local cache = {}
function getUserIdFromUsername(name)
	-- First, check if the cache contains the name
	if cache[name] then return cache[name] end
	-- Second, check if the user is already connected to the server
	local player = Players:FindFirstChild(name)
	if player then
		cache[name] = player.UserId
		return player.UserId
	end 
	-- If all else fails, send a request
	local id
	pcall(function ()
		id = Players:GetUserIdFromNameAsync(name)
	end)
	cache[name] = id
	return id
end



local res = game:GetService("ReplicatedStorage")
local gEvent = Instance.new("RemoteEvent",res)
print("Event created on the server!")
gEvent.Name = "giveEvent"

local function give(sender,targetName,iName)
        print("Item ", iName , "will be given to", targetName, "by" , sender.Name)
		local targetPlayerID = getUserIdFromUsername(targetName)
		print(targetPlayerID)
		local targetPlayer = game:GetService("Players"):GetPlayerByUserId(targetPlayerID)
		print(targetPlayer)
		--local char = player.Character or player.CharacterAdded:wait()	
		--print("Player's character is :",char)
		res:FindFirstChild(iName):Clone().Parent = targetPlayer.Backpack
		--char:WaitForChild("Humanoid"):EquipTool(res:FindFirstChild(iName):Clone())
	end
gEvent.OnServerEvent:Connect(give)

---Server
print("Server Script Running")
local res = game:GetService("ReplicatedStorage")
local gEvent = Instance.new("RemoteEvent",res)
print("Event created on the server!")
gEvent.Name = "giveEvent"

local function give(player,iName)
        print("Item ", iName , "will be given to", player.Name)
		--local char = player.Character or player.CharacterAdded:wait()	
		--print("Player's character is :",char)
		res:FindFirstChild(iName):Clone().Parent = player.Backpack
		--char:WaitForChild("Humanoid"):EquipTool(res:FindFirstChild(iName):Clone())
	end
gEvent.OnServerEvent:Connect(give)

-----Client
local frame = script.Parent
local sGUI = frame.Parent
local playerInput = frame.pInput
local giveButton = frame.giveItems
local quitButton = frame.quitButton
local showButton = script.Parent.Parent:FindFirstChild("TextButton")
local res = game:GetService("ReplicatedStorage")
showButton.Visible = false
if res then
	print("Res is found")
else
	print("There is no res")
end
quitButton.MouseButton1Click:connect(function()
    frame.Visible = false
	showButton.Visible = true
end)
giveButton.MouseButton1Click:Connect(function()
	local playerName = playerInput.Text
	--local player = game.Players.LocalPlayer --This might be the problem
	--print("Target Player is " , player)
	local giveevent = res:WaitForChild("giveEvent",5)
	giveevent:FireServer("item")
	--Nasıl bilmiyorum ama mesela FireServer attığımızda fonksiyona ilk argümana playerimizi veriyor.
end)


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
	giveevent:FireServer(playerName,"item")
	--Nasıl bilmiyorum ama mesela FireServer attığımızda fonksiyona ilk argümana playerimizi veriyor.
end)


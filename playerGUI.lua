local screenGUI = Instance.new("ScreenGui")
local mFrame = Instance.new("Frame")
local pnBox = Instance.new("TextBox")
screenGUI.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
local X = Instance.new("TextButton")
--Frame Properties
mFrame.Parent = screenGUI
mFrame.Active = true
mFrame.BackgroundColor3 = Color3.new(0.486275, 0.847059, 1)
mFrame.Draggable = true
mFrame.Size = UDim2.new(0, 325, 0, 400)

--I just added X button before everything because I thought a big blank frame on your screen can affect your work.
X.Name = "X"
X.Parent = mFrame
X.BackgroundColor3 = Color3.new(0.784314, 0, 0)
X.BorderColor3 = Color3.new(0.52549, 0, 0)
X.Position = UDim2.new(0.889999986, 0, 0, 0)
X.Size = UDim2.new(0, 35, 0, 35)
X.Font = Enum.Font.SciFi
X.Text = "X"
X.TextSize = 42

pnBox.Name = "Player_Name"
pnBox.Parent = mFrame
pnBox.Text = "Player Name"
pnBox.BorderColor3 = Color3.new(0,0,0)
pnBox.Position = UDim2.new(0.5,50,0.5,350)
pnBox.Size = UDim2.new(0,100,0,50)

pnBox.BackgroundColor3 = Color3.new(255,255,255)
X.MouseButton1Click:connect(function()
    mFrame.Visible = false
end)

--Item yükleyici kodla
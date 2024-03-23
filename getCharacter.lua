--WaitForChild() isminden anlaşılabileceği gibi Child objeleri bekler, Character bir child obje değil Player Objesinin bir Propertysidir.
---------------------------------------------
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:wait()
repeat wait() until character.Humanoid
local human = character.Humanoid
human.Health = 0

----------------------------------------------

local rep = game:GetService("ReplicatedStorage")
local player = game:GetService("Players").LocalPlayer
local char = player.Character or player.CharacterAdded:wait()
repeat wait() until char:FindFirstChild("Humanoid")
local human = char.Humanoid

-------------------------------------
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:wait()
local human = character:WaitForChild("Humanoid",5)


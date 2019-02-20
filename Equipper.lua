--Bundan önce objeyi studio'ya atıp (toolboxdan) sonra da replicatedstorage'ye sürüklememiz gerekiyor.
--Objeyi studiodan atmadan, server script ile insert edebilir miyiz araştıracağım.
game.Players.PlayerAdded:Connect(function(plr)
	plr.CharacterAdded:Connect(function(char)
		char:WaitForChild("Humanoid"):EquipTool(game.ReplicatedStorage.LinkedTimebomb)
		char:WaitForChild("Humanoid"):AddAccessory(game.ReplicatedStorage.WhiteAnimeBun)
		end)
end)
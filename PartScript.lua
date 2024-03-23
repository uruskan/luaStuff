local partx = Instance.new("Part")
partx.Parent = workspace
partx.Anchored = true;
local buttonPressed = false
function sex(hit)
	 if not buttonPressed then
		 buttonPressed = true
	     print("Function working..")
		if hit and hit.Parent and hit.Parent:FindFirstChild("Humanoid") then
			for i=1 ,3 do
				local cpart = Instance.new("Part",partx)
				cpart.Anchored = true
				cpart.BrickColor = BrickColor.new("Really red")
				cpart.Name = "Red Part"
				cpart.Parent = partx
				cpart.Position = Vector3.new(hit.Parent.Humanoid.RootPart.Position.x,hit.Parent.Humanoid.RootPart.Position.y + 20,hit.Parent.Humanoid.RootPart.Position.z)
			end
			Instance.new("Sparkles",partx)
			hit.Parent.Humanoid.Health = 100
			print(hit.Parent.Humanoid.Health)
			end
	end
	buttonPressed = false;
	end
script.Parent.Touched:connect(sex)



```lua
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")

local position1 = nil
local position2 = nil

local gui = Instance.new("ScreenGui")
gui.Parent = player.PlayerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 500, 0, 250)
frame.Position = UDim2.new(0.5, -250, 0.5, -125)
frame.Parent = gui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "Management"
title.Parent = frame

local button1 = Instance.new("TextButton")
button1.Size = UDim2.new(0, 150, 0, 40)
button1.Position = UDim2.new(0, 20, 0, 60)
button1.Text = "Position 1"
button1.Parent = frame

local position1Label = Instance.new("TextLabel")
position1Label.Size = UDim2.new(0, 280, 0, 40)
position1Label.Position = UDim2.new(0, 190, 0, 60)
position1Label.Text = "X: -  Y: -  Z: -"
position1Label.Parent = frame

local button2 = Instance.new("TextButton")
button2.Size = UDim2.new(0, 150, 0, 40)
button2.Position = UDim2.new(0, 20, 0, 110)
button2.Text = "Position 2"
button2.Parent = frame

local position2Label = Instance.new("TextLabel")
position2Label.Size = UDim2.new(0, 280, 0, 40)
position2Label.Position = UDim2.new(0, 190, 0, 110)
position2Label.Text = "X: -  Y: -  Z: -"
position2Label.Parent = frame

local button3 = Instance.new("TextButton")
button3.Size = UDim2.new(0, 150, 0, 40)
button3.Position = UDim2.new(0, 20, 0, 160)
button3.Text = "Move"
button3.Parent = frame

local exitButton = Instance.new("TextButton")
exitButton.Size = UDim2.new(0, 50, 0, 30)
exitButton.Position = UDim2.new(1, -60, 0, 5)
exitButton.Text = "X"
exitButton.Parent = frame

button1.MouseButton1Click:Connect(function()
	character = player.Character or player.CharacterAdded:Wait()
	rootPart = character:WaitForChild("HumanoidRootPart")

	position1 = rootPart.Position

	position1Label.Text = string.format(
		"X: %.2f  Y: %.2f  Z: %.2f",
		position1.X,
		position1.Y,
		position1.Z
	)
end)

button2.MouseButton1Click:Connect(function()
	character = player.Character or player.CharacterAdded:Wait()
	rootPart = character:WaitForChild("HumanoidRootPart")

	position2 = rootPart.Position

	position2Label.Text = string.format(
		"X: %.2f  Y: %.2f  Z: %.2f",
		position2.X,
		position2.Y,
		position2.Z
	)
end)

button3.MouseButton1Click:Connect(function()
	character = player.Character or player.CharacterAdded:Wait()
	rootPart = character:WaitForChild("HumanoidRootPart")

	if position1 then
		while (rootPart.Position - position1).Magnitude > 0.1 do
			local direction = position1 - rootPart.Position
			local distance = direction.Magnitude
			local speed = 0.5

			rootPart.CFrame = rootPart.CFrame + direction.Unit * math.min(speed, distance)

			task.wait()
		end

		rootPart.CFrame = CFrame.new(position1)
	end
end)

exitButton.MouseButton1Click:Connect(function()
	gui:Destroy()
end)
```

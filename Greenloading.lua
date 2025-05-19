-- "Loading Script!" GUI for Roblox
local gui = Instance.new("ScreenGui")
gui.Name = "LoadingScriptGUI"

-- Set parent depending on executor permissions
pcall(function()
	gui.Parent = game:GetService("CoreGui")
end)
if not gui.Parent then
	gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
end

-- Main UI frame
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 400, 0, 150)
frame.Position = UDim2.new(0.5, -200, 0.5, -75)
frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)

local corner = Instance.new("UICorner", frame)
corner.CornerRadius = UDim.new(0, 12)

-- Title label
local title = Instance.new("TextLabel", frame)
title.Text = "Loading script!"
title.Size = UDim2.new(1, 0, 0, 50)
title.Position = UDim2.new(0, 0, 0, 10)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(0, 255, 170)
title.Font = Enum.Font.GothamBold
title.TextScaled = true

-- Progress bar background
local progressBarBG = Instance.new("Frame", frame)
progressBarBG.Size = UDim2.new(0.8, 0, 0.15, 0)
progressBarBG.Position = UDim2.new(0.1, 0, 0.7, 0)
progressBarBG.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

local barCorner = Instance.new("UICorner", progressBarBG)
barCorner.CornerRadius = UDim.new(0, 6)

-- Progress bar fill
local progressBar = Instance.new("Frame", progressBarBG)
progressBar.Size = UDim2.new(0, 0, 1, 0)
progressBar.BackgroundColor3 = Color3.fromRGB(0, 255, 170)

local fillCorner = Instance.new("UICorner", progressBar)
fillCorner.CornerRadius = UDim.new(0, 6)

-- Percentage text label
local percentageLabel = Instance.new("TextLabel", frame)
percentageLabel.Position = UDim2.new(0.5, 0, 0.55, 0)
percentageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
percentageLabel.Size = UDim2.new(0, 100, 0, 30)
percentageLabel.BackgroundTransparency = 1
percentageLabel.TextColor3 = Color3.fromRGB(0, 255, 170)
percentageLabel.Font = Enum.Font.GothamBold
percentageLabel.TextScaled = true
percentageLabel.Text = "1%"

-- Run Script button (hidden initially)
local runButton = Instance.new("TextButton", frame)
runButton.Size = UDim2.new(0.4, 0, 0.2, 0)
runButton.Position = UDim2.new(0.5, 0, 0.88, 0)
runButton.AnchorPoint = Vector2.new(0.5, 0.5)
runButton.BackgroundColor3 = Color3.fromRGB(0, 255, 170)
runButton.TextColor3 = Color3.fromRGB(0, 0, 0)
runButton.Font = Enum.Font.GothamBold
runButton.TextScaled = true
runButton.Text = "Run Script"
runButton.Visible = false

local runCorner = Instance.new("UICorner", runButton)
runCorner.CornerRadius = UDim.new(0, 8)

-- Animate loading
spawn(function()
	for i = 1, 100 do
		progressBar.Size = UDim2.new(i / 100, 0, 1, 0)
		percentageLabel.Text = i .. "%"
		wait(0.8) -- 100 steps * 0.8s = 80 seconds
	end

	-- Show Run Script button
	runButton.Visible = true
end)

-- Run Button (does nothing)
runButton.MouseButton1Click:Connect(function()
	print("Run Script clicked (no action assigned)")
end)

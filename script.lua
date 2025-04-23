-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "LoadingScreen"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")

-- Create background frame
local background = Instance.new("Frame")
background.Size = UDim2.new(1, 0, 1, 0)
background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
background.BorderSizePixel = 0
background.Parent = screenGui

-- Roblox icon image
local icon = Instance.new("ImageLabel")
icon.Size = UDim2.new(0, 100, 0, 100)
icon.Position = UDim2.new(0.5, -50, 0.25, -50)
icon.BackgroundTransparency = 1
icon.Image = "rbxassetid://11229103372" -- Clean Roblox logo (white on transparent)
icon.Parent = background

-- Spinning function
local rotation = 0
local running = true
RunService.RenderStepped:Connect(function(dt)
    if running then
        rotation = rotation + 90 * dt -- 90 degrees per second
        icon.Rotation = rotation % 360
    end
end)

-- Loading text
local loadingText = Instance.new("TextLabel")
loadingText.Text = "Loading..."
loadingText.Font = Enum.Font.GothamBold
loadingText.TextSize = 48
loadingText.TextColor3 = Color3.fromRGB(255, 0, 0) -- Red
loadingText.BackgroundTransparency = 1
loadingText.Size = UDim2.new(1, 0, 0.2, 0)
loadingText.Position = UDim2.new(0, 0, 0.4, 0)
loadingText.Parent = background

-- White outline for text
local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(255, 255, 255)
stroke.Thickness = 2
stroke.Parent = loadingText

-- Percent text
local percentText = Instance.new("TextLabel")
percentText.Text = "0%"
percentText.Font = Enum.Font.Gotham
percentText.TextSize = 36
percentText.TextColor3 = Color3.fromRGB(255, 255, 255)
percentText.BackgroundTransparency = 1
percentText.Size = UDim2.new(1, 0, 0.1, 0)
percentText.Position = UDim2.new(0, 0, 0.55, 0)
percentText.Parent = background

-- Update percentage over 3 minutes (180 seconds)
for i = 0, 100 do
    percentText.Text = i .. "%"
    wait(1.8)
end

-- Optional: fade out and clean up
for i = 1, 10 do
    background.BackgroundTransparency = i / 10
    loadingText.TextTransparency = i / 10
    percentText.TextTransparency = i / 10
    stroke.Transparency = i / 10
    icon.ImageTransparency = i / 10
    wait(0.05)
end

running = false
screenGui:Destroy()

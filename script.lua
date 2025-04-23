-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "LoadingScreen"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

-- Create background frame
local background = Instance.new("Frame")
background.Size = UDim2.new(1, 0, 1, 0)
background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
background.BorderSizePixel = 0
background.Parent = screenGui

-- Loading text
local loadingText = Instance.new("TextLabel")
loadingText.Text = "Loading..."
loadingText.Font = Enum.Font.SourceSansBold
loadingText.TextSize = 48
loadingText.TextColor3 = Color3.fromRGB(255, 255, 255)
loadingText.BackgroundTransparency = 1
loadingText.Size = UDim2.new(1, 0, 0.2, 0)
loadingText.Position = UDim2.new(0, 0, 0.4, 0)
loadingText.Parent = background

-- Percent text
local percentText = Instance.new("TextLabel")
percentText.Text = "0%"
percentText.Font = Enum.Font.SourceSans
percentText.TextSize = 36
percentText.TextColor3 = Color3.fromRGB(255, 255, 255)
percentText.BackgroundTransparency = 1
percentText.Size = UDim2.new(1, 0, 0.1, 0)
percentText.Position = UDim2.new(0, 0, 0.55, 0)
percentText.Parent = background

-- Update percentage
for i = 0, 100 do
    percentText.Text = i .. "%"
    wait(0.03) -- speed of loading
end

-- Optional: fade out and remove
for i = 1, 10 do
    background.BackgroundTransparency = i / 10
    loadingText.TextTransparency = i / 10
    percentText.TextTransparency = i / 10
    wait(0.05)
end

screenGui:Destroy()

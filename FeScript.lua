local Players = game:GetService("Players")
local player = Players.LocalPlayer
local gui = player:WaitForChild("PlayerGui")
local RunService = game:GetService("RunService")

-- Optional: Sound effect
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://1843520911" -- Replace with funnier one if you want
sound.Looped = true
sound.Volume = 1
sound.Parent = workspace
sound:Play()

-- Function to create a gliding popup
local function createGlidingWindow()
    local screenGui = Instance.new("ScreenGui", gui)
    screenGui.ResetOnSpawn = false

    local frame = Instance.new("Frame", screenGui)
    frame.Size = UDim2.new(0, 200, 0, 100)
    frame.Position = UDim2.new(math.random(), 0, math.random(), 0)
    frame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    frame.BorderSizePixel = 3

    local textLabel = Instance.new("TextLabel", frame)
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = "FUCKING REKTED BY NOX NIGGA!"
    textLabel.TextColor3 = Color3.new(1, 1, 1)
    textLabel.TextScaled = true
    textLabel.Font = Enum.Font.Arcade

    -- Random glide direction
    local xDir = math.random() > 0.5 and 1 or -1
    local yDir = math.random() > 0.5 and 1 or -1
    local speed = math.random(20, 60)

    RunService.RenderStepped:Connect(function(dt)
        local pos = frame.Position
        local newX = pos.X.Offset + (xDir * speed * dt)
        local newY = pos.Y.Offset + (yDir * speed * dt)

        -- Wrap around screen edges
        if newX > gui.AbsoluteSize.X then newX = -frame.Size.X.Offset end
        if newX < -frame.Size.X.Offset then newX = gui.AbsoluteSize.X end
        if newY > gui.AbsoluteSize.Y then newY = -frame.Size.Y.Offset end
        if newY < -frame.Size.Y.Offset then newY = gui.AbsoluteSize.Y end

        frame.Position = UDim2.new(0, newX, 0, newY)
    end)
end

-- Continuously spawn windows
while true do
    createGlidingWindow()
    wait(0.7) -- Faster spawn rate = more chaos
end

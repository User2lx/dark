local Players = game:GetService("Players")
local player = Players.LocalPlayer
local gui = player:WaitForChild("PlayerGui")
local RunService = game:GetService("RunService")

-- 🔊 Intro sound
local introSound = Instance.new("Sound", workspace)
introSound.SoundId = "rbxassetid://7261232562"
introSound.Volume = 1
introSound:Play()

-- 💤 Wait before starting chaos
task.wait(7)

-- 🔁 Looping background sound
local loopSound = Instance.new("Sound", workspace)
loopSound.SoundId = "rbxassetid://8028069841"
loopSound.Volume = 1
loopSound.Looped = true
loopSound:Play()

-- 💬 Roast messages
local roasts = {
    "REKT BY NOX NIGGA",
    "Scripts ain't free 💀",
    "You suck dude XD",
    "Learn to use key systems, clown 🤡",
    "It's really not hard, you clown 🫵",
    "Bro what are you doing 😂",
    "L + ratio + skill issue",
    "You copied this, didn't you?",
    "No keys, no scripts. Simple."
}

-- 💨 Gliding roast window function
local function createRoastWindow()
    local screenGui = Instance.new("ScreenGui", gui)
    screenGui.ResetOnSpawn = false

    local frame = Instance.new("Frame", screenGui)
    frame.Size = UDim2.new(0, 250, 0, 100)
    frame.Position = UDim2.new(0, math.random(0, gui.AbsoluteSize.X - 250), 0, math.random(0, gui.AbsoluteSize.Y - 100))
    frame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    frame.BorderSizePixel = 3

    local textLabel = Instance.new("TextLabel", frame)
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = roasts[math.random(1, #roasts)]
    textLabel.TextColor3 = Color3.new(1, 1, 1)
    textLabel.TextScaled = true
    textLabel.Font = Enum.Font.Arcade

    -- Random glide direction
    local xDir = math.random() > 0.5 and 1 or -1
    local yDir = math.random() > 0.5 and 1 or -1
    local speed = math.random(30, 70)

    -- Glide effect
    RunService.RenderStepped:Connect(function(dt)
        local newX = frame.Position.X.Offset + (xDir * speed * dt)
        local newY = frame.Position.Y.Offset + (yDir * speed * dt)

        -- Wrap around screen
        if newX > gui.AbsoluteSize.X then newX = -frame.Size.X.Offset end
        if newX < -frame.Size.X.Offset then newX = gui.AbsoluteSize.X end
        if newY > gui.AbsoluteSize.Y then newY = -frame.Size.Y.Offset end
        if newY < -frame.Size.Y.Offset then newY = gui.AbsoluteSize.Y end

        frame.Position = UDim2.new(0, newX, 0, newY)
    end)
end

-- 🔁 Keep spawning glide windows
while true do
    createRoastWindow()
    task.wait(0.5)
end

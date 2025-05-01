local modelId = 13316810213
local audioId = 122189421651555
local textColor = Color3.fromRGB(255, 0, 0)
local walkingAnimId = 116224363642728

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local mouse = player:GetMouse()

local function spawnModel()
    local model = game:GetService("InsertService"):LoadAsset(modelId)
    model.Parent = game.Workspace
    local spawnPosition = character.HumanoidRootPart.Position + (character.HumanoidRootPart.CFrame.LookVector * 100)
    model:SetPrimaryPartCFrame(CFrame.new(spawnPosition))
    return model
end

local function showText()
    local textLabel = Instance.new("TextLabel")
    textLabel.Parent = game.Players.LocalPlayer.PlayerGui:WaitForChild("ScreenGui")
    textLabel.Text = "You can now sprint"
    textLabel.TextColor3 = textColor
    textLabel.Position = UDim2.new(0.9, 0, 0.1, 0)
    textLabel.TextSize = 30
    textLabel.TextStrokeTransparency = 0.8
    textLabel.TextTransparency = 0

    for i = 0, 1, 0.1 do
        textLabel.TextTransparency = i
        wait(0.1)
    end

    wait(2)
    textLabel.TextColor3 = textColor

    local sound = Instance.new("Sound", game.Workspace)
    sound.SoundId = "rbxassetid://" .. audioId
    sound:Play()

    wait(sound.TimeLength)
    textLabel:Destroy()
end

local function updateFogAndAnimation()
    game.Lighting.FogColor = Color3.new(0, 0, 0)
    game.Lighting.FogStart = 10
    game.Lighting.FogEnd = 150

    local anim = Instance.new("Animation")
    anim.AnimationId = "rbxassetid://" .. walkingAnimId
    local humanoid = character:WaitForChild("Humanoid")
    local animationTrack = humanoid:LoadAnimation(anim)
    animationTrack:Play()
end

mouse.KeyDown:connect(function (key)
    key = string.lower(key)
    if string.byte(key) == 48 then
        showText()
        local model = spawnModel()
        updateFogAndAnimation()
    end
end)

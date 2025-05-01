-- Rayfield GUI Setup
local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/Rayfield-Roblox/Rayfield/main/source.lua"))()
local Window = Rayfield:CreateWindow({ 
    Name = "Nox's aim", 
    LoadingTitle = "Nox;s aims like this", 
    LoadingSubtitle = "by Nox", 
    ConfigurationSaving = { 
        Enabled = true, 
        FolderName = nil, 
        FileName = "settings" 
    } 
})

local Tab = Window:CreateTab("Features", 4483362458)

-- Game Services
local Players = game:GetService("Players")
local Camera = workspace.CurrentCamera
local UserInputService = game:GetService("UserInputService")

-- Aimbot and ESP Variables
local aimbotEnabled = false
local espEnabled = false

-- Find closest enemy for aimbot
local function findClosestEnemy()
    local closestPlayer = nil
    local shortestDistance = math.huge
    
    for _, player in ipairs(Players:GetPlayers()) do
        if player.Character and player.Character:FindFirstChild("Head") and player ~= Players.LocalPlayer then
            local distance = (Camera.CFrame.Position - player.Character.Head.Position).magnitude
            if distance < shortestDistance then
                closestPlayer = player
                shortestDistance = distance
            end
        end
    end
    return closestPlayer
end

-- Aimbot Logic
local function aimbot(targetPlayer)
    if targetPlayer and targetPlayer.Character then
        local targetPosition = targetPlayer.Character.Head.Position
        Camera.CFrame = CFrame.new(Camera.CFrame.Position, targetPosition)
    end
end

-- ESP Logic
local function createESP(player)
    if player.Character and player.Character:FindFirstChild("Head") then
        local espPart = Instance.new("BillboardGui")
        espPart.Parent = player.Character.Head
        espPart.Adornee = player.Character.Head
        espPart.Size = UDim2.new(0, 200, 0, 50)
        espPart.AlwaysOnTop = true

        local label = Instance.new("TextLabel")
        label.Parent = espPart
        label.Text = player.Name
        label.Size = UDim2.new(1, 0, 1, 0)
        label.TextColor3 = Color3.fromRGB(255, 0, 0)
        label.BackgroundTransparency = 1
    end
end

-- ESP Update for All Players
local function updateESP()
    if espEnabled then
        for _, player in ipairs(Players:GetPlayers()) do
            createESP(player)
        end
    end
end

-- Toggle ESP
Tab:CreateToggle({
    Name = "ESP",
    CurrentValue = espEnabled,
    Flag = "espToggle",
    Callback = function(value)
        espEnabled = value
        if espEnabled then
            updateESP()
        end
    end
})

-- Toggle Aimbot
Tab:CreateToggle({
    Name = "Aimbot",
    CurrentValue = aimbotEnabled,
    Flag = "aimbotToggle",
    Callback = function(value)
        aimbotEnabled = value
    end
})

-- Handle Aimbot Activation via Input
UserInputService.InputBegan:Connect(function(input)
    if aimbotEnabled and input.KeyCode == Enum.KeyCode.F then  -- Press F to activate the aimbot
        local target = findClosestEnemy()
        aimbot(target)
    end
end)

-- Update ESP Continuously
game:GetService("RunService").Heartbeat:Connect(function()
    if espEnabled then
        for _, player in ipairs(Players:GetPlayers()) do
            if not player.Character:FindFirstChild("BillboardGui") then
                createESP(player)
            end
        end
    end
end)

-- Make sure ESP is created for new players
Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        if espEnabled then
            createESP(player)
        end
    end)
end)

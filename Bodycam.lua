local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local InsertService = game:GetService("InsertService")
local StarterPack = game:GetService("StarterPack")

local player = Players.LocalPlayer
local camera = workspace.CurrentCamera
player.CameraMode = Enum.CameraMode.LockFirstPerson

local cameraMode = "BodyCam"
local bobbingSpeed = 2
local bobbingAmount = 0.1
local bobbingTimer = 0

local humanoidRootPart
local cameraCFrame
local bodyRotation = 0
local unitNumber = math.random(100, 999)

local hasMenuShown = false

local function showMainMenu()
    if hasMenuShown then return end
    hasMenuShown = true

    local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
    screenGui.Name = "MainMenu"
    screenGui.ResetOnSpawn = false

    local frame = Instance.new("Frame", screenGui)
    frame.Size = UDim2.new(0.5, 0, 0.6, 0)
    frame.Position = UDim2.new(0.25, 0, 0.2, 0)
    frame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
    frame.BorderSizePixel = 0

    local title = Instance.new("TextLabel", frame)
    title.Size = UDim2.new(1, 0, 0.2, 0)
    title.Position = UDim2.new(0, 0, 0, 0)
    title.BackgroundTransparency = 1
    title.Text = "Welcome to the Game!"
    title.Font = Enum.Font.Code
    title.TextColor3 = Color3.new(1, 1, 1)
    title.TextSize = 36

    local instructions = Instance.new("TextLabel", frame)
    instructions.Size = UDim2.new(1, -20, 0.4, 0)
    instructions.Position = UDim2.new(0, 10, 0.2, 0)
    instructions.BackgroundTransparency = 1
    instructions.Text = "Click 'Execute' to reset your character and receive the tool. The tool will appear in your inventory."
    instructions.Font = Enum.Font.Code
    instructions.TextColor3 = Color3.new(1, 1, 1)
    instructions.TextWrapped = true
    instructions.TextSize = 18

    local executeButton = Instance.new("TextButton", frame)
    executeButton.Size = UDim2.new(0.5, 0, 0.2, 0)
    executeButton.Position = UDim2.new(0.25, 0, 0.65, 0)
    executeButton.BackgroundColor3 = Color3.new(0.2, 0.8, 0.2)
    executeButton.Text = "Execute"
    executeButton.Font = Enum.Font.Code
    executeButton.TextColor3 = Color3.new(1, 1, 1)
    executeButton.TextSize = 24

    executeButton.MouseButton1Click:Connect(function()
        screenGui:Destroy()
        player:LoadCharacter() -- Resets the player locally

        local success, model = pcall(function()
            return InsertService:LoadAsset(2943407287)
        end)

        if success and model then
            local tool = model:GetChildren()[1]
            if tool and tool:IsA("Tool") then
                tool.Parent = StarterPack
            end
        end
    end)
end

local function applyOutfit(character)
    local humanoid = character:WaitForChild("Humanoid")

    local shirt = Instance.new("Shirt", character)
    shirt.ShirtTemplate = "rbxassetid://127921483908160"

    local pants = Instance.new("Pants", character)
    pants.PantsTemplate = "rbxassetid://104528407299303"

    local function addAccessory(id)
        local success, model = pcall(function()
            return InsertService:LoadAsset(id)
        end)
        if success and model then
            local accessory = model:FindFirstChildWhichIsA("Accessory")
            if accessory then
                accessory.Parent = character
                humanoid:AddAccessory(accessory)
                accessory.Handle.LocalTransparencyModifier = 0.75
            end
        end
    end

    addAccessory(6134086260)
    addAccessory(10236400607)
end

local function updateCamera(character)
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    bobbingTimer = bobbingTimer + bobbingSpeed * RunService.Heartbeat:Wait()
    local bobbingOffset = math.sin(bobbingTimer) * bobbingAmount

    if cameraMode == "BodyCam" then
        camera.CFrame = hrp.CFrame * CFrame.new(0, 0.5 + bobbingOffset, -1.5)
    else
        camera.CFrame = hrp.CFrame * CFrame.new(0, 1.5 + bobbingOffset, -0.3) * CFrame.Angles(math.rad(-5), 0, 0)
    end
end

local function updateBodyRotation()
    local delta = UserInputService:GetMouseDelta() * -0.2
    bodyRotation = bodyRotation + delta.X
    camera.CFrame = CFrame.new(camera.CFrame.Position) * CFrame.Angles(0, math.rad(bodyRotation), 0)
end

local function initializeCharacter(character)
    local humanoid = character:WaitForChild("Humanoid")
    humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    local rightArm = character:FindFirstChild("RightUpperArm") or character:FindFirstChild("Right Arm")
    local leftArm = character:FindFirstChild("LeftUpperArm") or character:FindFirstChild("Left Arm")
    local hats = character:GetChildren()

    for _, arm in ipairs({rightArm, leftArm}) do
        if arm then
            arm.LocalTransparencyModifier = 0.75
        end
    end

    for _, hat in ipairs(hats) do
        if hat:IsA("Accessory") then
            hat.Handle.LocalTransparencyModifier = 0.75
        end
    end

    UserInputService.MouseBehavior = Enum.MouseBehavior.LockCenter
    camera.CameraType = Enum.CameraType.Scriptable

    applyOutfit(character)

    RunService:BindToRenderStep("BodyCamRender", Enum.RenderPriority.Camera.Value, function()
        updateCamera(character)
        updateBodyRotation()
    end)
end

player.CharacterAdded:Connect(initializeCharacter)

UserInputService.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        UserInputService.MouseBehavior = Enum.MouseBehavior.LockCenter
    end
end)

showMainMenu()

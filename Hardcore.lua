-- Hardcore Mode Script by Nox

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local Debris = game:GetService("Debris")
local RunService = game:GetService("RunService")

local Player = Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")

local messageSent = false
local healthGui, healthBar
local bloodPuddleCooldown = 0

-- Prevent respawn
Player.CharacterAutoLoads = false

-- INTRO
local function playIntro()
	local introSound = Instance.new("Sound", workspace)
	introSound.SoundId = "rbxassetid://1848137645"
	introSound.Volume = 1
	introSound:Play()

	local blur = Instance.new("BlurEffect", Lighting)
	local tween = TweenService:Create(blur, TweenInfo.new(4), {Size = 20})
	tween:Play()
	wait(4)
	blur:Destroy()
end

-- HEALTH GUI
local function createHealthGui()
	healthGui = Instance.new("ScreenGui", Player:WaitForChild("PlayerGui"))
	healthGui.Name = "HealthGui"

	healthBar = Instance.new("Frame", healthGui)
	healthBar.Size = UDim2.new(0.2, 0, 0.03, 0)
	healthBar.Position = UDim2.new(0.4, 0, 0.92, 0)
	healthBar.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
end

-- BLOOD PUDDLE
local function spawnBlood()
	local puddle = Instance.new("Part")
	puddle.Size = Vector3.new(1.5, 0.1, 1.5)
	puddle.Anchored = true
	puddle.CanCollide = false
	puddle.Color = Color3.fromRGB(120, 0, 0)
	puddle.Material = Enum.Material.SmoothPlastic
	puddle.CFrame = Character:FindFirstChild("HumanoidRootPart").CFrame * CFrame.new(0, -3.1, 0)
	puddle.Parent = workspace
	Debris:AddItem(puddle, 10)
end

-- HURT EFFECTS
local function applyLowHealthEffects()
	if Humanoid.Health <= 10 then
		if not workspace:FindFirstChild("HurtLoop") then
			local hurt = Instance.new("Sound", workspace)
			hurt.Name = "HurtLoop"
			hurt.SoundId = "rbxassetid://123491206008008"
			hurt.Volume = 0.8
			hurt.Looped = true
			hurt:Play()
		end

		if not Lighting:FindFirstChild("LowHealthFog") then
			local fog = Instance.new("Atmosphere", Lighting)
			fog.Name = "LowHealthFog"
			fog.Density = 0.5
			fog.Haze = 2
		end

		Humanoid.WalkSpeed = 4

		if tick() - bloodPuddleCooldown > 3 then
			spawnBlood()
			bloodPuddleCooldown = tick()
		end
	else
		if workspace:FindFirstChild("HurtLoop") then workspace.HurtLoop:Destroy() end
		if Lighting:FindFirstChild("LowHealthFog") then Lighting.LowHealthFog:Destroy() end
		Humanoid.WalkSpeed = 16
	end
end

-- DEATH SCREEN
local function playDeathScreen()
	local cam = workspace.CurrentCamera
	cam.CameraType = Enum.CameraType.Scriptable
	cam.CFrame = CFrame.new(cam.CFrame.Position, Character:GetPivot().Position + Vector3.new(0, -3, 0))

	local deathGui = Instance.new("ScreenGui", Player:WaitForChild("PlayerGui"))
	local label = Instance.new("TextLabel", deathGui)
	label.Size = UDim2.new(1, 0, 1, 0)
	label.BackgroundTransparency = 1
	label.Text = "You Died"
	label.TextSize = 48
	label.Font = Enum.Font.GothamBold
	label.TextColor3 = Color3.fromRGB(255, 0, 0)
	label.TextTransparency = 1

	TweenService:Create(label, TweenInfo.new(2), {TextTransparency = 0}):Play()

	wait(4)

	if not messageSent then
		local chatEvent = ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents")
		if chatEvent then
			local msg = chatEvent:FindFirstChild("SayMessageRequest")
			if msg then
				msg:FireServer("I have died. I will now be kicked for losing my one life. This hardcore mode script was made by Nox. This is not an exploit; it is a mod.", "All")
				messageSent = true
			end
		end
	end

	wait(2)
	Player:Kick("You lost your one life. Goodbye.")
end

-- Setup
playIntro()
createHealthGui()

-- Health change loop
Humanoid.HealthChanged:Connect(function()
	if healthBar then
		healthBar.Size = UDim2.new(Humanoid.Health / Humanoid.MaxHealth, 0, 0.03, 0)
	end
	applyLowHealthEffects()
end)

-- On death
Humanoid.Died:Connect(function()
	playDeathScreen()
end)

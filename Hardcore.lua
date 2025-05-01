local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")
local SoundService = game:GetService("SoundService")
local Debris = game:GetService("Debris")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local root = character:WaitForChild("HumanoidRootPart")

local lowHealthActive = false
local originalWalkSpeed = humanoid.WalkSpeed
local breathingSound, puddleLoop

-- Create blood puddle
local function spawnBlood()
	if not lowHealthActive then return end

	local puddle = Instance.new("Part")
	puddle.Size = Vector3.new(2.5, 0.1, 2.5)
	puddle.Position = root.Position - Vector3.new(0, 3, 0)
	puddle.Anchored = true
	puddle.CanCollide = false
	puddle.Material = Enum.Material.SmoothPlastic
	puddle.Color = Color3.fromRGB(170, 0, 0)
	puddle.Transparency = 0.2
	puddle.Parent = workspace

	Debris:AddItem(puddle, 10)
end

-- Start effects
local function activateLowHealth()
	if lowHealthActive then return end
	lowHealthActive = true

	-- Red fog
	Lighting.FogColor = Color3.fromRGB(100, 0, 0)
	Lighting.FogEnd = 60
	Lighting.FogStart = 0

	-- Hurt sound
	breathingSound = Instance.new("Sound", SoundService)
	breathingSound.SoundId = "rbxassetid://123491206008008"
	breathingSound.Looped = true
	breathingSound.Volume = 1
	breathingSound:Play()

	-- Slow walk
	humanoid.WalkSpeed = originalWalkSpeed * 0.25

	-- Blood puddle loop
	puddleLoop = RunService.Heartbeat:Connect(function(step)
		if not lowHealthActive then return end
		spawnBlood()
		task.wait(3)
	end)
end

-- Stop effects
local function deactivateLowHealth()
	if not lowHealthActive then return end
	lowHealthActive = false

	Lighting.FogEnd = 100000
	Lighting.FogStart = 100000
	Lighting.FogColor = Color3.fromRGB(255, 255, 255)

	if breathingSound then
		breathingSound:Stop()
		breathingSound:Destroy()
	end

	humanoid.WalkSpeed = originalWalkSpeed

	if puddleLoop then
		puddleLoop:Disconnect()
	end
end

-- Monitor health
humanoid:GetPropertyChangedSignal("Health"):Connect(function()
	if humanoid.Health > 0 and humanoid.Health < 10 then
		activateLowHealth()
	elseif humanoid.Health >= 10 then
		deactivateLowHealth()
	end
end)

-- Start check immediately if already low
if humanoid.Health < 10 then
	activateLowHealth()
end

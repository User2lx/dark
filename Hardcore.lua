local Players = game:GetService("Players")
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local StarterGui = game:GetService("StarterGui")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

-- Lock UI + Remove respawn/reset
StarterGui:SetCore("ResetButtonCallback", false)
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Health, false)
ReplicatedFirst:RemoveDefaultLoadingScreen()

-- GUI
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "OneLifeUI"
gui.ResetOnSpawn = false

-- Intro frame
local intro = Instance.new("Frame", gui)
intro.Size = UDim2.new(1, 0, 1, 0)
intro.BackgroundColor3 = Color3.new(0, 0, 0)

local title = Instance.new("TextLabel", intro)
title.Size = UDim2.new(1, 0, 0.2, 0)
title.Position = UDim2.new(0, 0, 0.35, 0)
title.BackgroundTransparency = 1
title.Text = "☠ ONE LIFE MODE ☠"
title.TextColor3 = Color3.new(1, 0, 0)
title.TextScaled = true
title.Font = Enum.Font.Arcade

local warn = Instance.new("TextLabel", intro)
warn.Size = UDim2.new(1, 0, 0.2, 0)
warn.Position = UDim2.new(0, 0, 0.5, 0)
warn.BackgroundTransparency = 1
warn.Text = "You only have one life. Death means kick. No respawn."
warn.TextColor3 = Color3.new(1, 1, 1)
warn.TextScaled = true
warn.Font = Enum.Font.GothamBold

-- Health label
local hpLabel = Instance.new("TextLabel", gui)
hpLabel.Size = UDim2.new(0.3, 0, 0.08, 0)
hpLabel.Position = UDim2.new(0.35, 0, 0.05, 0)
hpLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
hpLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
hpLabel.TextScaled = true
hpLabel.Font = Enum.Font.GothamBold
hpLabel.Text = "Health: 100"

-- Overhead tag
local function tag(character)
	local head = character:FindFirstChild("Head")
	if not head then return end

	local tag = Instance.new("BillboardGui", head)
	tag.Name = "OneLifeTag"
	tag.Size = UDim2.new(0, 200, 0, 50)
	tag.StudsOffset = Vector3.new(0, 2.5, 0)
	tag.AlwaysOnTop = true

	local label = Instance.new("TextLabel", tag)
	label.Size = UDim2.new(1, 0, 1, 0)
	label.BackgroundTransparency = 1
	label.Text = "☠ ONE LIFE ☠"
	label.TextColor3 = Color3.new(1, 0, 0)
	label.TextStrokeTransparency = 0
	label.TextScaled = true
	label.Font = Enum.Font.Arcade
end

-- Death sequence
local function deathSequence()
	local frame = Instance.new("Frame", gui)
	frame.Size = UDim2.new(1, 0, 1, 0)
	frame.BackgroundColor3 = Color3.new(0, 0, 0)
	frame.BackgroundTransparency = 1
	frame.ZIndex = 1000

	local text = Instance.new("TextLabel", frame)
	text.Size = UDim2.new(1, 0, 0.2, 0)
	text.Position = UDim2.new(0, 0, 0.4, 0)
	text.Text = "YOU DIED"
	text.Font = Enum.Font.Arcade
	text.TextScaled = true
	text.TextColor3 = Color3.new(1, 0, 0)
	text.BackgroundTransparency = 1
	text.ZIndex = 1001

	local sound = Instance.new("Sound", gui)
	sound.SoundId = "rbxassetid://9117314713"
	sound.Volume = 1
	sound:Play()

	TweenService:Create(frame, TweenInfo.new(2), {BackgroundTransparency = 0}):Play()
	TweenService:Create(text, TweenInfo.new(2), {BackgroundTransparency = 0}):Play()

	task.delay(14, function()
		for i = 1, 30 do
			sound.Volume -= 1/30
			task.wait(0.1)
		end
	end)

	task.delay(2, function()
		local chat = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest")
		chat:FireServer("I have died. I will now be kicked for losing my one life. This Hardcore Mode script was made by Nox. This is not an exploit, it is a mod.", "All")
	end)

	task.delay(17, function()
		player:Kick("You died. You had one life.")
	end)
end

-- Setup player character
local function setup(character)
	local hum = character:WaitForChild("Humanoid")
	local root = character:WaitForChild("HumanoidRootPart")

	tag(character)
	local savedPos = root.CFrame
	root.CFrame = CFrame.new(0, 150, 0)
	task.wait(0.1)
	root.Anchored = true
	hum.Health = hum.MaxHealth

	task.delay(5, function()
		TweenService:Create(intro, TweenInfo.new(2), {BackgroundTransparency = 1}):Play()
		task.wait(2)
		intro:Destroy()
		root.Anchored = false
		root.CFrame = savedPos
	end)

	hum.HealthChanged:Connect(function(hp)
		hpLabel.Text = "Health: " .. math.floor(hp)
		hpLabel.BackgroundColor3 = hp <= 25 and Color3.fromRGB(255, 0, 0) or Color3.fromRGB(0, 0, 0)
	end)

	hum.Died:Connect(deathSequence)
end

if player.Character then setup(player.Character) end
player.CharacterAdded:Connect(setup)

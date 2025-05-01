local Players = game:GetService("Players")
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local StarterGui = game:GetService("StarterGui")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

StarterGui:SetCore("ResetButtonCallback", false)
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Health, false)
ReplicatedFirst:RemoveDefaultLoadingScreen()

local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "OneLifeUI"
gui.ResetOnSpawn = false

local introFrame = Instance.new("Frame", gui)
introFrame.Size = UDim2.new(1, 0, 1, 0)
introFrame.BackgroundColor3 = Color3.new(0, 0, 0)

local introText = Instance.new("TextLabel", introFrame)
introText.Size = UDim2.new(1, 0, 0.2, 0)
introText.Position = UDim2.new(0, 0, 0.35, 0)
introText.BackgroundTransparency = 1
introText.Text = "ONE LIFE MODE"
introText.TextColor3 = Color3.new(1, 0, 0)
introText.TextScaled = true
introText.Font = Enum.Font.Arcade

local warningText = Instance.new("TextLabel", introFrame)
warningText.Size = UDim2.new(1, 0, 0.2, 0)
warningText.Position = UDim2.new(0, 0, 0.5, 0)
warningText.BackgroundTransparency = 1
warningText.Text = "If you die, you're done. No respawns."
warningText.TextColor3 = Color3.new(1, 1, 1)
warningText.TextScaled = true
warningText.Font = Enum.Font.GothamBold

local hpLabel = Instance.new("TextLabel", gui)
hpLabel.Size = UDim2.new(0.3, 0, 0.08, 0)
hpLabel.Position = UDim2.new(0.35, 0, 0.05, 0)
hpLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
hpLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
hpLabel.TextScaled = true
hpLabel.Font = Enum.Font.GothamBold
hpLabel.Text = "Health: 100"

local function addOverheadTag(character)
	local head = character:FindFirstChild("Head")
	if not head then return end

	local tag = Instance.new("BillboardGui", head)
	tag.Name = "OneLifeOverhead"
	tag.Size = UDim2.new(0, 200, 0, 50)
	tag.StudsOffset = Vector3.new(0, 2, 0)
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

local function playDeathScene()
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
			sound.Volume = sound.Volume - 1/30
			task.wait(0.1)
		end
	end)

	task.delay(17, function()
		player:Kick("You died. One life only.")
	end)
end

local function setupCharacter(character)
	local hum = character:WaitForChild("Humanoid")
	local root = character:WaitForChild("HumanoidRootPart")

	addOverheadTag(character)
	local originalCFrame = root.CFrame
	root.CFrame = CFrame.new(0, 150, 0)
	task.wait(0.1)
	root.Anchored = true
	hum.Health = hum.MaxHealth

	task.delay(5, function()
		TweenService:Create(introFrame, TweenInfo.new(2), {BackgroundTransparency = 1}):Play()
		task.wait(2)
		introFrame:Destroy()
		root.Anchored = false
		root.CFrame = originalCFrame
	end)

	hum.HealthChanged:Connect(function(hp)
		hpLabel.Text = "Health: " .. math.floor(hp)
		if hp <= 25 then
			hpLabel.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
		else
			hpLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		end
	end)

	hum.Died:Connect(function()
		playDeathScene()
	end)
end

if player.Character then
	setupCharacter(player.Character)
end
player.CharacterAdded:Connect(setupCharacter)

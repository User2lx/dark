local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local humanoid = char:WaitForChild("Humanoid")
local root = char:WaitForChild("HumanoidRootPart")

-- One-time flags
local hasDied = false
local introDone = false

-- Freeze and teleport up a little for intro
root.Anchored = true
root.CFrame = root.CFrame + Vector3.new(0, 25, 0)

-- Show intro UI
local screen = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
screen.IgnoreGuiInset = true
screen.ResetOnSpawn = false
screen.Name = "HardcoreIntro"

local label = Instance.new("TextLabel", screen)
label.Size = UDim2.new(1, 0, 1, 0)
label.BackgroundTransparency = 1
label.Text = "HARDCORE MODE ENABLED\nYou only have ONE LIFE."
label.TextColor3 = Color3.fromRGB(255, 0, 0)
label.Font = Enum.Font.Arcade
label.TextScaled = true

task.wait(4)

-- Remove intro
label:Destroy()
screen:Destroy()
root.Anchored = false
introDone = true

-- Create "ONE LIFE" billboard
local billboard = Instance.new("BillboardGui", char)
billboard.Name = "OneLifeBillboard"
billboard.Size = UDim2.new(0, 200, 0, 50)
billboard.StudsOffset = Vector3.new(0, 4, 0)
billboard.AlwaysOnTop = true

local text = Instance.new("TextLabel", billboard)
text.Size = UDim2.new(1, 0, 1, 0)
text.BackgroundTransparency = 1
text.Text = "☠ ONE LIFE ☠"
text.TextColor3 = Color3.fromRGB(255, 0, 0)
text.Font = Enum.Font.GothamBlack
text.TextScaled = true

-- Monitor health for red flash if low
RunService.RenderStepped:Connect(function()
	if humanoid.Health > 0 and humanoid.Health <= 25 then
		text.TextColor3 = Color3.fromRGB(255, 50, 50)
	end
end)

-- On death
humanoid.Died:Connect(function()
	if hasDied then return end
	hasDied = true

	-- Say one-time message
	local deathMsg = "I have died. I will now be kicked for losing my one life. This hardcore mode script was made by Nox. This is not an exploit; it is a mod."
	game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest"):FireServer(deathMsg, "All")

	-- Death sound
	local deathSound = Instance.new("Sound", SoundService)
	deathSound.SoundId = "rbxassetid://9117314713"
	deathSound.Volume = 1
	deathSound:Play()

	-- Fade out over time
	local tween = TweenService:Create(deathSound, TweenInfo.new(5), {Volume = 0})
	tween:Play()

	task.wait(17)
	player:Kick("You have lost your one life.")
end)

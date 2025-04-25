local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remote = ReplicatedStorage:WaitForChild("Backdoor")

local colorSequence = ColorSequence.new(Color3.fromRGB(71, 148, 253), Color3.fromRGB(71, 253, 160))
local style = "Standard"

remote:FireServer(colorSequence, style)

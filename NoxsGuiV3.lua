local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "NoxsGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Toggle Button
local ToggleButton = Instance.new("TextButton")
ToggleButton.Parent = ScreenGui
ToggleButton.Name = "ToggleButton"
ToggleButton.Text = "Toggle GUI"
ToggleButton.Size = UDim2.new(0, 150, 0, 50)
ToggleButton.Position = UDim2.new(0, 50, 0, 50)
ToggleButton.BackgroundColor3 = Color3.fromRGB(138, 43, 226)
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.TextSize = 20

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 15)
ToggleCorner.Parent = ToggleButton

-- Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 700, 0, 500)
MainFrame.Position = UDim2.new(0.5, -350, 0.5, -250)
MainFrame.BackgroundColor3 = Color3.fromRGB(48, 25, 52)
MainFrame.Visible = false
MainFrame.ClipsDescendants = true

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 20)
MainCorner.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Parent = MainFrame
Title.Text = "Nox's GUI V3 😈"
Title.Size = UDim2.new(1, 0, 0, 50)
Title.BackgroundColor3 = Color3.fromRGB(75, 0, 130)
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 24

-- Walkspeed Slider
local WalkspeedLabel = Instance.new("TextLabel")
WalkspeedLabel.Parent = MainFrame
WalkspeedLabel.Text = "Walkspeed: 16"
WalkspeedLabel.Size = UDim2.new(0.4, 0, 0, 40)
WalkspeedLabel.Position = UDim2.new(0.05, 0, 0.1, 0)
WalkspeedLabel.BackgroundColor3 = Color3.fromRGB(75, 0, 130)
WalkspeedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
WalkspeedLabel.Font = Enum.Font.GothamBold
WalkspeedLabel.TextSize = 14

local WalkspeedSlider = Instance.new("TextButton")
WalkspeedSlider.Parent = MainFrame
WalkspeedSlider.Text = "Adjust Walkspeed"
WalkspeedSlider.Size = UDim2.new(0.4, 0, 0, 40)
WalkspeedSlider.Position = UDim2.new(0.05, 0, 0.2, 0)
WalkspeedSlider.BackgroundColor3 = Color3.fromRGB(138, 43, 226)
WalkspeedSlider.TextColor3 = Color3.fromRGB(255, 255, 255)
WalkspeedSlider.Font = Enum.Font.GothamBold
WalkspeedSlider.TextSize = 14

WalkspeedSlider.MouseButton1Click:Connect(function()
    local walkspeed = math.random(16, 1000) -- Replace this with actual slider logic
    WalkspeedLabel.Text = "Walkspeed: " .. walkspeed
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = walkspeed
end)

-- Auto Jump Toggle
local AutoJumpLabel = Instance.new("TextLabel")
AutoJumpLabel.Parent = MainFrame
AutoJumpLabel.Text = "Auto Jump: Off"
AutoJumpLabel.Size = UDim2.new(0.4, 0, 0, 40)
AutoJumpLabel.Position = UDim2.new(0.5, 0, 0.1, 0)
AutoJumpLabel.BackgroundColor3 = Color3.fromRGB(75, 0, 130)
AutoJumpLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoJumpLabel.Font = Enum.Font.GothamBold
AutoJumpLabel.TextSize = 14

local AutoJumpToggle = Instance.new("TextButton")
AutoJumpToggle.Parent = MainFrame
AutoJumpToggle.Text = "Toggle Auto Jump"
AutoJumpToggle.Size = UDim2.new(0.4, 0, 0, 40)
AutoJumpToggle.Position = UDim2.new(0.5, 0, 0.2, 0)
AutoJumpToggle.BackgroundColor3 = Color3.fromRGB(138, 43, 226)
AutoJumpToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoJumpToggle.Font = Enum.Font.GothamBold
AutoJumpToggle.TextSize = 14

local autoJumpEnabled = false
local autoJumpConnection

AutoJumpToggle.MouseButton1Click:Connect(function()
    autoJumpEnabled = not autoJumpEnabled
    AutoJumpLabel.Text = "Auto Jump: " .. (autoJumpEnabled and "On" or "Off")
    if autoJumpEnabled then
        autoJumpConnection = game:GetService("RunService").Stepped:Connect(function()
            if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                game.Players.LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end)
    else
        if autoJumpConnection then
            autoJumpConnection:Disconnect()
            autoJumpConnection = nil
        end
    end
end)

-- Toggle GUI Visibility
ToggleButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

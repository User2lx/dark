local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "NoxGui"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 400, 0, 300)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 60)
MainFrame.BorderSizePixel = 0
MainFrame.BackgroundTransparency = 0.2
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 15)
UICorner.Parent = MainFrame

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(0, 255, 255)
UIStroke.Thickness = 3
UIStroke.Parent = MainFrame

local WelcomeFrame = Instance.new("Frame")
WelcomeFrame.Size = UDim2.new(0, 100, 0, 100)
WelcomeFrame.Position = UDim2.new(0, 10, 0, 10)
WelcomeFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 80)
WelcomeFrame.Parent = MainFrame

local WelcomeUICorner = Instance.new("UICorner")
WelcomeUICorner.CornerRadius = UDim.new(1, 0)
WelcomeUICorner.Parent = WelcomeFrame

local WelcomeLabel = Instance.new("TextLabel")
WelcomeLabel.Size = UDim2.new(0, 200, 0, 50)
WelcomeLabel.Position = UDim2.new(0, 120, 0, 25)
WelcomeLabel.BackgroundTransparency = 1
WelcomeLabel.Text = "Welcome, " .. game.Players.LocalPlayer.Name
WelcomeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
WelcomeLabel.Font = Enum.Font.SourceSansBold
WelcomeLabel.TextSize = 20
WelcomeLabel.Parent = MainFrame

local function createButton(text, callback, position)
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(0, 180, 0, 40)
    Button.Position = position
    Button.BackgroundColor3 = Color3.fromRGB(15, 15, 100)
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.Text = text
    Button.Font = Enum.Font.SourceSansBold
    Button.TextSize = 18
    Button.Parent = MainFrame

    local ButtonUICorner = Instance.new("UICorner")
    ButtonUICorner.CornerRadius = UDim.new(0, 10)
    ButtonUICorner.Parent = Button

    Button.MouseButton1Click:Connect(callback)
end

createButton("Fe scp 096(r6)", function()
    loadstring(game:HttpGet("https://pastefy.app/M25RnnGm/raw"))()
end, UDim2.new(0, 10, 0, 120))

createButton("Grab Knife(client)", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/retpirato/Roblox-Scripts/refs/heads/master/Grab%20Knife%20V4.lua"))()
end, UDim2.new(0, 10, 0, 170))

createButton("Inf Yield", function()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/projecter94/ECP/refs/heads/main/Everage%20Control%20Panel"))()
    end)
end, UDim2.new(0, 10, 0, 220))

createButton("Self Destruct", function()
    ScreenGui:Destroy()
end, UDim2.new(0, 10, 0, 270))

local WalkSpeedTextBox = Instance.new("TextBox")
WalkSpeedTextBox.Size = UDim2.new(0, 180, 0, 40)
WalkSpeedTextBox.Position = UDim2.new(0, 210, 0, 120)
WalkSpeedTextBox.BackgroundColor3 = Color3.fromRGB(15, 15, 100)
WalkSpeedTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
WalkSpeedTextBox.PlaceholderText = "Enter WalkSpeed"
WalkSpeedTextBox.Font = Enum.Font.SourceSans
WalkSpeedTextBox.TextSize = 18
WalkSpeedTextBox.Parent = MainFrame

local WalkSpeedUICorner = Instance.new("UICorner")
WalkSpeedUICorner.CornerRadius = UDim.new(0, 10)
WalkSpeedUICorner.Parent = WalkSpeedTextBox

WalkSpeedTextBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        local speed = tonumber(WalkSpeedTextBox.Text)
        if speed then
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = speed
        end
    end
end)

local AutoJumpButton = Instance.new("TextButton")
AutoJumpButton.Size = UDim2.new(0, 180, 0, 40)
AutoJumpButton.Position = UDim2.new(0, 210, 0, 170)
AutoJumpButton.BackgroundColor3 = Color3.fromRGB(15, 15, 100)
AutoJumpButton.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoJumpButton.Text = "Auto Jump"
AutoJumpButton.Font = Enum.Font.SourceSansBold
AutoJumpButton.TextSize = 18
AutoJumpButton.Parent = MainFrame

AutoJumpButton.MouseButton1Click:Connect(function()
    while wait(1) do
        game.Players.LocalPlayer.Character.Humanoid.Jump = true
    end
end)

local DebugLabel = Instance.new("TextLabel")
DebugLabel.Size = UDim2.new(0, 380, 0, 50)
DebugLabel.Position = UDim2.new(0, 10, 0, 10)
DebugLabel.BackgroundTransparency = 1
DebugLabel.Text = "Debug: GUI Active for 0 seconds"
DebugLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
DebugLabel.Font = Enum.Font.SourceSans
DebugLabel.TextSize = 14
DebugLabel.Parent = MainFrame

local startTime = tick()
game:GetService("RunService").RenderStepped:Connect(function()
    local elapsedTime = math.floor(tick() - startTime)
    DebugLabel.Text = "Debug: GUI Active for " .. elapsedTime .. " seconds"
end)

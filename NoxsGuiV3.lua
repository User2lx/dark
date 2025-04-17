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
MainFrame.Active = true
MainFrame.Draggable = true

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 15)
UICorner.Parent = MainFrame

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(0, 255, 255)
UIStroke.Thickness = 3
UIStroke.Parent = MainFrame

local WelcomeLabel = Instance.new("TextLabel")
WelcomeLabel.Size = UDim2.new(0, 200, 0, 50)
WelcomeLabel.Position = UDim2.new(0, 100, 0, 10)
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
    Button.TextColor3 = Color3.fromRGB(0, 255, 255)
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
end, UDim2.new(0, 10, 0, 60))

createButton("Grab Knife(client)", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/retpirato/Roblox-Scripts/refs/heads/master/Grab%20Knife%20V4.lua"))()
end, UDim2.new(0, 10, 0, 110))

createButton("Inf Yield", function()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/projecter94/ECP/refs/heads/main/Everage%20Control%20Panel"))()
    end)
end, UDim2.new(0, 10, 0, 160))

createButton("Self Destruct", function()
    ScreenGui:Destroy()
end, UDim2.new(0, 10, 0, 210))

local ToggleButton = Instance.new("TextButton")
ToggleButton.Size = UDim2.new(0, 100, 0, 30)
ToggleButton.Position = UDim2.new(0, 10, 0, 260)
ToggleButton.BackgroundColor3 = Color3.fromRGB(15, 15, 100)
ToggleButton.TextColor3 = Color3.fromRGB(0, 255, 255)
ToggleButton.Text = "Toggle GUI"
ToggleButton.Font = Enum.Font.SourceSansBold
ToggleButton.TextSize = 14
ToggleButton.Parent = ScreenGui

local ToggleUICorner = Instance.new("UICorner")
ToggleUICorner.CornerRadius = UDim.new(0, 10)
ToggleUICorner.Parent = ToggleButton

ToggleButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

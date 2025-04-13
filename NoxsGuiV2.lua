local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "NoxsGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

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
ToggleButton.Active = true
ToggleButton.Visible = true -- Ensure the button is visible

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 15)
ToggleCorner.Parent = ToggleButton

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
Title.Text = "Nox's gui V2 😈"
Title.Size = UDim2.new(1, 0, 0, 50)
Title.BackgroundColor3 = Color3.fromRGB(75, 0, 130)
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 24

local function AddFunctionButton(parent, label, position, callback)
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(0.9, 0, 0, 40)
    Button.Position = position
    Button.Text = label
    Button.Font = Enum.Font.Gotham
    Button.BackgroundColor3 = Color3.fromRGB(138, 43, 226)
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.TextSize = 14
    Button.Parent = parent
    Button.Visible = true -- Ensure buttons are visible

    local ButtonCorner = Instance.new("UICorner")
    ButtonCorner.CornerRadius = UDim.new(0, 10)
    ButtonCorner.Parent = Button

    Button.MouseButton1Click:Connect(callback)
end

local function AnimateGUI(frame, isVisible)
    if isVisible then
        frame.Visible = true
        for i = 1, 10 do
            frame.BackgroundTransparency = 1 - (i * 0.1)
            wait(0.02)
        end
    else
        for i = 1, 10 do
            frame.BackgroundTransparency = i * 0.1
            wait(0.02)
        end
        frame.Visible = false
    end
end

ToggleButton.MouseButton1Click:Connect(function()
    AnimateGUI(MainFrame, not MainFrame.Visible)
end)

-- Add example buttons to the MainFrame to confirm functionality
AddFunctionButton(MainFrame, "Example Button 1", UDim2.new(0.05, 0, 0.1, 0), function()
    print("Button 1 clicked")
end)

AddFunctionButton(MainFrame, "Example Button 2", UDim2.new(0.05, 0, 0.2, 0), function()
    print("Button 2 clicked")
end)

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "NoxsGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local ToggleButton = Instance.new("TextButton")
ToggleButton.Parent = ScreenGui
ToggleButton.Name = "ToggleButton"
ToggleButton.Text = "Toggle GUI"
ToggleButton.Size = UDim2.new(0, 150, 0, 50)
ToggleButton.BackgroundColor3 = Color3.fromRGB(138, 43, 226)
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.TextSize = 20
ToggleButton.Active = true

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
Title.Text = "Nox's GUI v2😈"
Title.Size = UDim2.new(1, 0, 0, 50)
Title.BackgroundColor3 = Color3.fromRGB(75, 0, 130)
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 24

local function repositionButtonWithinScreen(button)
    local screenSize = workspace.CurrentCamera.ViewportSize
    local buttonSize = button.AbsoluteSize
    local buttonPosition = button.AbsolutePosition

    if buttonPosition.X < 0 then
        button.Position = UDim2.new(0, 10, button.Position.Y.Scale, button.Position.Y.Offset)
    elseif buttonPosition.X + buttonSize.X > screenSize.X then
        button.Position = UDim2.new(0, screenSize.X - buttonSize.X - 10, button.Position.Y.Scale, button.Position.Y.Offset)
    end

    if buttonPosition.Y < 0 then
        button.Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, 0, 10)
    elseif buttonPosition.Y + buttonSize.Y > screenSize.Y then
        button.Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, 0, screenSize.Y - buttonSize.Y - 10)
    end
end

ToggleButton.Position = UDim2.new(0, 50, 0, 50)
repositionButtonWithinScreen(ToggleButton)

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

    local ButtonCorner = Instance.new("UICorner")
    ButtonCorner.CornerRadius = UDim.new(0, 10)
    ButtonCorner.Parent = Button

    Button.MouseButton1Click:Connect(callback)

    local dragging, dragInput, dragStart, startPos = false, nil, nil, nil

    Button.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = Button.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    Button.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            Button.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
end

local function AddInputField(parent, label, position, callback)
    local InputFrame = Instance.new("Frame")
    InputFrame.Size = UDim2.new(0.9, 0, 0, 40)
    InputFrame.Position = position
    InputFrame.BackgroundColor3 = Color3.fromRGB(138, 43, 226)
    InputFrame.Parent = parent

    local InputCorner = Instance.new("UICorner")
    InputCorner.CornerRadius = UDim.new(0, 10)
    InputCorner.Parent = InputFrame

    local InputLabel = Instance.new("TextLabel")
    InputLabel.Text = label
    InputLabel.Size = UDim2.new(0.5, -10, 1, 0)
    InputLabel.Position = UDim2.new(0, 10, 0, 0)
    InputLabel.BackgroundTransparency = 1
    InputLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    InputLabel.Font = Enum.Font.Gotham
    InputLabel.TextSize = 14
    InputLabel.Parent = InputFrame

    local InputBox = Instance.new("TextBox")
    InputBox.PlaceholderText = "Enter Value"
    InputBox.Size = UDim2.new(0.5, -10, 1, -10)
    InputBox.Position = UDim2.new(0.5, 5, 0, 5)
    InputBox.Font = Enum.Font.Gotham
    InputBox.TextColor3 = Color3.fromRGB(0, 0, 0)
    InputBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    InputBox.TextSize = 14
    InputBox.Parent = InputFrame

    local BoxCorner = Instance.new("UICorner")
    BoxCorner.CornerRadius = UDim.new(0, 10)
    BoxCorner.Parent = InputBox

    InputBox.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            local value = tonumber(InputBox.Text)
            if value then
                callback(value)
            end
        end
    end)
end

AddInputField(MainFrame, "Set WalkSpeed", UDim2.new(0.05, 0, 0.1, 0), function(value)
    local character = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    humanoid.WalkSpeed = value
end)

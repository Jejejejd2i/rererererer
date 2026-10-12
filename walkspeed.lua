local player = game:GetService("Players").LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "SpeedMenu"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local shoe = Instance.new("TextButton")
shoe.Size = UDim2.fromOffset(55, 55)
shoe.Position = UDim2.new(0, 20, 0.5, -27)
shoe.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
shoe.Text = "👟"
shoe.TextSize = 30
shoe.Parent = gui
Instance.new("UICorner", shoe).CornerRadius = UDim.new(0, 14)

local frame = Instance.new("Frame")
frame.Size = UDim2.fromOffset(260, 150)
frame.Position = UDim2.new(0.5, -130, 0.5, -75)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
frame.Visible = false
frame.Parent = gui
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 14)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 35)
title.BackgroundTransparency = 1
title.Text = "👟 ВЫБОР СКОРОСТИ"
title.TextColor3 = Color3.new(1, 1, 1)
title.TextSize = 17
title.Parent = frame

local input = Instance.new("TextBox")
input.Size = UDim2.new(1, -30, 0, 40)
input.Position = UDim2.new(0, 15, 0, 42)
input.BackgroundColor3 = Color3.fromRGB(55, 55, 70)
input.TextColor3 = Color3.new(1, 1, 1)
input.PlaceholderText = "Скорость: 1–2500"
input.Text = ""
input.TextSize = 16
input.ClearTextOnFocus = false
input.Parent = frame
Instance.new("UICorner", input).CornerRadius = UDim.new(0, 8)

local apply = Instance.new("TextButton")
apply.Size = UDim2.new(1, -30, 0, 40)
apply.Position = UDim2.new(0, 15, 0, 95)
apply.BackgroundColor3 = Color3.fromRGB(40, 170, 100)
apply.TextColor3 = Color3.new(1, 1, 1)
apply.Text = "ВВЕСТИ"
apply.TextSize = 17
apply.Parent = frame
Instance.new("UICorner", apply).CornerRadius = UDim.new(0, 8)

shoe.Activated:Connect(function()
    frame.Visible = not frame.Visible
end)

apply.Activated:Connect(function()
    local speed = tonumber(input.Text)

    if not speed or speed < 1 or speed > 2500
        or speed ~= math.floor(speed) then
        apply.Text = "Введи число от 1 до 2500"
        return
    end

    local character = player.Character
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")

    if humanoid then
        humanoid.WalkSpeed = speed
        apply.Text = "ГОТОВО!"
    end
end)

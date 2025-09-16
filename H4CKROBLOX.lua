local lp = game:GetService("Players").LocalPlayer
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "BNXYUNG_GUI"

local panel = Instance.new("Frame", gui)
panel.Size = UDim2.new(0, 500, 0, 400)
panel.Position = UDim2.new(0.5, -250, 1, 0)
panel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
panel.Visible = true

-- Bordes + sombra
local corner = Instance.new("UICorner", panel)
corner.CornerRadius = UDim.new(0, 12)
local stroke = Instance.new("UIStroke", panel)
stroke.Thickness = 2
stroke.Color = Color3.fromRGB(255, 0, 100)

-- Animación de entrada
local TweenService = game:GetService("TweenService")
TweenService:Create(panel, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {
    Position = UDim2.new(0.5, -250, 0.5, -200)
}):Play()
-- Título BNXYUNG7
local title = Instance.new("TextLabel", panel)
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0, 0)
title.Text = "🔥 BNXYUNG7 MENU 🔥"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
title.Font = Enum.Font.GothamBold
title.TextSize = 20

-- Botón ❌ cerrar
local closeBtn = Instance.new("TextButton", panel)
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -40, 0, 5)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 18

-- Botón ➖ minimizar
local minimizeBtn = Instance.new("TextButton", panel)
minimizeBtn.Size = UDim2.new(0, 30, 0, 30)
minimizeBtn.Position = UDim2.new(1, -80, 0, 5)
minimizeBtn.Text = "-"
minimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizeBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
minimizeBtn.Font = Enum.Font.GothamBold
minimizeBtn.TextSize = 18

-- Botón flotante para reabrir
local showBtn = Instance.new("TextButton", gui)
showBtn.Size = UDim2.new(0, 160, 0, 40)
showBtn.Position = UDim2.new(0.5, -80, 0, 10)
showBtn.Text = "+ BNXYUNG7 MENU"
showBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
showBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
showBtn.Font = Enum.Font.GothamBold
showBtn.TextSize = 16
showBtn.Visible = false

-- Funciones de los botones
closeBtn.MouseButton1Click:Connect(function()
    panel.Visible = false
    showBtn.Visible = true
end)

minimizeBtn.MouseButton1Click:Connect(function()
    panel.Visible = false
    showBtn.Visible = true
end)

showBtn.MouseButton1Click:Connect(function()
    panel.Visible = true
    showBtn.Visible = false
end)
local aimbotTab = {
    {"Headlock Aimbot", function()
        _G.AimbotEnabled = true
        _G.AimPart = "Head"
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/Aimbot-Script/main/Aimbot%20Script.lua"))()
    end},
    {"Bodylock Aimbot", function()
        _G.AimbotEnabled = true
        _G.AimPart = "HumanoidRootPart"
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/Aimbot-Script/main/Aimbot%20Script.lua"))()
    end},
    {"Toggle Aimbot", function()
        _G.AimbotEnabled = not _G.AimbotEnabled
    end}
}
local espTab = {
    {"ESP Skeleton Azul", function()
        for _, p in pairs(game:GetService("Players"):GetPlayers()) do
            if p ~= lp and p.Character then
                for _, partName in ipairs({"Head", "Torso", "LeftArm", "RightArm", "LeftLeg", "RightLeg"}) do
                    local part = p.Character:FindFirstChild(partName)
                    if part then
                        local box = Instance.new("BoxHandleAdornment", part)
                        box.Size = part.Size
                        box.Adornee = part
                        box.AlwaysOnTop = true
                        box.ZIndex = 10
                        box.Color3 = Color3.fromRGB(0, 170, 255)
                        box.Transparency = 0.3
                    end
                end
            end
        end
    end}
}
local vidaTab = {
    {"Vida infinita", function()
        local char = lp.Character
        if char and char:FindFirstChild("Humanoid") then
            while true do
                char.Humanoid.Health = char.Humanoid.MaxHealth
                wait(0.5)
            end
        end
    end},
    {"Notificación de activación", function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "BNXYUNG7",
            Text = "Función activada correctamente ✅",
            Duration = 3
        })
    end}
}
local scroll = Instance.new("ScrollingFrame", panel)
scroll.Size = UDim2.new(1, -20, 1, -60)
scroll.Position = UDim2.new(0, 10, 0, 50)
scroll.CanvasSize = UDim2.new(0, 0, 0, 1000)
scroll.ScrollBarThickness = 6
scroll.BackgroundTransparency = 1

local layout = Instance.new("UIListLayout", scroll)
layout.Padding = UDim.new(0, 6)
layout.SortOrder = Enum.SortOrder.LayoutOrder

-- Mostrar botones por categoría
for _, data in ipairs(aimbotTab) do
    local btn = Instance.new("TextButton", scroll)
    btn.Size = UDim2.new(1, -10, 0, 30)
    btn.Text = "🎯 " .. data[1]
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 16
    btn.MouseButton1Click:Connect(data[2])
end

for _, data in ipairs(espTab) do
    local btn = Instance.new("TextButton", scroll)
    btn.Size = UDim2.new(1, -10, 0, 30)
    btn.Text = "👁️ " .. data[1]
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 16
    btn.MouseButton1Click:Connect(data[2])
end

for _, data in ipairs(vidaTab) do
    local btn = Instance.new("TextButton", scroll)
    btn.Size = UDim2.new(1, -10, 0, 30)
    btn.Text = "❤️ " .. data[1]
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 16
    btn.MouseButton1Click:Connect(data[2])
end

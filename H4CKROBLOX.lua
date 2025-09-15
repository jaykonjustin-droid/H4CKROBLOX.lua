local lp = game:GetService("Players").LocalPlayer
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "BNXYUNG_GUI"

local panel = Instance.new("Frame", gui)
panel.Size = UDim2.new(0, 500, 0, 400)
panel.Position = UDim2.new(0.5, -250, 1, 0)
panel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
panel.Visible = true

-- Título BNXYUNG7
local title = Instance.new("TextLabel", panel)
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0, 0)
title.Text = "🔥 BNXYUNG7 MENU 🔥"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
title.Font = Enum.Font.GothamBold
title.TextSize = 20

-- Bordes redondeados
local corner = Instance.new("UICorner", panel)
corner.CornerRadius = UDim.new(0, 12)

-- Sombra externa
local stroke = Instance.new("UIStroke", panel)
stroke.Thickness = 2
stroke.Color = Color3.fromRGB(255, 0, 100)

-- Animación de entrada
local TweenService = game:GetService("TweenService")
TweenService:Create(panel, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {
    Position = UDim2.new(0.5, -250, 0.5, -200)
}):Play()

-- Categoría AIMBOT PRO
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

-- Sistema de botones
local scroll = Instance.new("ScrollingFrame", panel)
scroll.Size = UDim2.new(1, -20, 1, -60)
scroll.Position = UDim2.new(0, 10, 0, 50)
scroll.CanvasSize = UDim2.new(0, 0, 0, 1000)
scroll.ScrollBarThickness = 6
scroll.BackgroundTransparency = 1

local layout = Instance.new("UIListLayout", scroll)
layout.Padding = UDim.new(0, 6)
layout.SortOrder = Enum.SortOrder.LayoutOrder

for _, data in ipairs(aimbotTab) do
    local btn = Instance.new("TextButton", scroll)
    btn.Size = UDim2.new(1, -10, 0, 30)
    btn.Text = "🔘 " .. data[1]
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 16
    btn.MouseButton1Click:Connect(data[2])
end

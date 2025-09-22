local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local lp = Players.LocalPlayer
local mouse = lp:GetMouse()

-- 📌 Aimbot por FOV reducido
local function getClosestPlayer()
    local closest, dist = nil, math.huge
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= lp and p.Character and p.Character:FindFirstChild("Head") then
            local pos = p.Character.Head.Position
            local screenPos, onScreen = workspace.CurrentCamera:WorldToViewportPoint(pos)
            if onScreen then
                local mag = (Vector2.new(mouse.X, mouse.Y) - Vector2.new(screenPos.X, screenPos.Y)).Magnitude
                if mag < dist and mag < 120 then
                    dist = mag
                    closest = p
                end
            end
        end
    end
    return closest
end

RunService.RenderStepped:Connect(function()
    local target = getClosestPlayer()
    if target and target.Character and target.Character:FindFirstChild("Head") then
        mouse.TargetFilter = target.Character
        mouse.Hit = target.Character.Head.CFrame
    end
end)

-- 🎛️ GUI principal
local gui = Instance.new("ScreenGui", lp:WaitForChild("PlayerGui"))
local panel = Instance.new("Frame", gui)
panel.Size = UDim2.new(0, 300, 0, 400)
panel.Position = UDim2.new(0.5, -150, 0.5, -200)
panel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
panel.BorderSizePixel = 0

-- ❌ Botón cerrar
local closeBtn = Instance.new("TextButton", panel)
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -40, 0, 5)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 18

-- ➖ Botón minimizar
local minimizeBtn = Instance.new("TextButton", panel)
minimizeBtn.Size = UDim2.new(0, 30, 0, 30)
minimizeBtn.Position = UDim2.new(1, -80, 0, 5)
minimizeBtn.Text = "-"
minimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizeBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
minimizeBtn.Font = Enum.Font.GothamBold
minimizeBtn.TextSize = 18

-- ➕ Botón flotante para reabrir
local showBtn = Instance.new("TextButton", gui)
showBtn.Size = UDim2.new(0, 160, 0, 40)
showBtn.Position = UDim2.new(0.5, -80, 0, 10)
showBtn.Text = "+ BNXYUNG7 MENU"
showBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
showBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
showBtn.Font = Enum.Font.GothamBold
showBtn.TextSize = 16
showBtn.Visible = false

-- 🔁 Funciones de los botones
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

-- 🎯 Aimbot
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

-- 👁️ ESP
local espTab = {
    {"ESP Skeleton Azul", function()
        for _, p in pairs(Players:GetPlayers()) do
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

-- ❤️ Vida infinita
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

-- 🔓 Robar / Unlocker
local stealTab = {
    {"Fake GUI Bait", function()
        local bait = Instance.new("ScreenGui", lp:WaitForChild("PlayerGui"))
        local fakeBtn = Instance.new("TextButton", bait)
        fakeBtn.Size = UDim2.new(0, 200, 0, 50)
        fakeBtn.Position = UDim2.new(0.5, -100, 0.5, -25)
        fakeBtn.Text = "💰 CLAIM FREE ROBUX"
        fakeBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        fakeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        fakeBtn.Font = Enum.Font.GothamBold
        fakeBtn.TextSize = 20
        fakeBtn.MouseButton1Click:Connect(function()
            bait:Destroy()
            game.StarterGui:SetCore("SendNotification", {
                Title = "BNXYUNG7",
                Text = "Bait ejecutado correctamente ✅",
                Duration = 3
            })
        end)
    end},
    {"AutoCollect Nearby", function()
        for _, obj in pairs(workspace:GetDescendants()) do
            if obj:IsA("Tool") and obj:FindFirstChild("Handle") then
                obj.Handle.CFrame = lp.Character.HumanoidRootPart.CFrame
            end
        end
    end}
}

-- 🛡️ Anti-ban
local antibanTab = {
    {"Activar Anti-ban", function()
        settings().Network.IncomingReplicationLag = 0.1
        game.StarterGui:SetCore("SendNotification", {
            Title = "BNXYUNG7",
            Text = "Anti-ban activado 🛡️",
            Duration = 3
        })
    end},
    {"Desactivar Anti-ban", function()
        settings().Network.IncomingReplicationLag = 0
        game.StarterGui:SetCore("SendNotification", {
            Title = "BNXYUNG7",
            Text = "Anti-ban desactivado ❌",
            Duration = 3
        })
    end}
}

-- 🔊 Sonido spam
local soundTab = {
    {"Spam de sonido", function()
        local sound = Instance.new("Sound", workspace)
        sound.SoundId = "rbxassetid://9118823105"
        sound.Volume = 10
        sound.Looped = true
        sound:Play()
    end},
    {"Detener sonido", function()
        for _, s in pairs(workspace:GetChildren()) do
            if s:IsA("Sound") then s:Stop() end
        end
    end}
}

-- 🧬 Spoofing
local spoofTab = {
    {"Cambiar nombre visual", function()
        lp.DisplayName = "BNXYUNG7🔥"
    end},
    {"Fake Rank", function()
        local tag = Instance.new("BillboardGui", lp.Character.Head)
        tag.Size = UDim2.new(0, 100, 0, 20)
        tag.Studs

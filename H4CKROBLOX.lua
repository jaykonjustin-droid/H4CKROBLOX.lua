local lp = game:GetService("Players").LocalPlayer
local gui = Instance.new("ScreenGui", game.CoreGui)
local panel = Instance.new("Frame", gui)
panel.Size = UDim2.new(0, 500, 0, 400)
panel.Position = UDim2.new(0.5, -250, 0.5, -200)
panel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
panel.Visible = true

local tabFrame = Instance.new("Frame", panel)
tabFrame.Size = UDim2.new(0, 120, 1, -50)
tabFrame.Position = UDim2.new(0, 0, 0, 50)
tabFrame.BackgroundTransparency = 1

local contentFrame = Instance.new("Frame", panel)
contentFrame.Size = UDim2.new(1, -140, 1, -60)
contentFrame.Position = UDim2.new(0, 130, 0, 50)
contentFrame.BackgroundTransparency = 1

local scroll = Instance.new("ScrollingFrame", contentFrame)
scroll.Size = UDim2.new(1, 0, 1, 0)
scroll.CanvasSize = UDim2.new(0, 0, 0, 1000)
scroll.ScrollBarThickness = 6
scroll.BackgroundTransparency = 1

local scrollLayout = Instance.new("UIListLayout", scroll)
scrollLayout.Padding = UDim.new(0, 6)
scrollLayout.SortOrder = Enum.SortOrder.LayoutOrder

local tabButtons = {}
local currentTab = "BRAINROT"

local tabs = {
    ["BRAINROT"] = {
        {"ESP Name", function()
            for _, p in pairs(game:GetService("Players"):GetPlayers()) do
                if p ~= lp and p.Character and p.Character:FindFirstChild("Head") then
                    local esp = Instance.new("BillboardGui", p.Character.Head)
                    esp.Size = UDim2.new(0, 100, 0, 40)
                    esp.AlwaysOnTop = true
                    local label = Instance.new("TextLabel", esp)
                    label.Size = UDim2.new(1, 0, 1, 0)
                    label.BackgroundTransparency = 1
                    label.Text = p.Name
                    label.TextColor3 = Color3.fromRGB(255, 255, 255)
                    label.Font = Enum.Font.GothamBold
                    label.TextSize = 14
                end
            end
        end},
        {"Aimbot (Headlock)", function()
            _G.AimbotEnabled = true
            _G.AimPart = "Head"
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/Aimbot-Script/main/Aimbot%20Script.lua"))()
        end}
    },
    ["MOVEMENT"] = {
        {"Speed x2", function()
            lp.Character.Humanoid.WalkSpeed = 32
        end},
        {"Jump Boost", function()
            lp.Character.Humanoid.JumpPower = 100
        end}
    },
    ["SERVER"] = {
        {"Rejoin", function()
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, lp)
        end},
        {"Server Hop", function()
            loadstring(game:HttpGet("https://pastebin.com/raw/5wzYFzTt"))()
        end}
    },
    ["CRÉDITO"] = {
        {"Creado por BNXYUNG7", function() end},
        {"Grupo: https://t.me/kakashi_ios", function() end}
    }
}

for tabName, actions in pairs(tabs) do
    local btn = Instance.new("TextButton", tabFrame)
    btn.Size = UDim2.new(1, -10, 0, 30)
    btn.Position = UDim2.new(0, 5, 0, #tabButtons * 35)
    btn.Text = tabName
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 16
    tabButtons[tabName] = btn
    btn.MouseButton1Click:Connect(function()
        currentTab = tabName
        for _, child in pairs(scroll:GetChildren()) do
            if child:IsA("TextButton") then
                child:Destroy()
            end
        end
        for _, action in ipairs(actions) do
            local b = Instance.new("TextButton", scroll)
            b.Size = UDim2.new(1, -10, 0, 30)
            b.Text = "🔘 " .. action[1]
            b.TextColor3 = Color3.fromRGB(255, 255, 255)
            b.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            b.Font = Enum.Font.Gotham
            b.TextSize = 16
            b.MouseButton1Click:Connect(action[2])
        end
    end)
end

local showBtn = Instance.new("TextButton", gui)
showBtn.Size = UDim2.new(0, 160, 0, 40)
showBtn.Position = UDim2.new(0, 20, 0.5, -20)
showBtn.Text = "+ BNXYUNG PANEL"
showBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
showBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
showBtn.Font = Enum.Font.GothamBold
showBtn.TextSize = 16
showBtn.Visible = false
showBtn.MouseButton1Click:Connect(function()
    panel.Visible = true
    showBtn.Visible = false
end)

local hide = Instance.new("TextButton", panel)
hide.Size = UDim2.new(0, 30, 0, 30)
hide.Position = UDim2.new(1, -70, 0, 10)
hide.Text = "-"
hide.TextColor3 = Color3.fromRGB(255, 255, 255)
hide.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
hide.Font = Enum.Font.GothamBold
hide.TextSize = 20
hide.MouseButton1Click:Connect(function()
    panel.Visible = false
    showBtn.Visible = true
end)

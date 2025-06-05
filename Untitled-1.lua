local LoadingLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Fin12n/Roblox/refs/heads/main/UI-Library/Loading.lua"))()

    LoadingLib:CreateLoading({
        Title = "Natri-hub",
        Image = "rbxassetid://85827029493751", -- Thay bằng ID hình ảnh hợp lệ
        ScriptName = "Những Update tiếp theo sẽ có thêm những scripts mới"
    })


-- Tạo UI icon bật/tắt
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local ImageLabel = Instance.new("ImageLabel")
local UICorner = Instance.new("UICorner")
local TextButton = Instance.new("TextButton")

ScreenGui.Parent = game:GetService("CoreGui")  
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local button = Instance.new("ImageButton")
button.Size = UDim2.new(0, 50, 0, 50)
button.Position = UDim2.new(0.120833337 - 0.1, 0, 0.0952890813 + 0.01, 0)
button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
button.BorderSizePixel = 0
button.Image = "http://www.roblox.com/asset/?id=85827029493751" ------ Thay vô đây nha

local TweenService = game:GetService("TweenService")

local gui = Instance.new("ScreenGui")
gui.Name = "ToggleUIFluent"
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = game:GetService("CoreGui")

button.Draggable = true
button.Parent = gui

-- Bo góc
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = button

-- Particle hiệu ứng
local particle = Instance.new("ParticleEmitter")
particle.Parent = button
particle.LightEmission = 1
particle.Size = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.1), NumberSequenceKeypoint.new(1, 0) })
particle.Lifetime = NumberRange.new(0.5, 1)
particle.Rate = 0
particle.Speed = NumberRange.new(5, 10)
particle.SpreadAngle = Vector2.new(360, 360)
particle.Color = ColorSequence.new(Color3.fromRGB(255, 85, 255), Color3.fromRGB(85, 255, 255))

-- Animation hover (tăng kích thước khi di chuột vào nút)
local hoverTween = TweenService:Create(button, TweenInfo.new(0.2, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out), { Size = UDim2.new(0, 55, 0, 55) })
local unhoverTween = TweenService:Create(button, TweenInfo.new(0.2, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out), { Size = UDim2.new(0, 50, 0, 50) })

-- Khi hover vào nút (hover effect)
button.MouseEnter:Connect(function()
    hoverTween:Play()
end)

-- Khi rời chuột ra khỏi nút (unhover effect)
button.MouseLeave:Connect(function()
    unhoverTween:Play()
end)

-- Khi bấm nút
button.MouseButton1Down:Connect(function()
    -- Particle effect khi bấm
    particle.Rate = 100

    -- Reset particle sau 1s
    task.delay(1, function()
        particle.Rate = 0
    end)

    -- Gửi phím End để bật/tắt UI
    game:GetService("VirtualInputManager"):SendKeyEvent(true, "LeftControl", false, game)
end)

UICorner.CornerRadius = UDim.new(1, 0)
UICorner.Parent = Frame

TextButton.Name = "TextButton"
TextButton.Parent = Frame
TextButton.AnchorPoint = Vector2.new(0, 0)
TextButton.Position = UDim2.new(0, 0, 0, 0)
TextButton.Size = UDim2.new(1, 0, 1, 0)
TextButton.BackgroundColor3 = Color3.fromRGB(163, 162, 165)
TextButton.BackgroundTransparency = 1
TextButton.BorderSizePixel = 1
TextButton.BorderColor3 = Color3.fromRGB(27, 42, 53)
TextButton.TextColor3 = Color3.fromRGB(27, 42, 53)
TextButton.Text = ""
TextButton.Font = Enum.Font.SourceSans
TextButton.TextSize = 8
TextButton.TextTransparency = 0

local TweenService = game:GetService("TweenService")
local VirtualInputManager = game:GetService("VirtualInputManager")

local isUIVisible = false -- trạng thái UI Fluent ban đầu ẩn
local originalSize = UDim2.new(0, 40, 0, 40)
local zoomedSize = UDim2.new(0, 30, 0, 30)
local tweenInfo = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

local fadeInTween = TweenService:Create(Frame, tweenInfo, {BackgroundTransparency = 0.25})
local fadeOutTween = TweenService:Create(Frame, tweenInfo, {BackgroundTransparency = 0})

-- Sự kiện bật/tắt UI Fluent và animation icon
TextButton.MouseButton1Down:Connect(function()
    isUIVisible = not isUIVisible
    Window:SetVisible(isUIVisible) -- bật/tắt UI Fluent

    local targetSize = isUIVisible and originalSize or zoomedSize
    TweenService:Create(ImageLabel, tweenInfo, {Size = targetSize}):Play() -- thu/phóng icon

    if isUIVisible then
        fadeOutTween:Play() -- UI bật, nền sáng hơn
    else
        fadeInTween:Play() -- UI tắt, nền mờ hơn
    end

    VirtualInputManager:SendKeyEvent(true, "LeftControl", false, game)
end)

----------------------------------------Fluent----------------------------------------
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Natri-Hub",
    SubTitle = "by Thằng ăn xin",
    TabWidth = 160,
    Size = UDim2.fromOffset(500, 350),
    Acrylic = true, 
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

----------------------------------------Tab----------------------------------------
local Tabs = {
    a = Window:AddTab({ Title = "Blox fruit", Icon = "" }),
    b = Window:AddTab({ Title = "Gow a Garden", Icon = "" }),
    c = Window:AddTab({ Title = "Dead Rail", Icon = "" }),
    d = Window:AddTab({ Title = "Rival", Icon = "" }),
    e = Window:AddTab({ Title = "Arise Crossover", Icon}),
}

--- Tab a

Tabs.a:AddButton({
    Title = "Redz Hub",
    Description = "được sử dụng",
    Callback = function()
     local Settings = {
    JoinTeam = "Pirates"; -- Pirates / Marines
    Translator = true;   -- true / false
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau"))(Settings)
    end
})

Tabs.a:AddButton({
    Title = "Xero",
    Description = "được sử dụng",
    Callback = function()
       getgenv().Team = "Marines"
getgenv().Hide_Menu = false
getgenv().Auto_Execute = true
loadstring(game:HttpGet("https://raw.githubusercontent.com/Xero2409/XeroHub/refs/heads/main/main.lua"))()
    end
})

Tabs.a:AddButton({
    Title = "HoHo",
    Description = "được sử dụng",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI"))()
    end
})

Tabs.a:AddButton({
    Title = "tổng hợp",
    Description = "sài tạp nếu trong Natri-hub thiếu",
    Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/AnhDzaiScript/TuanAnhIOSNew/refs/heads/main/TuanAnhIOS-TongHop.Lua"))()
    end
})

--- Tab b 

Tabs.b:AddButton({
    Title = "Blackhub",
    Description = "Auto Farm, Auto Buy, Auto Feed Pets, Auto Sell, Teleport & More",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Skibidiking123/Fisch1/refs/heads/main/FischMain"))()
    end
})

Tabs.b:AddButton({
    Title = "Grow a Garden",
    Description = "Auto Farm, Auto Event, Collect Seeds, Auto Sell, Auto Buy & More",
    Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/refs/heads/main/GrowaGarden", true))()
    end
})

Tabs.b:AddButton({
    Title = "Speed Hub ",
    Description = "Auto Farm, Auto Collect, Auto Buy, Auto Sell & More",
    Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()
    end
})

Tabs.b:AddButton({
    Title = "Grow a Garden(2)",
    Description = "Auto Farm, Auto Sell, Auto Buy, Teleport, Local Player & More",
    Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/ameicaa1/Grow-a-Garden/main/Grow_A_Garden.lua"))()
    end
})

Tabs.b:AddButton({
    Title = "Tbao Hub",
    Description = "Auto Farm, Auto Collect, Auto Sell, Auto Buy, Local Player & More",
    Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/game/refs/heads/main/TbaoHubGrowGarden"))()
    end
})

--- Tab c 
 
Tabs.c:AddButton({
    Title = "Hung Hub",
    Description = "Auto Farm Bonds",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/hungquan99/HungHub/main/loader.lua"))()
    end
})

Tabs.c:AddButton({
    Title = "NatHub",
    Description = "HomeDead RailsRoblox Script - Dead Rails NatHub | Auto Win, Collect Bonds, Aimbot, Teleport, Visual ESP & More",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ArdyBotzz/NatHub/refs/heads/master/NatHub.lua"))();
    end
})

Tabs.c:AddButton({
    Title = " Dead Rails",
    Description = "Teleport to END, Collect Bonds, Gun Aura, Countdown & More",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/refs/heads/main/DeadRails", true))()
    end
})

--- Tab d

Tabs.d:AddButton({
    Title = "Ember Hub",
    Description = "Aimbot, Visual Player ESP & More",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/scripter66/EmberHub/refs/heads/main/Rivals.lua"))()
    end

})Tabs.d:AddButton({
    Title = "Soluna",
    Description = "Aimbot, Triggerbot, Spinbot, Player ESP, Local Player & More",
    Callback = function()
        loadstring(game:HttpGet("https://soluna-script.vercel.app/main.lua",true))()
    end
})
Tabs.d:AddButton({
    Title = "RIVALS",
    Description = "Aimbot, Silent Aim, Ragebot, Skin Changer, Device Spoofer, Player ESP & More",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/blackowl1231/Z3US/refs/heads/main/main.lua"))()
    end
})

--- Tab e

Tabs.e:AddButton({
    Title = "Arise Crossover",
    Description = "Auto Attack, Auto Farm Mobs, Local Player & More",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/refs/heads/main/AriseCrossover"))()
    end
})

Tabs.d:AddButton({
    Title = "Speed HubX",
    Description = "Aimbot, Silent Aim, Ragebot, Skin Changer, Device Spoofer, Player ESP & More",Auto Farm, Auto Attack, Equip Best, Auto Sell, Teleport, Local Player & More
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()
    end
})

Tabs.d:AddButton({
    Title = "Arise Crossover scripts word",
    Description = "Auto Attack, Arise Or Destroy, Target NPC!",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/reavscripts/hub/refs/heads/main/reavscripts.lua"))()
    end
})


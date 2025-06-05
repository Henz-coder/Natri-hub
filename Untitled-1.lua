local LoadingLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Fin12n/Roblox/refs/heads/main/UI-Library/Loading.lua"))()

    LoadingLib:CreateLoading({
        Title = "Natri-hub",
        Image = "rbxassetid://85827029493751", -- Thay bằng ID hình ảnh hợp lệ
        ScriptName = "chúc các bạn có trải nghiệm tốt"
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
    e = Window:AddTab({ Title = "Arise Crossover", Icon = ""}),
}

--- Tab a

Tabs.a:AddButton({
    Title = "?",
    Description = "?",
    Callback = function()
        
    end
})

Tabs.a:AddButton({
    Title = "?",
    Description = "?",
    Callback = function()
       
    end
})

Tabs.a:AddButton({
    Title = "?",
    Description = "?",
    Callback = function()
        
    end
})


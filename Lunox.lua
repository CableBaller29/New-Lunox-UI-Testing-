local LunoxLib = {}
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local layoutCounters = {}

local function MakeWindow(config)
    config = config or {}
    local gameName = config.GameName or "Lunox Hub"
    local creator = config.Creator or "Unknown Creator"
    local logo = config.Logo or "rbxassetid://107861639174297"

    -- ScreenGui
    local ScreenGui0 = Instance.new("ScreenGui")
    ScreenGui0.Name = "Lunox"
    ScreenGui0.Parent = game.CoreGui
    ScreenGui0.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    -- Main Window
    local Frame1 = Instance.new("Frame")
    Frame1.Name = "Window"
    Frame1.Parent = ScreenGui0
    Frame1.Position = UDim2.new(0.5, 0, 0.5, 0)
    Frame1.Size = UDim2.new(0.49636, 0, 0.59701, 0)
    Frame1.AnchorPoint = Vector2.new(0.5, 0.5)
    Frame1.BackgroundColor3 = Color3.new(0, 0, 0)
    Frame1.BackgroundTransparency = 0.1
    Frame1.BorderSizePixel = 0

    -- TopBar
    local Frame2 = Instance.new("Frame")
    Frame2.Name = "TopBar"
    Frame2.Parent = Frame1
    Frame2.Size = UDim2.new(1, 0, 0.09375, 0)
    Frame2.BackgroundTransparency = 1
    Frame2.BorderSizePixel = 0

    -- Title
    local TextLabel3 = Instance.new("TextLabel")
    TextLabel3.Name = "Title"
    TextLabel3.Parent = Frame2
    TextLabel3.Position = UDim2.new(0, 0, 0.22222, 0)
    TextLabel3.Size = UDim2.new(0.252, 0, 0.44444, 0)
    TextLabel3.BackgroundTransparency = 1
    TextLabel3.Font = Enum.Font.SourceSansBold
    TextLabel3.Text = gameName
    TextLabel3.TextColor3 = Color3.new(1, 1, 1)
    TextLabel3.TextScaled = true
    TextLabel3.TextWrap = true
    local UITextSizeConstraint4 = Instance.new("UITextSizeConstraint")
    UITextSizeConstraint4.Parent = TextLabel3
    UITextSizeConstraint4.MaxTextSize = 20

    -- Logo
    local ImageLabel5 = Instance.new("ImageLabel")
    ImageLabel5.Name = "Logo"
    ImageLabel5.Parent = Frame2
    ImageLabel5.Position = UDim2.new(0.02646, 0, 0.22222, 0)
    ImageLabel5.Size = UDim2.new(0.024, 0, 0.44444, 0)
    ImageLabel5.BackgroundTransparency = 1
    ImageLabel5.Image = logo

    -- Close Button
    local TextButton6 = Instance.new("TextButton")
    TextButton6.Name = "Close"
    TextButton6.Parent = Frame2
    TextButton6.Position = UDim2.new(0.97333, 0, 0.43333, 0)
    TextButton6.Size = UDim2.new(0.03333, 0, 0.55555, 0)
    TextButton6.AnchorPoint = Vector2.new(0.5, 0.5)
    TextButton6.BackgroundColor3 = Color3.new(0, 0, 0)
    TextButton6.BorderSizePixel = 0
    TextButton6.Font = Enum.Font.SourceSansBold
    TextButton6.Text = "x"
    TextButton6.TextColor3 = Color3.new(1, 1, 1)
    TextButton6.TextScaled = true
    TextButton6.TextWrap = true
    local UITextSizeConstraint7 = Instance.new("UITextSizeConstraint")
    UITextSizeConstraint7.Parent = TextButton6
    UITextSizeConstraint7.MaxTextSize = 25
    TextButton6.MouseButton1Click:Connect(function()
        ScreenGui0:Destroy()
    end)

    -- Mini Button
    local TextButton8 = Instance.new("TextButton")
    TextButton8.Name = "Mini"
    TextButton8.Parent = Frame2
    TextButton8.Position = UDim2.new(0.92533, 0, 0.43333, 0)
    TextButton8.Size = UDim2.new(0.03333, 0, 0.55555, 0)
    TextButton8.AnchorPoint = Vector2.new(0.5, 0.5)
    TextButton8.BackgroundColor3 = Color3.new(0, 0, 0)
    TextButton8.BorderSizePixel = 0
    TextButton8.Font = Enum.Font.SourceSansBold
    TextButton8.Text = "-"
    TextButton8.TextColor3 = Color3.new(1, 1, 1)
    TextButton8.TextScaled = true
    TextButton8.TextWrap = true
    local UITextSizeConstraint9 = Instance.new("UITextSizeConstraint")
    UITextSizeConstraint9.Parent = TextButton8
    UITextSizeConstraint9.MaxTextSize = 25
    TextButton8.MouseButton1Click:Connect(function()
        Frame1.Visible = not Frame1.Visible
    end)

    -- Aspect Ratios
    local UIAspectRatioConstraint10 = Instance.new("UIAspectRatioConstraint")
    UIAspectRatioConstraint10.Parent = Frame2
    UIAspectRatioConstraint10.AspectRatio = 16.66666
    local UIAspectRatioConstraint11 = Instance.new("UIAspectRatioConstraint")
    UIAspectRatioConstraint11.Parent = Frame1
    UIAspectRatioConstraint11.AspectRatio = 1.5625

    -- Dividers
    local Frame12 = Instance.new("Frame")
    Frame12.Name = "Divider"
    Frame12.Parent = Frame1
    Frame12.Position = UDim2.new(0, 0, 0.08017, 0)
    Frame12.Size = UDim2.new(0.99923, 0, 0.00210, 0)
    Frame12.BackgroundColor3 = Color3.new(1, 1, 1)
    Frame12.BorderSizePixel = 0

    local Frame13 = Instance.new("Frame")
    Frame13.Name = "Divider2"
    Frame13.Parent = Frame1
    Frame13.Position = UDim2.new(0.25115, 0, 1, 0)
    Frame13.Size = UDim2.new(0.00135, 0, -0.91779, 0)
    Frame13.BackgroundColor3 = Color3.new(1, 1, 1)
    Frame13.BorderSizePixel = 0

    -- Tabs
    local TabPanel = Instance.new("Frame")
    TabPanel.Name = "Tabs"
    TabPanel.Parent = Frame1
    TabPanel.Position = UDim2.new(0, 0, 0.08228, 0)
    TabPanel.Size = UDim2.new(0.25115, 0, 0.91771, 0)
    TabPanel.BackgroundTransparency = 1
    local UIListLayout15 = Instance.new("UIListLayout")
    UIListLayout15.Parent = TabPanel
    UIListLayout15.HorizontalAlignment = Enum.HorizontalAlignment.Center
    UIListLayout15.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout15.Padding = UDim.new(0, 5)

    -- Content Frame
    local Frame16 = Instance.new("Frame")
    Frame16.Name = "ContentFrame"
    Frame16.Parent = Frame1
    Frame16.Position = UDim2.new(0.62701, 0, 0.54011, 0)
    Frame16.Size = UDim2.new(0.74,0,0.906,0)
    Frame16.AnchorPoint = Vector2.new(0.5, 0.5)
    Frame16.BackgroundTransparency = 1

    return {
        ScreenGui = ScreenGui0,
        WindowFrame = Frame1,
        TopBar = Frame2,
        TitleLabel = TextLabel3,
        CloseButton = TextButton6,
        MiniButton = TextButton8,
        TabsFrame = TabPanel,
        ContentFrame = Frame16
    }
end

local function AddTab(name, isFirst)
    local TabButton = Instance.new("TextButton")
    TabButton.BackgroundTransparency = 1
    TabButton.Size = UDim2.new(1, 0, 0, 30)
    TabButton.Text = ""
    TabButton.Parent = TabPanel

    local TabTitle = Instance.new("TextLabel")
    TabTitle.Text = name
    TabTitle.Size = UDim2.new(0.8, 0, 1, 0)
    TabTitle.Position = UDim2.new(0.05, 0, 0, 0)
    TabTitle.BackgroundTransparency = 1
    TabTitle.TextScaled = true
    TabTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    TabTitle.Parent = TabButton

    local Container = Instance.new("ScrollingFrame")
    Container.Size = UDim2.new(1,0,1,0)
    Container.Position = UDim2.new(0,0,0,0)
    Container.BackgroundTransparency = 1
    Container.Visible = false
    Container.Parent = ContentFrame

    local Layout = Instance.new("UIListLayout")
    Layout.SortOrder = Enum.SortOrder.LayoutOrder
    Layout.Padding = UDim.new(0,5)
    Layout.Parent = Container

    Layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        Container.CanvasSize = UDim2.new(0,0,0,Layout.AbsoluteContentSize.Y + 10)
    end)

    if isFirst then
        Container.Visible = true
        TabTitle.TextTransparency = 0
    else
        TabTitle.TextTransparency = 0.4
    end

    return Container
end

local function AddSection(parent, sectionName)
    layoutCounters[parent] = layoutCounters[parent] or 1

    local label = Instance.new("TextLabel")
    label.Name = "SectionLabel"
    label.Size = UDim2.new(1, 0, 0, 30)
    label.Text = sectionName
    label.TextColor3 = Color3.fromRGB(255,255,255)
    label.BackgroundTransparency = 1
    label.LayoutOrder = layoutCounters[parent]
    label.Parent = parent

    layoutCounters[parent] = layoutCounters[parent] + 1
    return label
end

local function AddToggle(parent, text, itemText, callback)
    layoutCounters[parent] = layoutCounters[parent] or 1

    local Toggle = Instance.new("TextButton")
    Toggle.Name = "ToggleButton"
    Toggle.BackgroundTransparency = 1
    Toggle.Text = ""
    Toggle.Size = UDim2.new(1,0,0,32)
    Toggle.LayoutOrder = layoutCounters[parent]
    Toggle.Parent = parent

    layoutCounters[parent] = layoutCounters[parent] + 1

    local Box = Instance.new("Frame")
    Box.Name = "Box"
    Box.Size = UDim2.new(0.059, 0, 0.625, 0)
    Box.Position = UDim2.new(0.018,0,0.188,0)
    Box.BackgroundColor3 = Color3.fromRGB(50,50,50)
    Box.Parent = Toggle

    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0,4)
    UICorner.Parent = Box

    if text then
        local TextLabel4 = Instance.new("TextLabel")
        TextLabel4.Size = UDim2.new(0.309,0,1,0)
        TextLabel4.Position = UDim2.new(0.1,0,0,0)
        TextLabel4.BackgroundTransparency = 1
        TextLabel4.TextColor3 = Color3.fromRGB(255,255,255)
        TextLabel4.TextScaled = true
        TextLabel4.Text = text
        TextLabel4.Parent = Toggle
    end

    local toggled = false
    Toggle.MouseButton1Click:Connect(function()
        toggled = not toggled
        if toggled then
            Box.BackgroundColor3 = Color3.fromRGB(0,200,0)
        else
            Box.BackgroundColor3 = Color3.fromRGB(50,50,50)
        end
        if callback then callback(toggled) end
    end)

    return Toggle
end

local LunoxLib = {}
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local layoutCounters = {}

local function MakeWindow(config)
    config = config or {}
    local gameName = config.GameName or "Lunox Hub"
    local logo = config.Logo or "rbxassetid://107861639174297"

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "Lunox"
    ScreenGui.Parent = game.CoreGui
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    local Frame = Instance.new("Frame")
    Frame.Name = "Window"
    Frame.Parent = ScreenGui
    Frame.Position = UDim2.new(0.5,0,0.5,0)
    Frame.Size = UDim2.new(0.35,0,0.45,0)
    Frame.AnchorPoint = Vector2.new(0.5,0.5)
    Frame.BackgroundColor3 = Color3.new(0,0,0)
    Frame.BackgroundTransparency = 0.1
    Frame.BorderSizePixel = 0

    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0,6)
    UICorner.Parent = Frame

    local UIStroke = Instance.new("UIStroke")
    UIStroke.Color = Color3.new(1,1,1)
    UIStroke.Thickness = 2.4
    UIStroke.Parent = Frame

    local TopBar = Instance.new("Frame")
    TopBar.Name = "TopBar"
    TopBar.Parent = Frame
    TopBar.Size = UDim2.new(1,0,0.09375,0)
    TopBar.BackgroundTransparency = 1
    TopBar.BorderSizePixel = 0

    local Title = Instance.new("TextLabel")
    Title.Name = "Title"
    Title.Parent = TopBar
    Title.Position = UDim2.new(0,0,0.22222,0)
    Title.Size = UDim2.new(0.252,0,0.44444,0)
    Title.BackgroundTransparency = 1
    Title.Font = Enum.Font.SourceSansBold
    Title.Text = gameName
    Title.TextColor3 = Color3.new(1,1,1)
    Title.TextScaled = true
    Title.TextWrap = true
    local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
    UITextSizeConstraint.Parent = Title
    UITextSizeConstraint.MaxTextSize = 20

    local Logo = Instance.new("ImageLabel")
    Logo.Name = "Logo"
    Logo.Parent = TopBar
    Logo.Position = UDim2.new(0.02646,0,0.22222,0)
    Logo.Size = UDim2.new(0.024,0,0.44444,0)
    Logo.BackgroundTransparency = 1
    Logo.Image = logo

    local CloseButton = Instance.new("TextButton")
    CloseButton.Name = "Close"
    CloseButton.Parent = TopBar
    CloseButton.Position = UDim2.new(0.97333,0,0.43333,0)
    CloseButton.Size = UDim2.new(0.03333,0,0.55555,0)
    CloseButton.AnchorPoint = Vector2.new(0.5,0.5)
    CloseButton.BackgroundColor3 = Color3.new(0,0,0)
    CloseButton.BorderSizePixel = 0
    CloseButton.Font = Enum.Font.SourceSansBold
    CloseButton.Text = "x"
    CloseButton.TextColor3 = Color3.new(1,1,1)
    CloseButton.TextScaled = true
    CloseButton.TextWrap = true
    local CloseConstraint = Instance.new("UITextSizeConstraint")
    CloseConstraint.Parent = CloseButton
    CloseConstraint.MaxTextSize = 25
    CloseButton.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)

    local MiniButton = Instance.new("TextButton")
    MiniButton.Name = "Mini"
    MiniButton.Parent = TopBar
    MiniButton.Position = UDim2.new(0.92533,0,0.43333,0)
    MiniButton.Size = UDim2.new(0.03333,0,0.55555,0)
    MiniButton.AnchorPoint = Vector2.new(0.5,0.5)
    MiniButton.BackgroundColor3 = Color3.new(0,0,0)
    MiniButton.BorderSizePixel = 0
    MiniButton.Font = Enum.Font.SourceSansBold
    MiniButton.Text = "-"
    MiniButton.TextColor3 = Color3.new(1,1,1)
    MiniButton.TextScaled = true
    MiniButton.TextWrap = true
    local MiniConstraint = Instance.new("UITextSizeConstraint")
    MiniConstraint.Parent = MiniButton
    MiniConstraint.MaxTextSize = 25
    MiniButton.MouseButton1Click:Connect(function()
        Frame.Visible = not Frame.Visible
    end)

    local TabPanel = Instance.new("Frame")
    TabPanel.Name = "Tabs"
    TabPanel.Parent = Frame
    TabPanel.Position = UDim2.new(0,0,0.08228,0)
    TabPanel.Size = UDim2.new(0.25115,0,0.91771,0)
    TabPanel.BackgroundTransparency = 1
    local TabLayout = Instance.new("UIListLayout")
    TabLayout.Parent = TabPanel
    TabLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    TabLayout.SortOrder = Enum.SortOrder.LayoutOrder
    TabLayout.Padding = UDim.new(0,5)

    local ContentFrame = Instance.new("Frame")
    ContentFrame.Name = "ContentFrame"
    ContentFrame.Parent = Frame
    ContentFrame.Position = UDim2.new(0.62701,0,0.54011,0)
    ContentFrame.Size = UDim2.new(0.74,0,0.906,0)
    ContentFrame.AnchorPoint = Vector2.new(0.5,0.5)
    ContentFrame.BackgroundTransparency = 1

    return {
        ScreenGui = ScreenGui,
        WindowFrame = Frame,
        TopBar = TopBar,
        TitleLabel = Title,
        CloseButton = CloseButton,
        MiniButton = MiniButton,
        TabsFrame = TabPanel,
        ContentFrame = ContentFrame
    }
end

local function AddTab(window, name, isFirst)
    local TabButton = Instance.new("TextButton")
    TabButton.BackgroundTransparency = 1
    TabButton.Size = UDim2.new(1,0,0,30)
    TabButton.Text = ""
    TabButton.Parent = window.TabsFrame

    local TabTitle = Instance.new("TextLabel")
    TabTitle.Text = name
    TabTitle.Size = UDim2.new(0.354,0,0.667,0)
    TabTitle.Position = UDim2.new(0.043,0,0.2,0)
    TabTitle.BackgroundTransparency = 1
    TabTitle.TextScaled = true
    TabTitle.TextColor3 = Color3.fromRGB(255,255,255)
    TabTitle.Parent = TabButton

    local UITextSizeConstraint93 = Instance.new("UITextSizeConstraint")
    UITextSizeConstraint93.MaxTextSize = 16
    UITextSizeConstraint93.MinTextSize = 1
    UITextSizeConstraint93.Parent = TabTitle

    local Container = Instance.new("ScrollingFrame")
    Container.Size = UDim2.new(1,0,1,0)
    Container.Position = UDim2.new(0,0,0,0)
    Container.BackgroundTransparency = 1
    Container.Visible = false
    Container.Parent = window.ContentFrame

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

local function AddToggle(parent, text, callback)
    layoutCounters[parent] = layoutCounters[parent] or 1

    local Toggle = Instance.new("TextButton")
    Toggle.Name = "ToggleButton"
    Toggle.BackgroundColor3 = Color3.fromRGB(89, 89, 89)
    Toggle.BackgroundTransparency = 0.7
    Toggle.Size = UDim2.new(1,0,0,32)
    Toggle.LayoutOrder = layoutCounters[parent]
    Toggle.Parent = parent

    layoutCounters[parent] = layoutCounters[parent] + 1

    local Box = Instance.new("Frame")
    Box.Name = "Box"
    Box.Size = UDim2.new(0.046,0,0.719,0)
    Box.AnchorPoint = Vector2.new(0, 0.5)
    Box.Position = UDim2.new(0.036, 0, 0.5, 0)
    Box.BackgroundColor3 = Color3.fromRGB(50,50,50)
    Box.Parent = Toggle

    local UIAspectRatioConstraint22 = Instance.new("UIAspectRatioConstraint")
    UIAspectRatioConstraint22.AspectRatio = 0.992
    UIAspectRatioConstraint22.AspectType = Enum.AspectType.FitWithinMaxSize
    UIAspectRatioConstraint22.DominantAxis = Enum.DominantAxis.Width
    UIAspectRatioConstraint22.Parent = Box

    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0,4)
    UICorner.Parent = Box

    if text then
        local TextLabel = Instance.new("TextLabel")
        TextLabel.Size = UDim2.new(0.309,0,0.682,0)
        TextLabel.Position = UDim2.new(0.114,0,0.156,0)
        TextLabel.BackgroundTransparency = 1
        TextLabel.TextColor3 = Color3.fromRGB(255,255,255)
        TextLabel.TextScaled = true
        TextLabel.Text = text
        TextLabel.Parent = Toggle

        local UITextSizeConstraint23 = Instance.new("UITextSizeConstraint")
        UITextSizeConstraint23.MaxTextSize = 14
        UITextSizeConstraint23.MinTextSize = 1
        UITextSizeConstraint23.Parentt = TextLabel
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

LunoxLib.MakeWindow = MakeWindow
LunoxLib.AddTab = AddTab
LunoxLib.AddToggle = AddToggle

return LunoxLib

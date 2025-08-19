local LunoxLib = {}
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local layoutCounters = {}

if game.CoreGui:FindFirstChild("Lunox") then
    game.CoreGui.Lunox:Destroy()
end

local function MakeWindow(config)
    config = config or {}
    local gameName = config.GameName or "Unknown Name"
    local logo = config.Logo or "rbxassetid://107861639174297"
    local version = config.Version or "v0.0.1"

    if game.CoreGui:FindFirstChild("Lunox") then
        game.CoreGui.Lunox:Destroy()
    end

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "Lunox"
    ScreenGui.Parent = game.CoreGui
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.ResetOnSpawn = false

    local Frame = Instance.new("Frame")
    Frame.Name = "Window"
    Frame.Parent = ScreenGui
    Frame.Position = UDim2.new(0.5,0,0.5,0)
    Frame.Size = UDim2.new(0.35,0,0.45,0)
    Frame.AnchorPoint = Vector2.new(0.5,0.5)
    Frame.BackgroundColor3 = Color3.new(0,0,0)
    Frame.BackgroundTransparency = 0.1
    Frame.BorderSizePixel = 0
    Frame.Active = true
    Frame.Draggable = true

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
    TopBar.Size = UDim2.new(1,0,0.094,0)
    TopBar.BackgroundTransparency = 1
    TopBar.BorderSizePixel = 0

    local Title = Instance.new("TextLabel")
    Title.Name = "Title"
    Title.Parent = TopBar
    Title.Position = UDim2.new(0,0,0.222,0)
    Title.Size = UDim2.new(0.252,0,0.444,0)
    Title.BackgroundTransparency = 1
    Title.Font = Enum.Font.SourceSansBold
    Title.Text = "Lunox Hub"
    Title.TextColor3 = Color3.new(1,1,1)
    Title.TextScaled = true
    Title.TextWrapped = true
    local TitleConstraint = Instance.new("UITextSizeConstraint")
    TitleConstraint.MaxTextSize = 20
    TitleConstraint.MinTextSize = 1
    TitleConstraint.Parent = Title

    local NewText = Instance.new("TextLabel")
    NewText.Name = "NewText"
    NewText.Parent = TopBar
    NewText.Position = UDim2.new(0.145,0,0.199,0)
    NewText.Size = UDim2.new(0.106,0,0.44444,0)
    NewText.BackgroundTransparency = 1
    NewText.Font = Enum.Font.SourceSansBold
    NewText.Text = "|"
    NewText.TextColor3 = Color3.new(1,1,1)
    NewText.TextScaled = true
    NewText.TextWrapped = true
    local NewTextConstraint = Instance.new("UITextSizeConstraint")
    NewTextConstraint.MaxTextSize = 20
    NewTextConstraint.MinTextSize = 1
    NewTextConstraint.Parent = NewText

    local NewText2 = Instance.new("TextLabel")
    NewText2.Name = "NewText2"
    NewText2.Parent = TopBar
    NewText2.Position = UDim2.new(0.169,0,0.222,0)
    NewText2.Size = UDim2.new(0.252,0,0.444,0)
    NewText2.BackgroundTransparency = 1
    NewText2.Font = Enum.Font.SourceSansBold
    NewText2.Text = gameName
    NewText2.TextColor3 = Color3.new(1,1,1)
    NewText2.TextScaled = true
    NewText2.TextWrapped = true
    local NewText2Constraint = Instance.new("UITextSizeConstraint")
    NewText2Constraint.MaxTextSize = 20
    NewText2Constraint.MinTextSize = 1
    NewText2Constraint.Parent = NewText2

    local VersionText = Instance.new("TextLabel")
    VersionText.Name = "VersionText"
    VersionText.Parent = TopBar
    VersionText.Position = UDim2.new(0.358,0,0.222,0)
    VersionText.Size = UDim2.new(0.195,0,0.444,0)
    VersionText.BackgroundTransparency = 1
    VersionText.Font = Enum.Font.SourceSansBold
    VersionText.Text = version
    VersionText.TextColor3 = Color3.new(1,1,1)
    VersionText.TextScaled = true
    VersionText.TextWrapped = true
    local VersionConstraint = Instance.new("UITextSizeConstraint")
    VersionConstraint.MaxTextSize = 20
    VersionConstraint.MinTextSize = 1
    VersionConstraint.Parent = VersionText

    local Logo = Instance.new("ImageLabel")
    Logo.Name = "Logo"
    Logo.Parent = TopBar
    Logo.Position = UDim2.new(0.026,0,0.222,0)
    Logo.Size = UDim2.new(0.024,0,0.444,0)
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
    CloseButton.TextWrapped = true
    local CloseConstraint = Instance.new("UITextSizeConstraint")
    CloseConstraint.MaxTextSize = 25
    CloseConstraint.MinTextSize = 1
    CloseConstraint.Parent = CloseButton
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
    MiniButton.TextWrapped = true
    local MiniConstraint = Instance.new("UITextSizeConstraint")
    MiniConstraint.MaxTextSize = 25
    MiniConstraint.MinTextSize = 1
    MiniConstraint.Parent = MiniButton
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
    TabTitle.Size = UDim2.new(0.6,0,0.667,0)
    TabTitle.Position = UDim2.new(0.043,0,0.2,0)
    TabTitle.BackgroundTransparency = 1
    TabTitle.TextScaled = true
    TabTitle.TextXAlignment = Enum.TextXAlignment.Left
    TabTitle.TextColor3 = Color3.fromRGB(255,255,255)
    TabTitle.Parent = TabButton

    local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
    UITextSizeConstraint.MaxTextSize = 12
    UITextSizeConstraint.MinTextSize = 12
    UITextSizeConstraint.Parent = TabTitle

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

    local function showTab()
        for _, child in ipairs(window.ContentFrame:GetChildren()) do
            if child:IsA("ScrollingFrame") then
                child.Visible = false
            end
        end
        Container.Visible = true

        for _, btn in ipairs(window.TabsFrame:GetChildren()) do
            if btn:IsA("TextButton") then
                local lbl = btn:FindFirstChild("TextLabel")
                if lbl then
                    lbl.TextTransparency = 0.4
                end
            end
        end
        TabTitle.TextTransparency = 0
    end

    TabButton.MouseButton1Click:Connect(showTab)

    if isFirst then
        showTab()
    end

    return Container
end

local function AddToggle(parent, text, callback)
    local Toggle = Instance.new("TextButton")
    Toggle.Name = "ToggleButton"
    Toggle.BackgroundColor3 = Color3.fromRGB(89, 89, 89)
    Toggle.BackgroundTransparency = 0.7
    Toggle.Size = UDim2.new(1,0,0,32)
    Toggle.LayoutOrder = layoutCounters[parent] or 0
    Toggle.AutoButtonColor = false
    Toggle.Parent = parent

    local Box = Instance.new("Frame")
    Box.Name = "Box"
    Box.Size = UDim2.new(0.046,0,0.72,0)
    Box.Position = UDim2.new(0.05, 0, 0.5, 0)
    Box.AnchorPoint = Vector2.new(0.5,0.5)
    Box.BackgroundColor3 = Color3.fromRGB(16,16,16)
    Box.Parent = Toggle

    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0,4)
    UICorner.Parent = Box

    if text then
        local TextLabel = Instance.new("TextLabel")
        TextLabel.Size = UDim2.new(0.8,0,1,0)
        TextLabel.Position = UDim2.new(0.12,0,0,0)
        TextLabel.BackgroundTransparency = 1
        TextLabel.TextColor3 = Color3.fromRGB(255,255,255)
        TextLabel.TextScaled = true
        TextLabel.Text = text
        TextLabel.TextXAlignment = Enum.TextXAlignment.Left
        TextLabel.Parent = Toggle

        local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
        UITextSizeConstraint.MaxTextSize = 14
        UITextSizeConstraint.MinTextSize = 10
        UITextSizeConstraint.Parent = TextLabel
    end

    local toggled = false
    Toggle.MouseButton1Click:Connect(function()
        toggled = not toggled
        Box.BackgroundColor3 = toggled and Color3.fromRGB(138,138,138) or Color3.fromRGB(16,16,16)
        if callback then callback(toggled) end
    end)

    return Toggle
end

local function AddButton(parent, text, callback)
    local Button = Instance.new("TextButton")
    Button.Name = "Button"
    Button.BackgroundColor3 = Color3.fromRGB(89, 89, 89)
    Button.BackgroundTransparency = 0.7
    Button.Size = UDim2.new(1,0,0,32)
    Button.Parent = parent

    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0,4)
    UICorner.Parent = Button

    if text then
        local TextLabel = Instance.new("TextLabel")
        TextLabel.Size = UDim2.new(1,0,1,0)
        TextLabel.Position = UDim2.new(0,0,0,0)
        TextLabel.BackgroundTransparency = 1
        TextLabel.TextColor3 = Color3.fromRGB(255,255,255)
        TextLabel.TextScaled = true
        TextLabel.Text = text
        TextLabel.Parent = Button

        local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
        UITextSizeConstraint.MaxTextSize = 14
        UITextSizeConstraint.MinTextSize = 1
        UITextSizeConstraint.Parent = TextLabel
    end

    Button.MouseButton1Click:Connect(function()
        if callback then callback() end
    end)

    return Button
end

local function AddDropdown(parent, text, options, callback)
    local Theme = {
        Background = Color3.fromRGB(60, 60, 60),
        BoxOff = Color3.fromRGB(16,16,16),
        Text = Color3.fromRGB(255,255,255),
        Accent = Color3.fromRGB(89,89,89),
    }

    local Dropdown = Instance.new("TextButton")
    Dropdown.Name = text
    Dropdown.Size = UDim2.new(1,0,0,32)
    Dropdown.BackgroundColor3 = Theme.Background
    Dropdown.TextColor3 = Theme.Text
    Dropdown.Font = Enum.Font.Gotham
    Dropdown.TextSize = 14
    Dropdown.Text = text
    Dropdown.AutoButtonColor = false
    Dropdown.ClipsDescendants = false
    Dropdown.Parent = parent
    Instance.new("UICorner", Dropdown).CornerRadius = UDim.new(0,6)

    local rootGui = Dropdown:FindFirstAncestorOfClass("ScreenGui") or game:GetService("CoreGui"):FindFirstChild("Lunox")
    if not rootGui then
        local pg = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
        rootGui = pg:FindFirstChildOfClass("ScreenGui") or pg
    end

    local Scroll = Instance.new("ScrollingFrame")
    Scroll.Size = UDim2.new(0,0,0,0)
    Scroll.CanvasSize = UDim2.new(0,0,0,0)
    Scroll.ScrollBarThickness = 6
    Scroll.BackgroundColor3 = Theme.BoxOff
    Scroll.BackgroundTransparency = 0.2
    Scroll.Visible = false
    Scroll.ZIndex = 100
    Scroll.ClipsDescendants = true
    Scroll.Parent = rootGui
    Instance.new("UICorner", Scroll).CornerRadius = UDim.new(0,6)

    local Layout = Instance.new("UIListLayout")
    Layout.SortOrder = Enum.SortOrder.LayoutOrder
    Layout.Padding = UDim.new(0,3)
    Layout.Parent = Scroll

    local Open = false
    local selectedOptions, optionButtons = {}, {}

    local function getOptions()
        return (type(options) == "function") and options() or options
    end

    local function updatePopupPosition()
        local ap, as = Dropdown.AbsolutePosition, Dropdown.AbsoluteSize
        local h = math.min(Layout.AbsoluteContentSize.Y + 8, 150)
        Scroll.Position = UDim2.fromOffset(ap.X, ap.Y + as.Y + 2)
        Scroll.Size = UDim2.fromOffset(as.X, Open and h or 0)
    end

    Layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        Scroll.CanvasSize = UDim2.new(0,0,0,Layout.AbsoluteContentSize.Y + 6)
        if Open then updatePopupPosition() end
    end)

    Dropdown:GetPropertyChangedSignal("AbsolutePosition"):Connect(function()
        if Open then updatePopupPosition() end
    end)
    Dropdown:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
        if Open then updatePopupPosition() end
    end)

    local function RefreshOptions()
        local current = getOptions()

        for opt, btn in pairs(optionButtons) do
            if not table.find(current, opt) then
                btn:Destroy()
                optionButtons[opt] = nil
            end
        end

        for _, opt in ipairs(current) do
            if optionButtons[opt] then continue end

            local btn = Instance.new("TextButton")
            btn.Size = UDim2.new(1,0,0,28)
            btn.BackgroundColor3 = Theme.Background
            btn.TextColor3 = Theme.Text
            btn.Font = Enum.Font.Gotham
            btn.TextSize = 14
            btn.Text = opt
            btn.AutoButtonColor = true
            btn.ZIndex = 101
            btn.Parent = Scroll
            Instance.new("UICorner", btn).CornerRadius = UDim.new(0,5)

            local highlight = Instance.new("Frame")
            highlight.Size = UDim2.new(0.03,0,1,0)
            highlight.BackgroundColor3 = Theme.Accent
            highlight.Visible = table.find(selectedOptions,opt) ~= nil
            highlight.ZIndex = 102
            highlight.Parent = btn

            btn.MouseButton1Click:Connect(function()
                local on = not highlight.Visible
                highlight.Visible = on
                if on then
                    if not table.find(selectedOptions,opt) then
                        table.insert(selectedOptions,opt)
                    end
                else
                    for i,v in ipairs(selectedOptions) do
                        if v == opt then table.remove(selectedOptions,i) break end
                    end
                end
                if callback then callback(opt, on) end
            end)

            optionButtons[opt] = btn
        end
    end

    Dropdown.MouseButton1Click:Connect(function()
        Open = not Open
        if Open then
            RefreshOptions()
            Scroll.Visible = true
            updatePopupPosition()
        else
            Scroll.Visible = false
            Scroll.Size = UDim2.fromOffset(0,0)
        end
    end)

    Dropdown.AncestryChanged:Connect(function()
        if not Dropdown:IsDescendantOf(game) then
            if Scroll then Scroll:Destroy() end
        end
    end)

    return {
        Refresh = RefreshOptions,
        GetSelected = function() return selectedOptions end
    }
end

local function AddSlider(parent, text, min, max, default, callback)
    local SliderFrame = Instance.new("Frame")
    SliderFrame.Size = UDim2.new(1,0,0,40)
    SliderFrame.BackgroundTransparency = 1
    SliderFrame.Parent = parent

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(0.6,0,0.5,0)
    Label.Position = UDim2.new(0,0,0,0)
    Label.BackgroundTransparency = 1
    Label.Text = text .. ": " .. tostring(default)
    Label.TextColor3 = Color3.fromRGB(255,255,255)
    Label.TextScaled = true
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = SliderFrame

    local SliderBar = Instance.new("Frame")
    SliderBar.Size = UDim2.new(1,0,0,8)
    SliderBar.Position = UDim2.new(0,0,0.7,0)
    SliderBar.BackgroundColor3 = Color3.fromRGB(89, 89, 89)
    SliderBar.Parent = SliderFrame
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0,4)
    UICorner.Parent = SliderBar

    local Fill = Instance.new("Frame")
    Fill.Size = UDim2.new((default-min)/(max-min),0,1,0)
    Fill.BackgroundColor3 = Color3.fromRGB(0,200,0)
    Fill.Parent = SliderBar
    local FillCorner = Instance.new("UICorner")
    FillCorner.CornerRadius = UDim.new(0,4)
    FillCorner.Parent = Fill

    local dragging = false
    local finalValue = default

    local function update(pos)
        local relative = math.clamp((pos.X - SliderBar.AbsolutePosition.X) / SliderBar.AbsoluteSize.X, 0, 1)
        Fill.Size = UDim2.new(relative,0,1,0)
        finalValue = math.floor(min + (max-min)*relative)
        Label.Text = text .. ": " .. finalValue
    end

    SliderBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        input:Capture()
    end
end)

    SliderBar.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            update(input.Position)
        end
    end)

    SliderBar.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 and dragging then
            dragging = false
            if callback then callback(finalValue) end
        end
    end)

    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            update(input.Position)
        end
    end)

    return SliderFrame
end

local function AddSection(parent, title)
    local SectionFrame = Instance.new("Frame")
    SectionFrame.Size = UDim2.new(1, 0, 0, 30)
    SectionFrame.BackgroundTransparency = 1
    SectionFrame.Parent = parent

    local Header = Instance.new("TextButton")
    Header.Size = UDim2.new(1, 0, 0, 30)
    Header.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    Header.TextColor3 = Color3.fromRGB(255, 255, 255)
    Header.Font = Enum.Font.GothamBold
    Header.TextSize = 14
    Header.Text = title .. " ▼" -- collapsed initially
    Header.Parent = SectionFrame

    local Content = Instance.new("Frame")
    Content.Size = UDim2.new(1, 0, 0, 0)
    Content.BackgroundTransparency = 1
    Content.ClipsDescendants = true
    Content.Parent = SectionFrame

    local UIListLayout = Instance.new("UIListLayout")
    UIListLayout.Parent = Content
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0, 4)

    local expanded = false -- start collapsed

    local function UpdateSectionHeight()
        local contentHeight = UIListLayout.AbsoluteContentSize.Y
        local totalHeight = 30 + (expanded and contentHeight or 0)
        SectionFrame:TweenSize(
            UDim2.new(1, 0, 0, totalHeight),
            Enum.EasingDirection.Out,
            Enum.EasingStyle.Quad,
            0.25,
            true
        )
    end

    UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(UpdateSectionHeight)

    Content.ChildAdded:Connect(function()
        task.wait(0.05)
        -- set child visibility according to expanded state
        for _, child in ipairs(Content:GetChildren()) do
            if child:IsA("GuiObject") then
                child.Visible = expanded
            end
        end
        UpdateSectionHeight()
    end)

    Header.MouseButton1Click:Connect(function()
        expanded = not expanded
        Header.Text = expanded and (title .. " ▲") or (title .. " ▼")
        for _, child in ipairs(Content:GetChildren()) do
            if child:IsA("GuiObject") then
                child.Visible = expanded
            end
        end
        UpdateSectionHeight()
    end)

    -- make sure initial children are hidden
    for _, child in ipairs(Content:GetChildren()) do
        if child:IsA("GuiObject") then
            child.Visible = false
        end
    end

    return Content
end

local function Notification(title, description, duration)
    duration = duration or 3

    local ScreenGui = game.CoreGui:FindFirstChild("Lunox")

    local notif = Instance.new("Frame")
    notif.Size = UDim2.new(0, 250, 0, 60)
    notif.Position = UDim2.new(1, 10, 1, -70)
    notif.AnchorPoint = Vector2.new(0, 0)
    notif.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    notif.BorderSizePixel = 0
    notif.Parent = ScreenGui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = notif

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, -10, 0, 25)
    titleLabel.Position = UDim2.new(0, 5, 0, 5)
    titleLabel.BackgroundTransparency = 1
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.Font = Enum.Font.SourceSansBold
    titleLabel.TextSize = 16
    titleLabel.Text = title
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = notif

    local descLabel = Instance.new("TextLabel")
    descLabel.Size = UDim2.new(1, -10, 0, 25)
    descLabel.Position = UDim2.new(0, 5, 0, 30)
    descLabel.BackgroundTransparency = 1
    descLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    descLabel.Font = Enum.Font.SourceSans
    descLabel.TextSize = 14
    descLabel.Text = description
    descLabel.TextXAlignment = Enum.TextXAlignment.Left
    descLabel.TextWrapped = true
    descLabel.Parent = notif

    local tweenService = game:GetService("TweenService")
    local tweenIn = tweenService:Create(notif, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(1, -260, 1, -70)})
    tweenIn:Play()

    task.delay(duration, function()
        local tweenOut = tweenService:Create(notif, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Position = UDim2.new(1, 10, 1, -70)})
        tweenOut:Play()
        tweenOut.Completed:Connect(function()
            notif:Destroy()
        end)
    end)
end

local function AddLabel(parent, text)
    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, 0, 0, 28)
    Label.BackgroundTransparency = 1
    Label.TextColor3 = Color3.fromRGB(255, 255, 255)
    Label.TextScaled = true
    Label.Text = text
    Label.Font = Enum.Font.Gotham
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = parent
    return Label
end

LunoxLib.MakeWindow = MakeWindow
LunoxLib.AddTab = AddTab
LunoxLib.AddToggle = AddToggle
LunoxLib.AddButton = AddButton
LunoxLib.AddDropdown = AddDropdown
LunoxLib.AddSlider = AddSlider
LunoxLib.Notification = Notification
LunoxLib.AddLabel = AddLabel
LunoxLib.AddSection = AddSection

return LunoxLib

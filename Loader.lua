---OPEN SOURCED CUZ AHH
if game.PlaceId ~= 107778070777162 then
    return
end

function loadingscreen()
    local TweenService = game:GetService("TweenService")
    local Players = game:GetService("Players")

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "VignetteGui"
    ScreenGui.IgnoreGuiInset = true
    ScreenGui.ResetOnSpawn = false
    ScreenGui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")

    local SnowFolder = Instance.new("Folder")
    SnowFolder.Name = "Snowflakes"
    SnowFolder.Parent = ScreenGui

    local Snowflakes = {}

    local function createSnowflake()
        local Snow = Instance.new("Frame")
        local size = math.random(3, 7)

        Snow.Size = UDim2.fromOffset(size, size)
        Snow.Position = UDim2.fromScale(math.random(), -0.03)
        Snow.AnchorPoint = Vector2.new(0.5, 0.5)
        Snow.BackgroundColor3 = Color3.new(1, 1, 1)
        Snow.BackgroundTransparency = 0.6
        Snow.BorderSizePixel = 0
        Snow.ZIndex = 1002
        Snow.Parent = SnowFolder

        local Corner = Instance.new("UICorner")
        Corner.CornerRadius = UDim.new(1, 0)
        Corner.Parent = Snow

        table.insert(Snowflakes, Snow)

        local duration = math.random(30, 50) / 10
        local drift = math.random(-100, 100) / 1000

        local tween = TweenService:Create(
            Snow,
            TweenInfo.new(duration, Enum.EasingStyle.Linear),
            {
                Position = UDim2.fromScale(
                    Snow.Position.X.Scale + drift,
                    1.08
                )
            }
        )

        tween.Completed:Connect(function()
            for i, v in ipairs(Snowflakes) do
                if v == Snow then
                    table.remove(Snowflakes, i)
                    break
                end
            end
            Snow:Destroy()
        end)

        tween:Play()
    end

    for i = 1, 45 do
        task.delay(math.random() * 4, createSnowflake)
    end

    task.spawn(function()
        while ScreenGui.Parent do
            createSnowflake()
            task.wait(0.08)
        end
    end)

    local Dark = Instance.new("Frame")
    Dark.Size = UDim2.fromScale(1, 1)
    Dark.BackgroundColor3 = Color3.new(0, 0, 0)
    Dark.BackgroundTransparency = 1
    Dark.BorderSizePixel = 0
    Dark.ZIndex = 998
    Dark.Parent = ScreenGui

    local Vignette = Instance.new("ImageLabel")
    Vignette.BackgroundTransparency = 1
    Vignette.Image = "rbxassetid://11202863894"
    Vignette.AnchorPoint = Vector2.new(0.5, 0.5)
    Vignette.Position = UDim2.fromScale(0.5, 0.5)
    Vignette.Size = UDim2.fromScale(3, 3)
    Vignette.ZIndex = 999
    Vignette.ScaleType = Enum.ScaleType.Stretch
    Vignette.Parent = ScreenGui

    local Gradient = Instance.new("UIGradient")
    Gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(170, 70, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(40, 110, 255))
    })
    Gradient.Parent = Vignette

    local TextHolder = Instance.new("Frame")
    TextHolder.BackgroundTransparency = 1
    TextHolder.AnchorPoint = Vector2.new(0.5, 0.5)
    TextHolder.Position = UDim2.fromScale(0.5, 0.5)
    TextHolder.Size = UDim2.fromScale(0.65, 0.25)
    TextHolder.ZIndex = 1000
    TextHolder.Parent = ScreenGui

    local Text = "monarch.win"
    local Letters = {}
    local TextGradients = {}
    local count = #Text
    local letterWidth = 0.075
    local gap = 0.002
    local totalWidth = count * letterWidth + (count - 1) * gap
    local startX = 0.5 - totalWidth / 2

    for i = 1, count do
        local Letter = Instance.new("TextLabel")
        Letter.BackgroundTransparency = 1
        Letter.Text = Text:sub(i, i)
        Letter.TextColor3 = Color3.new(1, 1, 1)
        Letter.TextTransparency = 0
        Letter.TextStrokeTransparency = 0.5
        Letter.TextScaled = true
        Letter.Font = Enum.Font.GothamBold
        Letter.AnchorPoint = Vector2.new(0.5, 0.5)
        Letter.Size = UDim2.fromScale(letterWidth, 0.55)
        Letter.Position = UDim2.fromScale(
            startX + letterWidth / 2 + (i - 1) * (letterWidth + gap),
            0.5
        )
        Letter.ZIndex = 1000
        Letter.Parent = TextHolder

        local TextGradient = Instance.new("UIGradient")
        TextGradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 130, 255)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(100, 80, 255)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(190, 60, 255))
        })
        TextGradient.Parent = Letter

        table.insert(Letters, Letter)
        table.insert(TextGradients, TextGradient)
    end

    local Subtitle = Instance.new("TextLabel")
    Subtitle.BackgroundTransparency = 1
    Subtitle.Text = "Created by Nobu"
    Subtitle.TextColor3 = Color3.new(1, 1, 1)
    Subtitle.TextTransparency = 0
    Subtitle.TextStrokeTransparency = 0.7
    Subtitle.TextScaled = true
    Subtitle.Font = Enum.Font.Gotham
    Subtitle.AnchorPoint = Vector2.new(0.5, 0)
    Subtitle.Position = UDim2.fromScale(0.5, 0.56)
    Subtitle.Size = UDim2.fromScale(0.4, 0.07)
    Subtitle.ZIndex = 1001
    Subtitle.Parent = ScreenGui

    TweenService:Create(
        Dark,
        TweenInfo.new(1.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
        {BackgroundTransparency = 0.4}
    ):Play()

    TweenService:Create(
        Vignette,
        TweenInfo.new(1.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
        {Size = UDim2.fromScale(1.15, 1.15)}
    ):Play()

    TweenService:Create(
        Gradient,
        TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1),
        {Rotation = 360}
    ):Play()

    for i, Letter in ipairs(Letters) do
        local targetX = startX + letterWidth / 2 + (i - 1) * (letterWidth + gap)
        local startY = i % 2 == 0 and -1.5 or 1.5

        Letter.Position = UDim2.fromScale(targetX, startY)

        task.delay((i - 1) * 0.12, function()
            TweenService:Create(
                Letter,
                TweenInfo.new(0.65, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
                {Position = UDim2.fromScale(targetX, 0.36)}
            ):Play()

            TweenService:Create(
                TextGradients[i],
                TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1),
                {Rotation = 360}
            ):Play()
        end)
    end

    task.wait(0.65 + (count - 1) * 0.12)
    task.wait(2)

    for _, Letter in ipairs(Letters) do
        TweenService:Create(
            Letter,
            TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
            {TextTransparency = 1, TextStrokeTransparency = 1}
        ):Play()
    end

    TweenService:Create(
        Subtitle,
        TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
        {TextTransparency = 1}
    ):Play()

    TweenService:Create(
        Dark,
        TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
        {BackgroundTransparency = 1}
    ):Play()

    local Out = TweenService:Create(
        Vignette,
        TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.In),
        {Size = UDim2.fromScale(3, 3)}
    )

    Out:Play()

    for _, Snow in ipairs(Snowflakes) do
        if Snow and Snow.Parent then
            TweenService:Create(
                Snow,
                TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
                {BackgroundTransparency = 1}
            ):Play()
        end
    end

    Out.Completed:Wait()
    ScreenGui:Destroy()
end

function runLobby()
    game.Players.LocalPlayer:Kick("Monarch.win\\Join main game not lobby.\nAPI Error: Lobby.")
end

function nights()
    loadingscreen()
    task.wait(4)
    SCRIPT_KEY = "KEYLESS";
loadstring(game:HttpGet("https://api.jnkie.com/api/v1/luascripts/public/e0600b9803e7e83945190ad1daa24b565e5e695e89071a6b044f98ab512a39db/download"))()
end

nights()

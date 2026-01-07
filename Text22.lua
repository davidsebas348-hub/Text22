-- LocalScript en StarterPlayerScripts

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

local colorNaranja = Color3.fromRGB(255, 140, 0) -- NARANJA

-- ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SBS_HUB"
screenGui.ResetOnSpawn = false
screenGui.Parent = PlayerGui

-- Frame principal
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 450, 0, 350)
mainFrame.Position = UDim2.new(0.5, -225, 0.5, -175)
mainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
mainFrame.BorderColor3 = colorNaranja
mainFrame.BorderSizePixel = 3
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

-- Título
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 50)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
title.BorderColor3 = colorNaranja
title.BorderSizePixel = 3
title.Text = "MODOS DE AUTO COLLECT COINS"
title.TextColor3 = colorNaranja
title.Font = Enum.Font.GothamBold
title.TextSize = 28
title.Parent = mainFrame

-- Subtítulo (sin borde)
local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(1, -20, 0, 30)
subtitle.Position = UDim2.new(0, 10, 0, 60)
subtitle.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
subtitle.BorderSizePixel = 0
subtitle.Text = "ELIGE EL MODO DE FARM"
subtitle.TextColor3 = colorNaranja
subtitle.Font = Enum.Font.GothamBold
subtitle.TextSize = 20
subtitle.TextXAlignment = Enum.TextXAlignment.Center
subtitle.Parent = mainFrame

-- Botones con línea superior e inferior, subidos 20 px
local buttonNames = {
    "MODO: FLOTANDO (recomendado)",          
    "MODO: TP A LOBBY Y COIN",               
    "MODO: TP CORTO A COIN (RECOMENDADO)",  
    "MODO: TP A COINS",                       
    "MODO: BOT"                               
}

local buttonScripts = {
    "https://raw.githubusercontent.com/davidsebas348-hub/Text17/refs/heads/main/Text17.lua",
    "https://raw.githubusercontent.com/davidsebas348-hub/Text18/refs/heads/main/Text18.lua",
    "https://raw.githubusercontent.com/davidsebas348-hub/Text19/refs/heads/main/Text19.lua",
    "https://raw.githubusercontent.com/davidsebas348-hub/Text20/refs/heads/main/Text20.lua",
    "https://raw.githubusercontent.com/davidsebas348-hub/Text21/refs/heads/main/Text21.lua"
}

local totalBotones = #buttonNames
local frameHeight = 350
local botonesDisponibles = frameHeight - 110
local espacioEntre = 5
local buttonHeight = (botonesDisponibles - (totalBotones-1)*espacioEntre) / totalBotones
local shiftUp = 20 -- mover botones 20 px hacia arriba

for i, name in ipairs(buttonNames) do
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -10, 0, buttonHeight)
    button.Position = UDim2.new(0, 5, 0, 110 - shiftUp + (i-1)*(buttonHeight + espacioEntre))
    button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    button.BorderSizePixel = 0
    button.Text = name
    button.TextColor3 = colorNaranja
    button.Font = Enum.Font.GothamBold
    button.TextSize = 20
    button.Parent = mainFrame

    -- Línea superior
    local topLine = Instance.new("Frame")
    topLine.Size = UDim2.new(1, 0, 0, 3)
    topLine.Position = UDim2.new(0, 0, 0, button.Position.Y.Offset)
    topLine.BackgroundColor3 = colorNaranja
    topLine.BorderSizePixel = 0
    topLine.Parent = mainFrame

    -- Línea inferior
    local bottomLine = Instance.new("Frame")
    bottomLine.Size = UDim2.new(1, 0, 0, 3)
    bottomLine.Position = UDim2.new(0, 0, 0, button.Position.Y.Offset + buttonHeight - 3)
    bottomLine.BackgroundColor3 = colorNaranja
    bottomLine.BorderSizePixel = 0
    bottomLine.Parent = mainFrame

    -- Función de clic: destruye GUI y ejecuta script
    button.MouseButton1Click:Connect(function()
        screenGui:Destroy() -- elimina la GUI
        local url = buttonScripts[i]
        loadstring(game:HttpGet(url, true))() -- ejecuta script elegido
    end)
end

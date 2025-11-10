-- Delta Hub Script: TP seguro con feedback visual y emojis

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")

-- Crear GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "TPGui"
screenGui.Parent = game.CoreGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 180, 0, 120)
frame.Position = UDim2.new(0.5, -90, 0.5, -60)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.Parent = screenGui
frame.Active = true
frame.Draggable = true

-- Botón Guardar Posición 💾
local saveButton = Instance.new("TextButton")
saveButton.Size = UDim2.new(1, -20, 0, 50)
saveButton.Position = UDim2.new(0, 10, 0, 10)
saveButton.Text = "💾 Guardar Pos"
saveButton.Font = Enum.Font.SourceSansBold
saveButton.TextSize = 20
saveButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
saveButton.TextColor3 = Color3.new(1,1,1)
saveButton.Parent = frame
saveButton.AutoButtonColor = true

-- Botón Teleport ✈️
local tpButton = Instance.new("TextButton")
tpButton.Size = UDim2.new(1, -20, 0, 50)
tpButton.Position = UDim2.new(0, 10, 0, 60)
tpButton.Text = "✈️ Teleport"
tpButton.Font = Enum.Font.SourceSansBold
tpButton.TextSize = 20
tpButton.BackgroundColor3 = Color3.fromRGB(0, 255, 128)
tpButton.TextColor3 = Color3.new(1,1,1)
tpButton.Parent = frame
tpButton.AutoButtonColor = true

-- Variable para guardar posición
local savedPosition = nil

-- Función TP seguro
local function safeTP(position)
    hrp.Anchored = true
    hrp.CFrame = CFrame.new(position)
    wait(0.1)
    hrp.Anchored = false
end

-- Botón Guardar Posición
saveButton.MouseButton1Click:Connect(function()
    savedPosition = hrp.Position
    saveButton.Text = "💾 Posición guardada"
    saveButton.TextColor3 = Color3.fromRGB(0, 255, 0) -- verde
    print("💾 Posición guardada:", savedPosition)
end)

-- Botón Teleport
tpButton.MouseButton1Click:Connect(function()
    if savedPosition then
        safeTP(savedPosition)
        tpButton.Text = "✈️ TP Completed"
        tpButton.TextColor3 = Color3.fromRGB(0, 255, 0) -- verde
        print("✈️ Teletransportado a la posición guardada (seguro)!")
    else
        tpButton.Text = "⚠️ Guarda primero!"
        tpButton.TextColor3 = Color3.fromRGB(255, 0, 0) -- rojo
        print("⚠️ No hay posición guardada.")
    end
end)

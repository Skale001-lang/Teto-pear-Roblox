print("Teto-Pearizer")


-- Para el usuario

local textureId = "rbxassetid://78944177388997"
function applyDecalToCharacter(character)
local faces = {"Front", "Back", "Top", "Bottom", "Left", "Right"}

	for _, part in pairs(character:GetChildren()) do
		if part:IsA("BasePart") then
			for _, face in pairs(faces) do
				local decal = Instance.new("Decal")
				decal.Texture = textureId
				decal.Face = Enum.NormalId[face]
				decal.Parent = part
			end
		end
	end
end

game.Players.PlayerAdded:Connect(function(player)
	player.CharacterAppearanceLoaded:Connect(function(character)
		applyDecalToCharacter(character)
	end)
end)


-- PEAR DECAL ALL
local textureId = "rbxassetid://78944177388997"

function applyDecalToAllFaces(part)
	if part:IsA("BasePart") then
		local faces = {"Front", "Back", "Top", "Bottom", "Left", "Right"}

		for _, face in pairs(faces) do
			local decal = Instance.new("Decal")
			decal.Texture = textureId
			decal.Face = Enum.NormalId[face]
			decal.Parent = part
		end
	end
end

function applyDecalToAllObjects(parent)
	for _, obj in pairs(parent:GetDescendants()) do
		applyDecalToAllFaces(obj)
	end
end

applyDecalToAllObjects(workspace) -- Aplica la textura sin grid a todas las partes del juego


-- Visuales 
game.Players.PlayerAdded:Connect(function(player)
	player.PlayerGui.ChildAdded:Connect(function(guiElement)
		if guiElement:IsA("ScreenGui") then
			-- Recorrer todos los descendientes de ScreenGui
			for _, element in pairs(guiElement:GetDescendants()) do
				if element:IsA("ImageButton") or element:IsA("ImageLabel") then
					-- Cambiar la imagen
					element.Image = "rbxassetid://78944177388997"  -- ID de la imagen
				elseif element:IsA("TextLabel") or element:IsA("TextButton") then
					-- Cambiar el texto o la imagen de fondo de los botones de texto
					element.BackgroundColor3 = Color3.fromRGB(200, 200, 255)  -- Cambiar el color de fondo si es TextButton o TextLabel
				elseif element:IsA("Frame") then
					-- Cambiar la imagen de fondo de los Frames
					element.BackgroundTransparency = 0.5  -- Cambia la transparencia del fondo
					element.BackgroundColor3 = Color3.fromRGB(255, 0, 0)  -- Cambiar color de fondo del frame
				end
			end
		end
	end)
end)

-- Cielo
local Lighting = game:GetService("Lighting")

-- Crear un nuevo objeto Sky
local sky = Instance.new("Sky")
sky.SkyboxBk = "rbxassetid://78944177388997"  -- Imagen del fondo
sky.SkyboxDn = "rbxassetid://78944177388997"  -- Imagen de la parte inferior
sky.SkyboxFt = "rbxassetid://78944177388997"  -- Imagen del frente
sky.SkyboxLf = "rbxassetid://78944177388997"  -- Imagen de la izquierda
sky.SkyboxRt = "rbxassetid://78944177388997"  -- Imagen de la derecha
sky.SkyboxUp = "rbxassetid://78944177388997"  -- Imagen de la parte superior

-- Asignar el Sky al Lighting
sky.Parent = Lighting



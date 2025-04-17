local ScreenGui = Instance.new("ScreenGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = game.StarterGui
local Frame = Instance.new("Frame")
Frame.Active = true
Frame.BackgroundColor3 = Color3.new(0,0,0)
Frame.BackgroundTransparency = 0.30000001192092896
Frame.BorderColor3 = Color3.new(0,0,0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.25943830609321594,0,0.2294730395078659,0)
Frame.Size = UDim2.new(0,426,0,252)
Frame.Parent = ScreenGui
local TextLabel = Instance.new("TextLabel")
TextLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json",Enum.FontWeight.SemiBold,Enum.FontStyle.Normal)
TextLabel.Text = "FARA Destroyer V 1.0"
TextLabel.TextColor3 = Color3.new(1,1,1)
TextLabel.TextScaled = true
TextLabel.TextSize = 14
TextLabel.TextWrapped = true
TextLabel.TextXAlignment = Enum.TextXAlignment.Left
TextLabel.BackgroundColor3 = Color3.new(1,1,1)
TextLabel.BackgroundTransparency = 1
TextLabel.BorderColor3 = Color3.new(0,0,0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.05868544429540634,0,0.0555555559694767,0)
TextLabel.Size = UDim2.new(0,129,0,21)
TextLabel.Parent = Frame
local ImageLabel = Instance.new("ImageLabel")
ImageLabel.Image = "rbxassetid://10747384394"
ImageLabel.ImageContent = nil
ImageLabel.BackgroundColor3 = Color3.new(1,1,1)
ImageLabel.BackgroundTransparency = 1
ImageLabel.BorderColor3 = Color3.new(0,0,0)
ImageLabel.BorderSizePixel = 0
ImageLabel.Position = UDim2.new(0.9154929518699646,0,0.0634920671582222,0)
ImageLabel.Size = UDim2.new(0,16,0,16)
ImageLabel.Parent = Frame
local TextLabel1 = Instance.new("TextLabel")
TextLabel1.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json",Enum.FontWeight.Light,Enum.FontStyle.Normal)
TextLabel1.Text = "Última revision: 04/17/2025"
TextLabel1.TextColor3 = Color3.new(1,1,1)
TextLabel1.TextScaled = true
TextLabel1.TextSize = 12
TextLabel1.TextWrapped = true
TextLabel1.TextXAlignment = Enum.TextXAlignment.Left
TextLabel1.BackgroundColor3 = Color3.new(1,1,1)
TextLabel1.BackgroundTransparency = 1
TextLabel1.BorderColor3 = Color3.new(0,0,0)
TextLabel1.BorderSizePixel = 0
TextLabel1.Position = UDim2.new(0.05868544429540634,0,0.8730158805847168,0)
TextLabel1.Size = UDim2.new(0,140,0,23)
TextLabel1.Parent = Frame
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0,6)
UICorner.Parent = Frame
local TextButton = Instance.new("TextButton")
TextButton.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json",Enum.FontWeight.Regular,Enum.FontStyle.Normal)
TextButton.Text = "DAME TODAS LAS ARMAS JEJE"
TextButton.TextColor3 = Color3.new(1,1,1)
TextButton.TextSize = 15
TextButton.TextWrapped = true
TextButton.BackgroundColor3 = Color3.new(0,0,0)
TextButton.BackgroundTransparency = 0.699999988079071
TextButton.BorderColor3 = Color3.new(1,1,1)
TextButton.BorderSizePixel = 5
TextButton.Position = UDim2.new(0.058448754251003265,0,0.19607846438884735,0)
TextButton.Size = UDim2.new(0,365,0,50)
TextButton.Parent = Frame
local LocalScript = Instance.new("LocalScript")
LocalScript.Source = 'local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Crear el RemoteEvent si no existe
local event = ReplicatedStorage:FindFirstChild("GiveAllWeapons")
if not event then
	event = Instance.new("RemoteEvent")
	event.Name = "GiveAllWeapons"
	event.Parent = ReplicatedStorage
end

script.Parent.MouseButton1Click:Connect(function()
	event:FireServer()
end)
'
LocalScript.Parent = TextButton
local UICorner1 = Instance.new("UICorner")
UICorner1.CornerRadius = UDim.new(0,5)
UICorner1.Parent = TextButton
local Script = Instance.new("Script")
Script.Source = 'local ServerStorage = game:GetService("ServerStorage")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local event = ReplicatedStorage:FindFirstChild("GiveAllWeapons") or Instance.new("RemoteEvent")
event.Name = "GiveAllWeapons"
event.Parent = ReplicatedStorage

event.OnServerEvent:Connect(function(player)
	local backpack = player:FindFirstChild("Backpack")
	local starterGear = player:FindFirstChild("StarterGear")

	if not backpack or not starterGear then return end

	for _, item in ipairs(ServerStorage:GetChildren()) do
		if item:IsA("Tool") then
			local clone1 = item:Clone()
			local clone2 = item:Clone()
			clone1.Parent = backpack
			clone2.Parent = starterGear
		end
	end
end)
'
Script.Parent = TextButton
local LocalScript1 = Instance.new("LocalScript")
LocalScript1.Source = 'local UIS = game:GetService("UserInputService")
local frame = script.Parent

local dragging = false
local dragInput, dragStart, startPos

local function update(input)
	local delta = input.Position - dragStart
	frame.Position = UDim2.new(
		startPos.X.Scale, startPos.X.Offset + delta.X,
		startPos.Y.Scale, startPos.Y.Offset + delta.Y
	)
end

frame.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = input.Position
		startPos = frame.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

frame.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement then
		dragInput = input
	end
end)

UIS.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		update(input)
	end
end)

'
LocalScript1.Parent = Frame

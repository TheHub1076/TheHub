-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local TextLabel = Instance.new("TextLabel")
local PlayerName = Instance.new("TextLabel")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

TextLabel.Parent = ScreenGui
TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Position = UDim2.new(0.5, 0, 0.481464326, 0)
TextLabel.Size = UDim2.new(0.192187503, 0, 0.124189064, 0)
TextLabel.Font = Enum.Font.GothamBlack
TextLabel.Text = ""
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 50.000

PlayerName.Name = "PlayerName"
PlayerName.Parent = ScreenGui
PlayerName.AnchorPoint = Vector2.new(0.5, 0.5)
PlayerName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PlayerName.BackgroundTransparency = 1.000
PlayerName.Position = UDim2.new(0.5, 0, 0.518535674, 0)
PlayerName.Size = UDim2.new(0.192187503, 0, 0.124189064, 0)
PlayerName.Font = Enum.Font.GothamBlack
PlayerName.Text = ""
PlayerName.TextColor3 = Color3.fromRGB(255, 255, 255)
PlayerName.TextSize = 50.000

-- Scripts:

local function LSOGCBA_fake_script() -- ScreenGui.LocalScript 
	local script = Instance.new('LocalScript', ScreenGui)

	local text = script.Parent.TextLabel
	local playertext = script.Parent.PlayerName
	local PlayerName = game.Players.LocalPlayer.Name
	
	text.Text = "W"
	wait(0.1)
	text.Text = "We"
	wait(0.1)
	text.Text = "Wel"
	wait(0.1)
	text.Text = "Welc"
	wait(0.1)
	text.Text = "Welco"
	wait(0.1)
	text.Text = "Welcom"
	wait(0.1)
	text.Text = "Welcome"
	wait(0.1)
	text.Text = "Welcome,"
	wait(0.2)
	playertext.Text = PlayerName
	
	playertext.TextTransparency = 0.1
	text.TextTransparency = 0.1
	wait(0.1)
	playertext.TextTransparency = 0.2
	text.TextTransparency = 0.2
	wait(0.1)
	playertext.TextTransparency = 0.3
	text.TextTransparency = 0.3
	wait(0.1)
	playertext.TextTransparency = 0.4
	text.TextTransparency = 0.4
	wait(0.1)
	playertext.TextTransparency = 0.5
	text.TextTransparency = 0.5
	wait(0.1)
	playertext.TextTransparency = 0.6
	text.TextTransparency = 0.6
	wait(0.1)
	playertext.TextTransparency = 0.7
	text.TextTransparency = 0.7
	wait(0.1)
	playertext.TextTransparency = 0.8
	text.TextTransparency = 0.8
	wait(0.1)
	playertext.TextTransparency = 0.9
	text.TextTransparency = 0.9
	wait(0.1)
	playertext.TextTransparency = 1
	text.TextTransparency = 1
	wait(0.1)
	
	script.Parent:Destroy()
	
end
coroutine.wrap(LSOGCBA_fake_script)()

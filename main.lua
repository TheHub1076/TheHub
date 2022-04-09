-- Instances:

local intro = Instance.new("ScreenGui")
local main = Instance.new("Frame")
local name = Instance.new("TextLabel")

--Properties:

intro.Name = "intro"
intro.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
intro.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

main.Name = "main"
main.Parent = intro
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
main.BackgroundTransparency = 1.000
main.BorderSizePixel = 0
main.Position = UDim2.new(0.5, 0, 0.5, 0)
main.Size = UDim2.new(0, 1920, 0, 1080)

name.Name = "name"
name.Parent = main
name.AnchorPoint = Vector2.new(0.5, 0.5)
name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
name.BackgroundTransparency = 1.000
name.BorderSizePixel = 0
name.Position = UDim2.new(0.5, 0, 0.5, 0)
name.Size = UDim2.new(0, 192, 0, 204)
name.Font = Enum.Font.FredokaOne
name.Text = "THE HUB"
name.TextColor3 = Color3.fromRGB(255, 255, 255)
name.TextScaled = true
name.TextSize = 100.000
name.TextTransparency = 0.500
name.TextWrapped = true

-- Scripts:

local function QEFAEI_fake_script() -- main.LocalScript 
	local script = Instance.new('LocalScript', main)

	local main = script.Parent.Parent.main
	
	main.Visible = true
	wait(3)
	main.Visible = false
end
coroutine.wrap(QEFAEI_fake_script)()


wait(3)

local SolarisLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/main%20ui%20libary.lua"))()

local GameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
local PlayerName = game.Players.LocalPlayer.Name
local HWID = game:GetService("RbxAnalyticsService"):GetClientId()
local fps = 0
local rs = game:GetService("RunService")
local GameID = game.PlaceId
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Minutes = 0
local Executor = identifyexecutor();
local PlayerID = LocalPlayer.UserId


local hub = SolarisLib:New({
   Name = "The Hub",
   FolderToSave = "The Hub Data"
})




-- TABS


local home = hub:Tab("Home")

local scripts = hub:Tab("Scripts")

local hubs = hub:Tab("Hubs")

local localplayer = hub:Tab("Localplayer")

local lp = hub:Tab(PlayerName)



-- LP

local lpsec = lp:Section(PlayerName)

local name = lpsec:Label("Name:")
lpsec:Button(PlayerName, function()
   setclipboard(PlayerName)
   SolarisLib:Notification("Successful", "copied username")
end)

local placeholder107 = lpsec:Label("")

local name = lpsec:Label("Player ID:")
lpsec:Button(PlayerID, function()
   setclipboard(PlayerID)
   SolarisLib:Notification("Successful", "copied player id")
end)

local placeholder107 = lpsec:Label("")

local Hardwareid = lpsec:Label("Hardware Id:")
lpsec:Button(HWID, function()
   setclipboard(HWID)
   SolarisLib:Notification("Successful", "copied hardware id")
end)


local placeholder107 = lpsec:Label("")

local Placeid = lpsec:Label("Game name:")
lpsec:Button(GameName, function()
   setclipboard(GameName)
   SolarisLib:Notification("Successful", "copied game name")
end)

local placeholder107 = lpsec:Label("")

local Placeid = lpsec:Label("Game Id:")
lpsec:Button(GameID, function()
   setclipboard(GameID)
   SolarisLib:Notification("Successful", "copied game id")
end)

local placeholder107 = lpsec:Label("")

local fps12 = lpsec:Label("FPS:")
rs.RenderStepped:Connect(function()
	fps = fps + 1
end)
local fps123 = lpsec:Label(fps)

local placeholder107 = lpsec:Label("")

local exe12 = lpsec:Label("Executor:")
local exe111 = lpsec:Label(Executor)



-- HOME


local homesec = home:Section("Home")


local thx = homesec:Label("Thanks for using The Hub!")

homesec:Button("Copy Discord", function()
   setclipboard("https://discord.gg/4crEfddETC")
end)


--

local changelogsec = home:Section("Changelog")


local change = changelogsec:Label("Changelog:\
Last updated: 03/20/2022")
   local date1 = changelogsec:Label("03/20/2022")
   local ch1 = changelogsec:Label("+ Release")

--

local creditsec = home:Section("Credits")


local owner = creditsec:Label("Owner: Jkgamer1_0#1076")

local tester = creditsec:Label("Tester: Jsgamer1_0")

local designer = creditsec:Label("UI libary: dawid#7205")


--
local faqsec = home:Section("FAQ")


local q1 = faqsec:Label("What is The Hub?")
local a1 = faqsec:Label("A: A script Hub with many good and tested scripts!")
local p1 = faqsec:Label("")

local q2 faqsec:Label("How many games does The Hub support?")
local a2 = faqsec:Label("A: 15 games")



-- LOCALPLAYER

local localplayersec = localplayer:Section("Localplayer")

local walkspeed = localplayersec:Slider("Walkspeed", 16,1000,16,1,"Walkspeed", function(t)
   game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = t
end)

local jumppower = localplayersec:Slider("JumpPower", 50,1000,50,1,"JumpPower", function(e)
   game.Players.LocalPlayer.Character.Humanoid.JumpPower = e
end)

localplayersec:Button("Xray", function()
   SolarisLib:Notification("Info", "Press X to toggle Xray")
         local t=false

        local function scan(z,t)
        for _,i in pairs(z:GetChildren()) do
        if i:IsA("BasePart") and not i.Parent:FindFirstChild("Humanoid") and not i.Parent.Parent:FindFirstChild("Humanoid") then
        i.LocalTransparencyModifier=t
        end

        scan(i,t)
        end
        end

        function x(v)
        if v then
        scan(workspace,0.5)
        else
        scan(workspace,0)
        end
        end

        game:GetService("UserInputService").InputBegan:connect(function (input)
        if input.UserInputType==Enum.UserInputType.Keyboard and input.KeyCode==Enum.KeyCode.X then
        t=not t
        x(t)
        end
        end)
end)


localplayersec:Button("ESP menu", function()
  loadstring(game:HttpGet('https://raw.githubusercontent.com/TheHub1076/TheHub/main/scripts/unnamedESP.lua'))()
end)

localplayersec:Button("Anti AFK menu", function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/TheHub1076/TheHub/main/scripts/hubantiafk.lua'))()
end)

localplayersec:Button("Rejoin", function()
   local Rejoin = coroutine.create(function()
      local Success, ErrorMessage = pcall(function()
          TeleportService:Teleport(game.PlaceId, LocalPlayer)
      end)
  
      if ErrorMessage and not Success then
          warn(ErrorMessage)
      end
  end)

  coroutine.resume(Rejoin)
end)



-- SCRIPTS


local autosec = scripts:Section("Auto detect")

autosec:Button("Auto detect game", function()

   local PlaceID = game.PlaceId

	if PlaceID == 286090429 then
		loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/arsenal.lua"))()
	elseif PlaceID == 6872265039 then
		loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/bedwars.lua"))()
   elseif PlaceID == 3527629287 then
      loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/bigpaintball.lua"))()
   elseif PlaceID == 185655149 then
      loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/bloxburg.lua"))()
   elseif PlaceID == 654732683 then
      loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/carcrushers2.lua"))()
   elseif PlaceID == 7560156054 then
      loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/clickersimulator.lua"))()
   elseif PlaceID == 4872321990 then
      loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/islands.lua"))()
   elseif PlaceID == 13822889 then
      loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/lumbertycoon2.lua"))()
   elseif PlaceID == 1224212277 then
      loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/madcity.lua"))()
   elseif PlaceID == 142823291 then
      loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/murdermystery2.lua"))()
   elseif PlaceID == 6284583030 then
      loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/petsimulatorx.lua"))()
   elseif PlaceID == 292439477 then
      loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/phantomforces.lua"))()
   elseif PlaceID == 7346416636 then
      loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/popittrading.lua"))()
   elseif PlaceID == 734159876 then
      loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/sharkbite.lua"))()
   elseif PlaceID == 4639625707 then
      loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/oilwarfaretycoon.lua"))()
   elseif PlaceID == 2534724415 then
      loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/erlc.lua"))()
   else
      SolarisLib:Notification(GameName, "is not supported")
   end
end)



local placeholder321 = autosec:Label("")



local scriptssec = scripts:Section("Scripts")



scriptssec:Button("Universal", function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/universal.lua"))()
end)

local a  = scriptssec:Label("A")

scriptssec:Button("Arsenal", function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/arsenal.lua"))()
end)

--

local b  = scriptssec:Label("B")

scriptssec:Button("Bedwars", function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/bedwars.lua"))()
end)

scriptssec:Button("Big Paintball", function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/bigpaintball.lua"))()
end)

scriptssec:Button("Bloxburg", function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/bloxburg.lua"))()
end)

--

local c  = scriptssec:Label("C")

scriptssec:Button("Car Crushers 2", function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/carcrushers2.lua"))()
end)

scriptssec:Button("Clicker Simulator", function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/clickersimulator.lua"))()
end)

--

local d  = scriptssec:Label("D")

local e  = scriptssec:Label("E")

scriptssec:Button("Emergency Response : Liberty county", function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/erlc.lua"))()
end)

--

local f = scriptssec:Label("F")

local g  = scriptssec:Label("G")

local h  = scriptssec:Label("H")

local i  = scriptssec:Label("I")

scriptssec:Button("Islands", function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/islands.lua"))()
end)

--

local j  = scriptssec:Label("J")

local k  = scriptssec:Label("K")

local l  = scriptssec:Label("L")

scriptssec:Button("Lumber Tycoon 2", function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/lumbertycoon2.lua"))()
end)

--

local m  = scriptssec:Label("M")

scriptssec:Button("Mad City", function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/madcity.lua"))()
end)

scriptssec:Button("Murder Mystery 2", function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/murdermystery2.lua"))()
end)

--

local n  = scriptssec:Label("N")

local o  = scriptssec:Label("O")

scriptssec:Button("Oil Warfare Tycoon", function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/oilwarfaretycoon.lua"))()
end)

--

local p  = scriptssec:Label("P")

scriptssec:Button("Pet Simulator X", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/petsimulatorx.lua"))()
end)

scriptssec:Button("Phantom forces", function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/phantomforces.lua"))()
end)

scriptssec:Button("Pop it trading", function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/popittrading.lua"))()
end)

--

local q  = scriptssec:Label("Q")

local r  = scriptssec:Label("R")

local s  = scriptssec:Label("S")

scriptssec:Button("Sharkbite", function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/sharkbite.lua"))()
end)

--

local t  = scriptssec:Label("T")

local u  = scriptssec:Label("U")

local v  = scriptssec:Label("V")

local w  = scriptssec:Label("W")

local x  = scriptssec:Label("X")

local y  = scriptssec:Label("Y")

local z  = scriptssec:Label("Z")



-- HUBS


local projectevo2 = hubs:Section("Project: Evolution V2")

projectevo2:Button("Project: Evolution V2", function()
   loadstring(game:HttpGet("https://projectevo.xyz/script/loader.lua"))()
end)

local game1 = projectevo2:Label(" Supported games:")
local game1 = projectevo2:Label("  - Bad Business")
local game1 = projectevo2:Label("  - Phantom Forces")
local game1 = projectevo2:Label("  - Project Lazarus")
local game1 = projectevo2:Label("  - Strucid")
local game1 = projectevo2:Label("  - Jailbreak")

--

local domainx = hubs:Section("Domain X")

domainx:Button("Domain X", function()
   -- DomainX Loadstring
   loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/DomainX/main/source',true))()
end)

local game2 = domainx:Label(" Supported games:")
local game2 = domainx:Label("  - Bedwars")
local game2 = domainx:Label("  - Greenville")
local game2 = domainx:Label("  - Vesteria")
local game2 = domainx:Label("  - Identity Fraud")
local game2 = domainx:Label("  - Critical Strike")
local game2 = domainx:Label("  - Demonfall")
local game2 = domainx:Label("  - Dragon Ball Rage")
local game2 = domainx:Label("  - Build A Boat For Teasure")
local game2 = domainx:Label("  - Kaiju Paradise")
local game2 = domainx:Label("  - Shouting Simulator")
local game2 = domainx:Label("  - Even More FNF 2")
local game2 = domainx:Label("  - Texting Simulator")
local game2 = domainx:Label("  - Friday Night Funkin")
local game2 = domainx:Label("  - Demon Slayer RPG 2")
local game2 = domainx:Label("  - Ro-Ghoul")
local game2 = domainx:Label("  - Mega Easy Obby")
local game2 = domainx:Label("  - Broken Bones IV")
local game2 = domainx:Label("  - Coins Hero Simulator")
local game2 = domainx:Label("  - KAT")
local game2 = domainx:Label("  - Ninja Legends")
local game2 = domainx:Label("  - My Restaurant")
local game2 = domainx:Label("  - Pet Simulator X")
local game2 = domainx:Label("  - Anime Artifacts")
local game2 = domainx:Label("  - Blox Fruits")
local game2 = domainx:Label("  - Mad City")
local game2 = domainx:Label("  - Stop It Slender!")
local game2 = domainx:Label("  - Remote Control Panel")
local game2 = domainx:Label("  - Life Paradise")
local game2 = domainx:Label("  - Tower Defense Simulator")
local game2 = domainx:Label("  - Wolf Life 3")
local game2 = domainx:Label("  - Decaying Winter")
local game2 = domainx:Label("  - Those Who Remain")
local game2 = domainx:Label("  - Anomic")
local game2 = domainx:Label("  - Funky Friday")
local game2 = domainx:Label("  - Zombie Uprising")
local game2 = domainx:Label("  - Prison Life")
local game2 = domainx:Label("  - Entry Point")
local game2 = domainx:Label("  - Soulshatter Test Place")
local game2 = domainx:Label("  - Southwest Florida")
local game2 = domainx:Label("  - Anime Destroyers simulator")
local game2 = domainx:Label("  - Expedition Antarctica")
local game2 = domainx:Label("  - The Wild West")




-----------------------------------------------------------------

SolarisLib:Notification("Successful", "executed The Hub")

wait(1)

SolarisLib:Notification("Welcome,", PlayerName)

SolarisLib:Notification("Executor detected", Executor)

wait(1)

SolarisLib:Notification("Game detected", GameName)

-----------------------------------------------------------------

while true do
    fps123:Set(fps)
    fps = 0
	wait(1)
end

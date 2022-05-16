local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/TheHub1076/TheHub/main/Orion%20libary.lua')))()

_G.loop = false;

local GameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
local PlayerName = game.Players.LocalPlayer.Name
local HWID = game:GetService("RbxAnalyticsService"):GetClientId()
local GameID = game.PlaceId
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Executor = identifyexecutor();
local PlayerID = LocalPlayer.UserId

local Main = OrionLib:MakeWindow({Name = "The Hub", HidePremium = true, SaveConfig = true, ConfigFolder = "the hub config"})



-- TABS

local home = Main:MakeTab({
	Name = "Home",
	Icon = "rbxassetid://4370345144",
	PremiumOnly = false
})

local scripts = Main:MakeTab({
	Name = "Scripts",
	Icon = "rbxassetid://4370318685",
	PremiumOnly = false
})

local unscripts = Main:MakeTab({
	Name = "Untested Scripts",
	Icon = "rbxassetid://4384394237",
	PremiumOnly = false
})

local hubs = Main:MakeTab({
	Name = "Hubs",
	Icon = "rbxassetid://4370319235",
	PremiumOnly = false
})

local localplayer = Main:MakeTab({
	Name = "Localplayer",
	Icon = "rbxassetid://4335480896",
	PremiumOnly = false
})

local lp = Main:MakeTab({
	Name = PlayerName,
	Icon = "rbxassetid://4384394237",
	PremiumOnly = false
})



-- HOME

home:AddLabel("Thanks for using The Hub!")

home:AddLabel("Use at own risk!")

home:AddButton({
	Name = "Copy Discord Link",
	Callback = function()
        setclipboard("https://discord.gg/4crEfddETC")
        OrionLib:MakeNotification({
            Name = "Successful",
            Content = "Successful copied Discord Link!",
            Image = "rbxassetid://3424796336",
            Time = 5
        })
  	end    
})

home:AddParagraph("Changelog:","\
Last updated: 05/07/2022\
\
+ Release\
+ New UI Libary\
+ Added Kaiju Paradise script\
+ Added untested script tab")

home:AddParagraph("Credits:","\
Last updated: 05/07/2022\
\
Owner: Jkgamer1_0#1076\
Tester: Jsgamer1_0, Jason_azaza\
UI libary: shlex#0001, dawid#7205")

home:AddParagraph("FAQ:","\
What is The Hub?\
A: A script hub with many good and tested scripts!\
\
How many games does The Hub support?\
A: 15 games")



-- LOCAL PLAYER

localplayer:AddSlider({
	Name = "Walkspeed",
	Min = 0,
	Max = 1000,
	Default = 16,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "speed",
	Callback = function(Value)
                while _G.loop == true do
                        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
                        wait(0.1)
                end

	end    
})

localplayer:AddSlider({
	Name = "Jumppower",
	Min = 0,
	Max = 1000,
	Default = 50,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "jumppower",
	Callback = function(Value)
                while _G.loop == true do
                        game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
                        wait(0.1)
                end
	end    
})

localplayer:AddButton({
	Name = "Xray",
	Callback = function()
        OrionLib:MakeNotification({
            Name = "Information",
            Content = "Press X to toggle Xray",
            Image = "rbxassetid://3424796345",
            Time = 5
        })

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
  	end    
})

localplayer:AddButton({
	Name = "ESP menu",
	Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/TheHub1076/TheHub/main/scripts/unnamedESP.lua'))()
  	end    
})

localplayer:AddButton({
	Name = "Anti AFK menu",
	Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/TheHub1076/TheHub/main/scripts/hubantiafk.lua'))()
  	end    
})

localplayer:AddButton({
	Name = "Rejoin",
	Callback = function()
        local Rejoin = coroutine.create(function()
            local Success, ErrorMessage = pcall(function()
                TeleportService:Teleport(game.PlaceId, LocalPlayer)
            end)
        
            if ErrorMessage and not Success then
                warn(ErrorMessage)
            end
        end)
      
        coroutine.resume(Rejoin)
  	end    
})



-- LP

lp:AddParagraph("Username:",PlayerName)

lp:AddParagraph("User ID:",PlayerID)

lp:AddParagraph("Hardware ID:",HWID)

lp:AddParagraph("Game Name:",GameName)

lp:AddParagraph("Game ID:",GameID)

lp:AddParagraph("Executor:",Executor)

lp:AddButton({
	Name = "Copy Username",
	Callback = function()
        setclipboard(PlayerName)
        OrionLib:MakeNotification({
            Name = "Successful",
            Content = "Successful copied Username!",
            Image = "rbxassetid://3424796336",
            Time = 5
        })
  	end    
})

lp:AddButton({
	Name = "Copy User ID",
	Callback = function()
        setclipboard(PlayerID)
        OrionLib:MakeNotification({
            Name = "Successful",
            Content = "Successful copied User ID!",
            Image = "rbxassetid://3424796336",
            Time = 5
        })
  	end    
})

lp:AddButton({
	Name = "Copy Hardware ID",
	Callback = function()
        setclipboard(HWID)
        OrionLib:MakeNotification({
            Name = "Successful",
            Content = "Successful copied Hardware ID!",
            Image = "rbxassetid://3424796336",
            Time = 5
        })
  	end    
})

lp:AddButton({
	Name = "Copy Game Name",
	Callback = function()
        setclipboard(GameName)
        OrionLib:MakeNotification({
            Name = "Successful",
            Content = "Successful copied Game Name!",
            Image = "rbxassetid://3424796336",
            Time = 5
        })
  	end    
})

lp:AddButton({
	Name = "Copy Game ID",
	Callback = function()
        setclipboard(GameID)
        OrionLib:MakeNotification({
            Name = "Successful",
            Content = "Successful copied Game ID!",
            Image = "rbxassetid://3424796336",
            Time = 5
        })
  	end    
})

lp:AddButton({
	Name = "Copy Executor Name",
	Callback = function()
        setclipboard(Executor)
        OrionLib:MakeNotification({
            Name = "Successful",
            Content = "Successful copied Executor Name!",
            Image = "rbxassetid://3424796336",
            Time = 5
        })
  	end    
})



-- SCRIPTS

scripts:AddButton({
	Name = "Auto detect (recommended)",
	Callback = function()
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
        elseif PlaceID == 6456351776 then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/kaijuparadise.lua"))()
        else
         OrionLib:MakeNotification({
             Name = GameName,
             Content = "is not supported",
             Image = "rbxassetid://4483345998",
             Time = 5
         })
       end
  	end    
})

scripts:AddButton({
	Name = "Universal",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/universal.lua"))()
  	end    
})

scripts:AddLabel("Scripts from A-Z:")

scripts:AddLabel("A")

scripts:AddButton({
	Name = "Arsenal",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/arsenal.lua"))()
  	end    
})

scripts:AddLabel("B")

scripts:AddButton({
	Name = "Bedwars",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/bedwars.lua"))()
  	end    
})

scripts:AddButton({
	Name = "Big Paintball",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/bigpaintball.lua"))()
  	end    
})

scripts:AddButton({
	Name = "Bloxburg",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/bloxburg.lua"))()
  	end    
})

scripts:AddLabel("C")

scripts:AddButton({
	Name = "Car Crushers 2",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/carcrushers2.lua"))()
  	end    
})

scripts:AddButton({
	Name = "Clicker Simulator",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/clickersimulator.lua"))()
  	end    
})

scripts:AddLabel("D")
scripts:AddLabel("E")

scripts:AddButton({
	Name = "Emergency Response : Liberty County",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/erlc.lua"))()
  	end    
})

scripts:AddLabel("F")
scripts:AddLabel("G")
scripts:AddLabel("H")
scripts:AddLabel("I")

scripts:AddButton({
	Name = "Islands",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/islands.lua"))()
  	end    
})

scripts:AddLabel("J")
scripts:AddLabel("K")

scripts:AddButton({
	Name = "Kaiju Paradise",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/kaijuparadise.lua"))()
  	end    
})

scripts:AddLabel("L")

scripts:AddButton({
	Name = "Lumber Tycoon 2",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/lumbertycoon2.lua"))()
  	end    
})

scripts:AddLabel("M")

scripts:AddButton({
	Name = "Mad City",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/madcity.lua"))()
  	end    
})

scripts:AddButton({
	Name = "Murder Mystery 2",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/murdermystery2.lua"))()
  	end    
})

scripts:AddLabel("N")
scripts:AddLabel("O")

scripts:AddButton({
	Name = "Oil Warfare Tycoon",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/oilwarfaretycoon.lua"))()
  	end    
})

scripts:AddLabel("P")

scripts:AddButton({
	Name = "Pet Simulator X",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/petsimulatorx.lua"))()
  	end    
})

scripts:AddButton({
	Name = "Phantom Forces",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/phantomforces.lua"))()
  	end    
})

scripts:AddButton({
	Name = "Pop it trading",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/popittrading.lua"))()
  	end    
})

scripts:AddLabel("Q")
scripts:AddLabel("R")
scripts:AddLabel("S")

scripts:AddButton({
	Name = "Sharkbite",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/sharkbite.lua"))()
  	end    
})

scripts:AddLabel("T")
scripts:AddLabel("U")
scripts:AddLabel("V")
scripts:AddLabel("W")
scripts:AddLabel("X")
scripts:AddLabel("Y")
scripts:AddLabel("Z")



-- HUBS

hubs:AddButton({
	Name = "Execute (Project: Evolution V2)",
	Callback = function()
        loadstring(game:HttpGet("https://projectevo.xyz/script/loader.lua"))()
  	end    
})

hubs:AddParagraph("Project: Evolution V2","\
 Supported games:\
   - Bad Business\
   - Phantom Forces\
   - Project Lazarus\
   - Strucid\
   - Jailbreack")

hubs:AddButton({
	Name = "Execute (Domain X)",
	Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/DomainX/main/source',true))()
  	end    
})

hubs:AddParagraph("Domain X","\
 Supported games:\
   - Bedwars\
   - Greenville\
   - Vesteria\
   - Identity Fraud\
   - Critical Strike\
   - Demonfall\
   - Dragon Ball Rage\
   - Build A Boat For Teasure\
   - Kaiju Paradise\
   - Shouting Simulator\
   - Even More FNF 2\
   - Texting Simulator\
   - Friday Night Funkin\
   - Demon Slayer RPG 2\
   - Ro-Ghoul\
   - Mega Easy Obby\
   - Broken Bones IV\
   - Coins Hero Simulator\
   - KAT\
   - Ninja Legends\
   - My Restaurant\
   - Pet Simulator X\
   - Anime Artifacts\
   - Blox Fruits\
   - Mad City\
   - Stop It Slender!\
   - Remote Control Panel\
   - Life Paradise\
   - Tower Defense Simulator\
   - Wolf Life 3\
   - Decaying Winter\
   - Those Who Remain\
   - Anomic\
   - Funky Friday\
   - Zombie Uprising\
   - Prison Life\
   - Entry Point\
   - Soulshatter Test Place\
   - Southwest Florida\
   - Anime Destroyers simulator\
   - Expedition Antarctica\
   - The Wild West")



-- UNTESTED SCRIPTS

unscripts:AddParagraph("Warning!","These scripts have not been tested!\
use at your own risk")

unscripts:AddButton({
	Name = "Combat Warriors Script",
	Callback = function()
                loadstring(game:HttpGet("https://projecthook.xyz/scripts/free.lua"))()
  	end    
})

unscripts:AddButton({
	Name = "Mega Mansion Tycoon",
	Callback = function()
                loadstring(game:HttpGet('https://raw.githubusercontent.com/SunkenMuch/Soggyware/main/Main',true))()
  	end    
})



-----------------------------------------------------------------

OrionLib:MakeNotification({
	Name = "Successful",
	Content = "Successful executed The Hub",
	Image = "rbxassetid://4483345998",
	Time = 5
})

wait(1)

OrionLib:MakeNotification({
	Name = "Welcome,",
	Content = PlayerName,
	Image = "rbxassetid://4483345998",
	Time = 5
})

OrionLib:MakeNotification({
	Name = "Executor detected",
	Content = Executor,
	Image = "rbxassetid://4483345998",
	Time = 5
})

wait(1)

OrionLib:MakeNotification({
	Name = "Game detected",
	Content = GameName,
	Image = "rbxassetid://4483345998",
	Time = 5
})

-----------------------------------------------------------------



OrionLib:Init()

_G.loop = true;

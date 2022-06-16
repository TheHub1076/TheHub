loadstring(game:HttpGet(('https://raw.githubusercontent.com/TheHub1076/TheHub/main/scripts/welcome.lua')))()

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

local settings = Main:MakeTab({
	Name = "Settings",
	Icon = "rbxassetid://3605022185",
	PremiumOnly = false
})



-- HOME

local zeit = home:AddLabel("time")

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

local info = home:AddSection({
	Name = "Information"
})

info:AddParagraph("Changelog:","\
Last updated: 06/15/2022\
\
+ Release\
+ Added Idiotic Investing script\
+ Added Bloxy Bingo script\
+ Added Welcome screen\
+ Added Sections\
+ Added Settings\
* Fixed not executing with KRNL")

info:AddParagraph("Credits:","\
Last updated: 05/07/2022\
\
Owner: Jkgamer1_0#1076\
Tester: Jsgamer1_0, Jason_azaza#2022\
UI libary: shlex#0001, dawid#7205")
info:AddParagraph("FAQ:","\
What is The Hub?\
A: A script hub with many good and tested scripts!\
\
How many games does The Hub support?\
A: 22 games\
\
What executor does The Hub support?\
A: Synapse X, Script Ware, KRNL, Fluxus")



-- LOCAL PLAYER

local zeit1 = localplayer:AddLabel("time")

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
            Image = "rbxassetid://8950611017",
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

local zeit2 = lp:AddLabel("time")

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

local zeit3 = scripts:AddLabel("time")

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
      elseif PlaceID == 606849621 then
         loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/jailbreak.lua"))()
      elseif PlaceID == 9551640993 then
         loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/miningsimulator2.lua"))()
      elseif PlaceID == 2629642516 then
         loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/bitcoinminer.lua"))()
      elseif PlaceID == 6700823483 then
         loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/idioticinvesting.lua"))()
         OrionLib:MakeNotification({
            Name = "Information",
            Content = "Press F9 to see the price",
            Image = "rbxassetid://8950611017",
            Time = 5
         })
      elseif PlaceID == 5244411056 then
         loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/bloxybingo.lua"))()
      else
         OrionLib:MakeNotification({
            Name = GameName,
            Content = "is not supported",
            Image = "rbxassetid://4400699701",
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

--scripts:AddDropdown({
--	Name = "Select game",
--	Default = "Select",
--	Options = {"Select", "Arsenal", "Bedwars", "Big Paintball", "Bitcoin Miner", "Bloxburg", "Car Crushers 2", "Clicker Simulator", "Emergency Response (risky)", "Idiotic Investing", "Islands", "Jailbreak", "Kaiju Paradise", "Lumber Tycoon 2", "Mad City", "Mining Simulator 2", "Murder Mystery 2", "Oil Warfare Tycoon", "Pet Simulator X", "Phantom Forces", "Pop it Trading", "Sharkbite"},
--	Callback = function(Value)
--		print(Value)
--	end    
--})

local a = scripts:AddSection({
	Name = "A"
})

a:AddButton({
	Name = "Arsenal",
	Callback = function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/arsenal.lua"))()
  	end    
})

local b = scripts:AddSection({
	Name = "B"
})

b:AddButton({
	Name = "Bedwars",
	Callback = function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/bedwars.lua"))()
  	end    
})

b:AddButton({
	Name = "Big Paintball",
	Callback = function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/bigpaintball.lua"))()
  	end    
})

b:AddButton({
	Name = "Bitcoin Miner",
	Callback = function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/bitcoinminer.lua"))()
  	end    
})

b:AddButton({
	Name = "Bloxburg",
	Callback = function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/bloxburg.lua"))()
  	end    
})

b:AddButton({
	Name = "Bloxy Bingo",
	Callback = function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/bloxybingo.lua"))()
  	end    
})

local c = scripts:AddSection({
	Name = "C"
})

c:AddButton({
	Name = "Car Crushers 2",
	Callback = function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/carcrushers2.lua"))()
  	end    
})

c:AddButton({
	Name = "Clicker Simulator",
	Callback = function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/clickersimulator.lua"))()
  	end    
})

local d = scripts:AddSection({
	Name = "D"
})
local e = scripts:AddSection({
	Name = "E"
})

e:AddButton({
	Name = "Emergency Response : Liberty County (risky)",
	Callback = function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/erlc.lua"))()
  	end    
})

local f = scripts:AddSection({
	Name = "F"
})
local g = scripts:AddSection({
	Name = "G"
})
local h = scripts:AddSection({
	Name = "H"
})
local i = scripts:AddSection({
	Name = "I"
})

i:AddButton({
	Name = "Idiotic Investing",
	Callback = function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/idioticinvesting.lua"))()
                OrionLib:MakeNotification({
                  Name = "Information",
                  Content = "Press F9 to see the price",
                  Image = "rbxassetid://8950611017",
                  Time = 5
               })
  	end    
})

i:AddButton({
	Name = "Islands",
	Callback = function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/islands.lua"))()
  	end    
})

local j = scripts:AddSection({
	Name = "J"
})

j:AddButton({
	Name = "Jailbreak",
	Callback = function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/jailbreak.lua"))()
  	end    
})

local k = scripts:AddSection({
	Name = "K"
})

k:AddButton({
	Name = "Kaiju Paradise",
	Callback = function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/kaijuparadise.lua"))()
  	end    
})

local l = scripts:AddSection({
	Name = "L"
})

l:AddButton({
	Name = "Lumber Tycoon 2",
	Callback = function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/lumbertycoon2.lua"))()
  	end    
})

local m = scripts:AddSection({
	Name = "M"
})

m:AddButton({
	Name = "Mad City",
	Callback = function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/madcity.lua"))()
  	end    
})

m:AddButton({
	Name = "Mining Simulator 2",
	Callback = function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/miningsimulator2.lua"))()
  	end    
})

m:AddButton({
	Name = "Murder Mystery 2",
	Callback = function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/murdermystery2.lua"))()
  	end    
})

local n = scripts:AddSection({
	Name = "N"
})
local o = scripts:AddSection({
	Name = "O"
})

o:AddButton({
	Name = "Oil Warfare Tycoon",
	Callback = function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/oilwarfaretycoon.lua"))()
  	end    
})

local p = scripts:AddSection({
	Name = "P"
})

p:AddButton({
	Name = "Pet Simulator X",
	Callback = function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/petsimulatorx.lua"))()
  	end    
})

p:AddButton({
	Name = "Phantom Forces",
	Callback = function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/phantomforces.lua"))()
  	end    
})

p:AddButton({
	Name = "Pop it trading",
	Callback = function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/popittrading.lua"))()
  	end    
})

local q = scripts:AddSection({
	Name = "Q"
})
local r = scripts:AddSection({
	Name = "R"
})
local s = scripts:AddSection({
	Name = "S"
})

s:AddButton({
	Name = "Sharkbite",
	Callback = function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/sharkbite.lua"))()
  	end    
})

local t = scripts:AddSection({
	Name = "T"
})
local u = scripts:AddSection({
	Name = "U"
})
local v = scripts:AddSection({
	Name = "V"
})
local w = scripts:AddSection({
	Name = "W"
})
local x = scripts:AddSection({
	Name = "X"
})
local y = scripts:AddSection({
	Name = "Y"
})
local z = scripts:AddSection({
	Name = "Z"
})



-- HUBS

local zeit4 = hubs:AddLabel("time")

local solaris = hubs:AddSection({
	Name = "Solaris 3.0"
})

solaris:AddButton({
	Name = "Execute (Solaris 3.0)",
	Callback = function()
      loadstring(game:HttpGet('https://solarishub.net/script.lua',true))()
  	end    
})

solaris:AddParagraph("Solaris 3.0","\
 Supported games:\
   - Phantom Forces\
   - Arsenal\
   - Bad Business\
   - Sonic Speed Simulator\
   - SCP 3008")

local masterhub = hubs:AddSection({
   Name = "Master Hub"
})

masterhub:AddButton({
	Name = "Execute (Master Hub)",
	Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/destylol/masterhubv311/itachi/Main.lua"))()
  	end    
})

masterhub:AddParagraph("Master Hub","\
 Supported games:\
   - Sonic Speed Simulator\
   - Pet Simulator X\
   - Madcity\
   - King Legacy\
   - Saber Simulator\
   - Collect All Pets\
   - Bot Clash\
   - Tapping Legends\
   - Clicker Simulator\
   - Lumber Tycoon 2")

local soggyhub = hubs:AddSection({
    Name = "Soggy Hub"
})

soggyhub:AddButton({
	Name = "Execute (Soggy Hub)",
	Callback = function()
      loadstring(game:HttpGet('https://raw.githubusercontent.com/SunkenMuch/Soggyware/main/Main',true))()
  	end    
})

soggyhub:AddParagraph("Soggy Hub","\
 Supported games:\
   - Anime Dimensions\
   - Rebirth Champions X\
   - Tapper Simulator\
   - Anime Clicker Simulator\
   - Anime Tappers\
   - Slap Battles\
   - Farm Life\
   - Clicking Simulator\
   - Burn Everything Simulator\
   - A 0ne Piece Game\
   - Collect All Pets\
   - Untitled Tag Game\
   - Boom Simulator\
   - Pet Simulator X\
   - Chicken Life\
   - Smashing Simulator X\
   - Slashing Simulator\
   - Timber\
   - Big Man Simulator\
   - Tapping Legends X\
   - Pet Legacy\
   - Anime Warriors Simulator\
   - King Legacy\
   - Pet Salon Tycoon\
   - Raise A Floppa\
   - Prop Hunt\
   - Prop Hunt Kill All\
   - Oil Warfare Tycoon\
   - Bot Clash\
   - Vehicle Legends\
   - Car Dealership Tycoon\
   - City Life\
   - Mega Mansion Tycoon\
   - Ultra Power Tycoon\
   - Millionaire Empire Tycoon\
   - Breaking Blocks Simulator\
   - Anime Wrecking Simulator\
   - Multiverse Simulator\
   - Goal Kicker Simulator")

local domainx = hubs:AddSection({
   Name = "Domain X"
})

domainx:AddButton({
	Name = "Execute (Domain X)",
	Callback = function()
      loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/DomainX/main/source',true))()
  	end    
})

domainx:AddParagraph("Domain X","\
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

local zeit5 = unscripts:AddLabel("time")

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



-- SETTINGS

local zeit6 = settings:AddLabel("time")

settings:AddToggle({
	Name = "Toggle always auto detect",
	Default = false,
   Save = true,
   Flag = "always auto detect",
	Callback = function(Value)
      if Value == true then
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
         elseif PlaceID == 606849621 then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/jailbreak.lua"))()
         elseif PlaceID == 9551640993 then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/miningsimulator2.lua"))()
         elseif PlaceID == 2629642516 then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/bitcoinminer.lua"))()
         elseif PlaceID == 6700823483 then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/idioticinvesting.lua"))()
            OrionLib:MakeNotification({
               Name = "Information",
               Content = "Press F9 to see the price",
               Image = "rbxassetid://8950611017",
               Time = 5
            })
         elseif PlaceID == 5244411056 then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHub1076/TheHub/main/games/bloxybingo.lua"))()
         else
            OrionLib:MakeNotification({
               Name = GameName,
               Content = "is not supported",
               Image = "rbxassetid://4400699701",
               Time = 5
            })
         end
      end
   end
})



-----------------------------------------------------------------

OrionLib:MakeNotification({
	Name = "Successful",
	Content = "Successful executed The Hub",
	Image = "rbxassetid://3944680095",
	Time = 5
})

wait(1)

OrionLib:MakeNotification({
	Name = "Welcome,",
	Content = PlayerName,
	Image = "rbxassetid://4335489513",
	Time = 5
})

OrionLib:MakeNotification({
	Name = "Executor detected",
	Content = Executor,
	Image = "rbxassetid://4370334869",
	Time = 5
})

wait(1)

OrionLib:MakeNotification({
	Name = "Game detected",
	Content = GameName,
	Image = "rbxassetid://4370334869",
	Time = 5
})

-----------------------------------------------------------------



OrionLib:Init()

_G.loop = true;

while _G.loop == true do
        local Time = DateTime.now()
        zeit:Set("Time: "..Time:FormatLocalTime("LT", "en-us"))
        zeit1:Set("Time: "..Time:FormatLocalTime("LT", "en-us"))
        zeit2:Set("Time: "..Time:FormatLocalTime("LT", "en-us"))
        zeit3:Set("Time: "..Time:FormatLocalTime("LT", "en-us"))
        zeit4:Set("Time: "..Time:FormatLocalTime("LT", "en-us"))
        zeit5:Set("Time: "..Time:FormatLocalTime("LT", "en-us"))
        zeit6:Set("Time: "..Time:FormatLocalTime("LT", "en-us"))
        wait(0.1)
end

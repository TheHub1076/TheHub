local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()
local Notification = loadstring(game:HttpGet("https://api.irisapp.ca/Scripts/IrisBetterNotifications.lua"))()
local plr = game:GetService("Players").LocalPlayer
local plrs = game:GetService("Players")
getgenv()["IrisAd"]=true

game:GetService("ReplicatedStorage").FE.StartMafia:InvokeServer("The best")

            local function getCar()
            local vehicles = game.Workspace.Vehicles
            
            for _,v in pairs(vehicles:GetChildren()) do
                if v["Control_Values"].Owner.Value == tostring(plr.Name) then
                    return v
                end
            end
        end

local function getWantedPlayers()
    local wantedPlayers = {}
    for _,players in pairs(plrs:GetPlayers()) do
        if players:FindFirstChild("Is_Wanted") then
            table.insert(wantedPlayers, players)
        end
    end
    return wantedPlayers
end

--Timings for robberies :
--ATM : 6 minutes
--House : 6 minutes after leaving house robbery
--Bank : 

local UI = Material.Load({
    Title = "ERLC GUI",
    Style = 3,
    SizeX = 400,
    SizeY = 400,
    Theme = "Dark"
})

local Page = UI.New({
    Title = "Main"
})

Page.Button({
    Text = "Infinite Stamina",
    Callback = function()
            while wait(1) do
        plr.PlayerGui.GameGui.BottomLeft.Health["Stamina LS"].Stamina.Value = 100
        end
end
})

Page.Button({
    Text = "Instant Respawn",
    Callback = function()
        plr.Character.Humanoid.Health = 0
    end
})

Page.Button({   
    Text = "Get In Car",
    Callback = function()
        local myCar = getCar()
        if plr.Character.Humanoid.Sit then
            game.StarterGui:SetCore("SendNotification", {Title = "Error!", Text = "You cannot be sitting.", Duration = "1"})
        else
        plr.Character.HumanoidRootPart.CFrame = myCar.Body.Base.CFrame + Vector3.new(0,10,0) - Vector3.new(0,0,2)
        wait(0.1)
        myCar.DriverSeat:Sit(plr.Character.Humanoid)
        end
    end
})

Page.Button({
    Text = "Bring Car",
    Callback = function()
        local myCar = getCar()
        local oldCFrame = plr.Character.HumanoidRootPart.Position

        if plr.Character.Humanoid.Sit then
            game.StarterGui:SetCore("SendNotification", {Title = "Error!", Text = "You cannot be sitting.", Duration = "1"})
        else
        plr.Character.HumanoidRootPart.CFrame = myCar.Body.Base.CFrame + Vector3.new(0,10,0) - Vector3.new(0,0,2)
        wait(0.1)
        myCar.DriverSeat:Sit(plr.Character.Humanoid)
        wait(0.2)
        myCar:SetPrimaryPartCFrame(CFrame.new(oldCFrame))
        end
    end
})

Page.Button({
    Text = "Remove all Road Snow",
    Callback = function()
        game.Workspace["Road Snow"]:Destroy()
    end
})

Page.Toggle({
    Text = "Anti-Arrest",
    Callback = function(toggle)
        getgenv().antiArrest = false

        if toggle then
            antiArrest = true
        else
            antiArrest = false
        end

        spawn(function()
            while antiArrest do
                wait()
                if pcall(function() return plr["In_Handcuffs"] end) then
                    local oldCFrame = plr.Character.HumanoidRootPart.CFrame
                    plr.Character.UpperTorso:Destroy()
                    wait(8)
                    plr.Character.HumanoidRootPart.CFrame = oldCFrame
                end
            end
        end)
    end
})

Page.Toggle({
    Text = "Auto Arrest",
    Callback = function(state)
        getgenv().autoArrest = false

        if state then
            autoArrest = true
        else
            autoArrest = false
        end

        spawn(function()
            while autoArrest do
                wait()
                for _,v in pairs(getWantedPlayers()) do
                    while wait() do
                        plr.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame
                    end
                end
            end
        end)
    end
})

local Page2 = UI.New({
    Title = "Criminal"
})

Page2.Button({
    Text = "Get Lockpick",
    Callback = function()
        local oldCFrame = plr.Character.HumanoidRootPart.CFrame
        
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-433.891693, 23.8463306, -708.328064)
        wait(0.3)
        game:GetService("ReplicatedStorage").FE.BuyGear:InvokeServer("Lockpick")
        wait(0.2)
        plr.Character.HumanoidRootPart.CFrame = oldCFrame
    end
})

Page2.Button({
    Text = "Get RFID",
    Callback = function()
        local oldCFrame = plr.Character.HumanoidRootPart.CFrame
        
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-433.891693, 23.8463306, -708.328064)
        wait(0.3)
        game:GetService("ReplicatedStorage").FE.BuyGear:InvokeServer("RFID Disruptor")
        wait(0.2)
        plr.Character.HumanoidRootPart.CFrame = oldCFrame
    end
})

Page2.Button({
    Text = "Get Drill",
    Callback = function()
        local oldCFrame = plr.Character.HumanoidRootPart.CFrame
        
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-433.891693, 23.8463306, -708.328064)
        wait(0.3)
        game:GetService("ReplicatedStorage").FE.BuyGear:InvokeServer("Drill")
        wait(0.2)
        plr.Character.HumanoidRootPart.CFrame = oldCFrame
    end
})

Page2.Button({
    Text = "Get Scanner",
    Callback = function()
        local oldCFrame = plr.Character.HumanoidRootPart.CFrame
        
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-433.891693, 23.8463306, -708.328064)
        wait(0.3)
        game:GetService("ReplicatedStorage").FE.BuyGear:InvokeServer("Scanner")
        wait(0.2)
        plr.Character.HumanoidRootPart.CFrame = oldCFrame
    end
})

Page2.Button({
    Text = "Get Flashlight",
    Callback = function()
        local oldCFrame = plr.Character.HumanoidRootPart.CFrame
        
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-433.891693, 23.8463306, -708.328064)
        wait(0.3)
        game:GetService("ReplicatedStorage").FE.BuyGear:InvokeServer("Flashlight")
        wait(0.2)
        plr.Character.HumanoidRootPart.CFrame = oldCFrame
    end
})

Page3 = UI.New({
    Title = "Teleports"
})

Page3.Button({
    Text = "Spawn",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-475.106293, 23.7479935, 592.219116, -0.201209739, 8.43739159e-08, 0.979548156, 4.49362112e-08, 1, -7.69051667e-08, -0.979548156, 2.85431145e-08, -0.201209739)
    end
})

Page3.Button({
    Text = "Police Station",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(765.718262, 3.91197228, -83.4619827, -0.999989629, 1.05303721e-08, -0.00455942564, 1.08436051e-08, 1, -6.86753481e-08, 0.00455942564, -6.87240771e-08, -0.999989629)
    end
})

Page3.Button({
    Text = "Sheriff's Office",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-869.806702, 24.8119831, -777.731262, -0.252567083, 5.24428723e-09, 0.967579365, 3.55447085e-08, 1, 3.85822219e-09, -0.967579365, 3.53667851e-08, -0.252567083)
    end
})

Page3.Button({
    Text = "Bank Front",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1005.02893, 23.7479877, 429.643829, 0.0376574881, 3.70597277e-08, 0.999290705, 4.64238532e-08, 1, -3.88354806e-08, -0.999290705, 4.78533693e-08, 0.0376574881)
    end
})

Page3.Button({
    Text = "Bank Back",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1119.59595, 23.7479877, 449.923767, 0.0101849372, 5.11435481e-08, -0.999948144, -4.21693969e-08, 1, 5.0716686e-08, 0.999948144, 4.16506651e-08, 0.0101849372)
    end
})

Page3.Button({
    Text = "Gun Store",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1228.94055, 24.237999, -195.314438, -0.284893483, 2.05607833e-08, -0.958559155, 3.21217755e-08, 1, 1.19027588e-08, 0.958559155, -2.73996044e-08, -0.284893483)
    end
})

Page3.Button({
    Text = "Tool Store",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-435.556335, 23.7480164, -709.624329, -0.857685387, -3.67668811e-08, -0.514174879, -5.08668485e-08, 1, 1.33434588e-08, 0.514174879, 3.75989444e-08, -0.857685387)
    end
})

Page3.Button({
    Text = "Jewelry Store",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-465.584717, 23.7479877, -422.987854, 0.998838902, -3.84145835e-08, -0.0481754243, 3.35637509e-08, 1, -1.01499964e-07, 0.0481754243, 9.97651597e-08, 0.998838902)
    end
})

Page3.Button({
    Text = "Three Guys Fast food",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-315.239594, 23.7479858, -180.423141, 0.19113034, -1.20997427e-07, -0.981564641, 1.9400785e-08, 1, -1.19492228e-07, 0.981564641, 3.79546394e-09, 0.19113034)
    end
})

Page3.Button({
    Text = "Parking Garage",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-313.250397, 23.9480038, 183.138962, -0.999925852, -1.8176662e-08, -0.0121756801, -1.85332567e-08, 1, 2.91746769e-08, 0.0121756801, 2.93981692e-08, -0.999925852)
    end
})

Page3.Button({
    Text = "Jail Front",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1339.38245, 3.29774809, -341.811615, 0.999201894, -7.52183524e-08, -0.039945107, 7.88561465e-08, 1, 8.94943568e-08, 0.039945107, -9.25728472e-08, 0.999201894)
    end
})

Page3.Button({
    Text = "Hospital",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-143.000015, 23.3056774, -452.045197, 0.999754846, 1.95847143e-08, -0.0221428573, -1.73255881e-08, 1, 1.02216866e-07, 0.0221428573, -1.01808169e-07, 0.999754846)
    end
})

Page4 = UI.New({
    Title = "House TPs"
})

Page4.Button({
    Text = "House1",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1345.2157, 6.16867065, -959.60376, -0.988843799, -5.14304546e-08, -0.14895606, -3.96973903e-08, 1, -8.17418098e-08, 0.14895606, -7.49167128e-08, -0.988843799)
    end
})

Page4.Button({
    Text = "House2",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(20.2735596, -8.03193188, -1724.85181, 0.00375941279, -4.42261872e-08, -0.999992907, -2.97376368e-09, 1, -4.42376802e-08, 0.999992907, 3.14005022e-09, 0.00375941279)
    end
})

Page4.Button({
    Text = "House3",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-562.41748, -8.04192638, -1912.91663, 0.999895632, -2.33367481e-09, -0.0144476183, 2.26898966e-09, 1, -4.49361082e-09, 0.0144476183, 4.46036008e-09, 0.999895632)
    end
})

Page5 = UI.New({
    Title = "ATM TPs"
})

Page5.Button({
    Text = "Powerplant",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(808.821411, 3.69800401, 376.764954, -0.0107001793, -6.59981092e-09, -0.99994278, 3.52250096e-09, 1, -6.63788224e-09, 0.99994278, -3.59332586e-09, -0.0107001793)
    end
})

Page5.Button({
    Text = "Bank",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1019.08972, 23.8776245, 442.902283, -0.99819988, 9.96921514e-08, 0.0599751808, 1.00258525e-07, 1, 6.43422293e-09, -0.0599751808, 1.24356632e-08, -0.99819988)
    end
})

Page5.Button({
    Text = "Parking garage",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-373.105591, 23.7479877, 152.583603, -0.0158527065, -4.3452669e-08, -0.999874353, -5.82242805e-08, 1, -4.25350031e-08, 0.999874353, 5.75426711e-08, -0.0158527065)
    end
})

Page5.Button({
    Text = "Jewelry",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-585.336914, 23.6479855, -408.789124, 0.998680651, 3.84766663e-09, -0.0513517149, -9.62436264e-09, 1, -1.12245495e-07, 0.0513517149, 1.12591628e-07, 0.998680651)
    end
})

Page5.Button({
    Text = "Gas station near farm",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(652.339661, 3.69800282, -1534.30127, -0.999003351, 7.14906818e-08, -0.044635497, 6.94132041e-08, 1, 4.80931313e-08, 0.044635497, 4.49469049e-08, -0.999003351)
    end
})

Page5.Button({
    Text = "Store near police station",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1000.71558, 3.69800305, -24.8078213, -0.996830046, -1.13918475e-09, -0.079560563, -1.27171029e-09, 1, 1.61504954e-09, 0.079560563, 1.71110781e-09, -0.996830046)
    end
})

Page6 = UI.New({
    Title = "Vehicle TPs"
})

Page6.Button({
    Text = "Spawn",
    Callback = function()
        local myCar2 = getCar()
        if not plr.Character.Humanoid.Sit then
            game.StarterGui:SetCore("SendNotification", {Title = "Error!", Text = "You have to be sitting in your vehicle.", Duration = "1"})
        else
        myCar2:SetPrimaryPartCFrame(CFrame.new(-499.793732, 23.346302, 646.076233, 0.0240327157, -2.13943174e-08, 0.999711156, -7.97747859e-08, 1, 2.33182575e-08, -0.999711156, -8.0312148e-08, 0.0240327157))
        end
    end
})

Page6.Button({
    Text = "Mod Shop",
    Callback = function()
        local myCar2 = getCar()
        if not plr.Character.Humanoid.Sit then
            game.StarterGui:SetCore("SendNotification", {Title = "Error!", Text = "You have to be sitting in your vehicle.", Duration = "1"})
        else
        myCar2:SetPrimaryPartCFrame(CFrame.new(-722.543945, 23.346302, 202.03717, 0.999967635, -2.16230625e-08, -0.00804909132, 2.13911235e-08, 1, -2.89015478e-08, 0.00804909132, 2.8728433e-08, 0.999967635))
        end
    end
})


Page6.Button({
    Text = "Gas station near spawn",
    Callback = function()
        local myCar2 = getCar()
        if not plr.Character.Humanoid.Sit then
            game.StarterGui:SetCore("SendNotification", {Title = "Error!", Text = "You have to be sitting in your vehicle.", Duration = "1"})
        else
        myCar2:SetPrimaryPartCFrame(CFrame.new(-994.512512, 25.2500381, 592.592651, -0.0821993276, -2.76264733e-10, 0.996615887, 1.34216394e-09, 1, 3.87902405e-10, -0.996615887, 1.36950717e-09, -0.0821993276))
        end
    end
})


Page6.Button({
    Text = "Bank Front",
    Callback = function()
        local myCar2 = getCar()
        if not plr.Character.Humanoid.Sit then
            game.StarterGui:SetCore("SendNotification", {Title = "Error!", Text = "You have to be sitting in your vehicle.", Duration = "1"})
        else
        myCar2:SetPrimaryPartCFrame(CFrame.new(-984.304382, 23.3461552, 427.402252, 0.0279753394, 2.38665798e-08, -0.999608636, 7.64354269e-08, 1, 2.60150692e-08, 0.999608636, -7.71332935e-08, 0.0279753394))
        end
    end
})

Page6.Button({
    Text = "Bank Back",
    Callback = function()
        local myCar2 = getCar()
        if not plr.Character.Humanoid.Sit then
            game.StarterGui:SetCore("SendNotification", {Title = "Error!", Text = "You have to be sitting in your vehicle.", Duration = "1"})
        else
        myCar2:SetPrimaryPartCFrame(CFrame.new(-1134.17249, 23.3459644, 439.300964, 0.0132628586, 6.05588113e-08, 0.999912024, 9.79809514e-08, 1, -6.18637586e-08, -0.999912024, 9.87928246e-08, 0.0132628586))
        end
    end
})

Page6.Button({
    Text = "Gun Store",
    Callback = function()
        local myCar2 = getCar()
        if not plr.Character.Humanoid.Sit then
            game.StarterGui:SetCore("SendNotification", {Title = "Error!", Text = "You have to be sitting in your vehicle.", Duration = "1"})
        else
        myCar2:SetPrimaryPartCFrame(CFrame.new(-1230.08545, 23.346302, -163.792191, 0.0179780833, 5.38637899e-08, 0.999838352, 6.87578563e-08, 1, -5.51088313e-08, -0.999838352, 6.97374887e-08, 0.0179780833))
        end
    end
})

Page6.Button({
    Text = "Tool Store",
    Callback = function()
        local myCar2 = getCar()
        if not plr.Character.Humanoid.Sit then
            game.StarterGui:SetCore("SendNotification", {Title = "Error!", Text = "You have to be sitting in your vehicle.", Duration = "1"})
        else
        myCar2:SetPrimaryPartCFrame(CFrame.new(-439.98175, 23.3463306, -744.496887, 0.85892576, 1.81594722e-11, 0.51210016, 9.98659315e-12, 1, -5.22109092e-11, -0.51210016, 4.9959429e-11, 0.85892576))
        end
    end
})

Page6.Button({
    Text = "Jewelry Store",
    Callback = function()
        local myCar2 = getCar()
        if not plr.Character.Humanoid.Sit then
            game.StarterGui:SetCore("SendNotification", {Title = "Error!", Text = "You have to be sitting in your vehicle.", Duration = "1"})
        else
        myCar2:SetPrimaryPartCFrame(CFrame.new(-469.82489, 23.3463039, -396.164398, -0.999713302, -8.46743902e-08, 0.0239447039, -8.4821167e-08, 1, -5.11440845e-09, -0.0239447039, -7.14396009e-09, -0.999713302))
        end
    end
})

Page6.Button({
    Text = "Three Guys Fast Food",
    Callback = function()
        local myCar2 = getCar()
        if not plr.Character.Humanoid.Sit then
            game.StarterGui:SetCore("SendNotification", {Title = "Error!", Text = "You have to be sitting in your vehicle.", Duration = "1"})
        else
        myCar2:SetPrimaryPartCFrame(CFrame.new(-296.893372, 23.3461552, -147.990616, 0.000735223584, 7.74243158e-09, 0.999999702, 8.99684682e-09, 1, -7.74904851e-09, -0.999999702, 9.00254182e-09, 0.000735223584))
        end
    end
})

Page6.Button({
    Text = "Parking Garage",
    Callback = function()
        local myCar2 = getCar()
        if not plr.Character.Humanoid.Sit then
            game.StarterGui:SetCore("SendNotification", {Title = "Error!", Text = "You have to be sitting in your vehicle.", Duration = "1"})
        else
        myCar2:SetPrimaryPartCFrame(CFrame.new(-312.983917, 24.0463142, 172.85051, 0.999156356, -9.02443398e-10, 0.0410676077, 9.16176635e-10, 1, -3.15584503e-10, -0.0410676077, 3.52943452e-10, 0.999156356))
        end
    end
})

Page6.Button({
    Text = "Sheriff's Office",
    Callback = function()
        local myCar2 = getCar()
        if not plr.Character.Humanoid.Sit then
            game.StarterGui:SetCore("SendNotification", {Title = "Error!", Text = "You have to be sitting in your vehicle.", Duration = "1"})
        else
        myCar2:SetPrimaryPartCFrame(CFrame.new(-796.988892, 24.146307, -724.337585, -0.887741268, 1.48302326e-09, -0.460342765, 5.41287015e-09, 1, -7.2168076e-09, 0.460342765, -8.8984331e-09, -0.887741268))
        end
    end
})

Page6.Button({
    Text = "Gas Station near farm",
    Callback = function()
        local myCar2 = getCar()
        if not plr.Character.Humanoid.Sit then
            game.StarterGui:SetCore("SendNotification", {Title = "Error!", Text = "You have to be sitting in your vehicle.", Duration = "1"})
        else
        myCar2:SetPrimaryPartCFrame(CFrame.new(680.023438, 3.29636931, -1583.66467, -0.00861680042, -7.14260153e-08, -0.999962866, 6.71863418e-08, 1, -7.2007623e-08, 0.999962866, -6.78043222e-08, -0.00861680042))
        end
    end
})

Page6.Button({
    Text = "Hospital Front",
    Callback = function()
        local myCar2 = getCar()
        if not plr.Character.Humanoid.Sit then
            game.StarterGui:SetCore("SendNotification", {Title = "Error!", Text = "You have to be sitting in your vehicle.", Duration = "1"})
        else
        myCar2:SetPrimaryPartCFrame(CFrame.new(-149.589813, 23.346302, -397.513153, -0.999613285, 9.94091032e-09, -0.0278069936, 8.20658208e-09, 1, 6.24843466e-08, 0.0278069936, 6.22319831e-08, -0.999613285))
        end
    end
})

Page6.Button({
    Text = "Hospital Back",
    Callback = function()
        local myCar2 = getCar()
        if not plr.Character.Humanoid.Sit then
            game.StarterGui:SetCore("SendNotification", {Title = "Error!", Text = "You have to be sitting in your vehicle.", Duration = "1"})
        else
        myCar2:SetPrimaryPartCFrame(CFrame.new(-145.46608, 23.346302, -547.786499, 0.00323849241, -6.62729889e-08, -0.999994755, -1.0675925e-08, 1, -6.6307912e-08, 0.999994755, 1.08906075e-08, 0.00323849241))
        end
    end
})

Page7 = UI.New({
    Title = "Gun stuff"
})

Page7.Button({
    Text = "Get AK47",
    Callback = function()
        local oldCFrame = plr.Character.HumanoidRootPart.CFrame

        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1224.33704, 24.3363152, -189.352951, 0.044172693, -3.93946351e-08, -0.999023914, -7.63749028e-08, 1, -4.28101075e-08, 0.999023914, 7.81913911e-08, 0.044172693)
        wait(0.2)
    game:GetService("ReplicatedStorage").FE.BuyGun:InvokeServer("AK47")
    game:GetService("ReplicatedStorage").FE.EquipGun:InvokeServer("AK47", true)
    plr.Character.HumanoidRootPart.CFrame = oldCFrame
    end
})

Page7.Button({
    Text = "Get Beretta M9",
    Callback = function()
        local oldCFrame = plr.Character.HumanoidRootPart.CFrame

        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1224.33704, 24.3363152, -189.352951, 0.044172693, -3.93946351e-08, -0.999023914, -7.63749028e-08, 1, -4.28101075e-08, 0.999023914, 7.81913911e-08, 0.044172693)
        wait(0.2)
    game:GetService("ReplicatedStorage").FE.BuyGun:InvokeServer("Beretta M9")
    game:GetService("ReplicatedStorage").FE.EquipGun:InvokeServer("Beretta M9", true)
    plr.Character.HumanoidRootPart.CFrame = oldCFrame
    end
})

Page7.Button({
    Text = "Get M14",
    Callback = function()
        local oldCFrame = plr.Character.HumanoidRootPart.CFrame

        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1224.33704, 24.3363152, -189.352951, 0.044172693, -3.93946351e-08, -0.999023914, -7.63749028e-08, 1, -4.28101075e-08, 0.999023914, 7.81913911e-08, 0.044172693)
        wait(0.2)
    game:GetService("ReplicatedStorage").FE.BuyGun:InvokeServer("M14")
    game:GetService("ReplicatedStorage").FE.EquipGun:InvokeServer("M14", true)
    plr.Character.HumanoidRootPart.CFrame = oldCFrame
    end
})

Page7.Button({
    Text = "Get Colt M1911",
    Callback = function()
        local oldCFrame = plr.Character.HumanoidRootPart.CFrame

        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1224.33704, 24.3363152, -189.352951, 0.044172693, -3.93946351e-08, -0.999023914, -7.63749028e-08, 1, -4.28101075e-08, 0.999023914, 7.81913911e-08, 0.044172693)
        wait(0.2)
    game:GetService("ReplicatedStorage").FE.BuyGun:InvokeServer("Colt M1911")
    game:GetService("ReplicatedStorage").FE.EquipGun:InvokeServer("Colt M1911", true)
    plr.Character.HumanoidRootPart.CFrame = oldCFrame
    end
})

Page7.Button({
    Text = "Get Remington 870",
    Callback = function()
        local oldCFrame = plr.Character.HumanoidRootPart.CFrame

        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1224.33704, 24.3363152, -189.352951, 0.044172693, -3.93946351e-08, -0.999023914, -7.63749028e-08, 1, -4.28101075e-08, 0.999023914, 7.81913911e-08, 0.044172693)
        wait(0.2)
    game:GetService("ReplicatedStorage").FE.BuyGun:InvokeServer("Remington 870")
    game:GetService("ReplicatedStorage").FE.EquipGun:InvokeServer("Remington 870", true)
    plr.Character.HumanoidRootPart.CFrame = oldCFrame
    end
})

Page7.Button({
    Text = "Get Skorpion",
    Callback = function()
        local oldCFrame = plr.Character.HumanoidRootPart.CFrame

        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1224.33704, 24.3363152, -189.352951, 0.044172693, -3.93946351e-08, -0.999023914, -7.63749028e-08, 1, -4.28101075e-08, 0.999023914, 7.81913911e-08, 0.044172693)
        wait(0.2)
    game:GetService("ReplicatedStorage").FE.BuyGun:InvokeServer("Skorpion")
    game:GetService("ReplicatedStorage").FE.EquipGun:InvokeServer("Skorpion", true)
    plr.Character.HumanoidRootPart.CFrame = oldCFrame
    end
})

Page7.Button({
    Text = "Get Ammo Box",
    Callback = function()
    local oldCFrame = plr.Character.HumanoidRootPart.CFrame

        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1224.33704, 24.3363152, -189.352951, 0.044172693, -3.93946351e-08, -0.999023914, -7.63749028e-08, 1, -4.28101075e-08, 0.999023914, 7.81913911e-08, 0.044172693)
        wait(0.2)
        game:GetService("ReplicatedStorage").FE.BuyGear:InvokeServer("Ammo Box")
    plr.Character.HumanoidRootPart.CFrame = oldCFrame
    end
})

Page7.Button({
    Text = "Refill AK Ammo",
    Callback = function()
        local oldCFrame = plr.Character.HumanoidRootPart.CFrame

        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1224.47778, 24.336319, -189.791107, -0.403265417, -1.47201238e-08, -0.915083051, -7.8374164e-08, 1, 1.84523863e-08, 0.915083051, 7.91600741e-08, -0.403265417)
        wait()
        game:GetService("ReplicatedStorage").FE.BuyAmmo:InvokeServer("AK47")
        game:GetService("ReplicatedStorage").FE.BuyAmmo:InvokeServer("AK47")
        game:GetService("ReplicatedStorage").FE.BuyAmmo:InvokeServer("AK47")
        game:GetService("ReplicatedStorage").FE.BuyAmmo:InvokeServer("AK47")
        game:GetService("ReplicatedStorage").FE.BuyAmmo:InvokeServer("AK47")
        game:GetService("ReplicatedStorage").FE.BuyAmmo:InvokeServer("AK47")
        game:GetService("ReplicatedStorage").FE.BuyAmmo:InvokeServer("AK47")
        plr.Character.HumanoidRootPart.CFrame = oldCFrame
    end
})

Page7.Button({
    Text = "Refill Berreta M9 Ammo",
    Callback = function()
        local oldCFrame = plr.Character.HumanoidRootPart.CFrame

        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1224.47778, 24.336319, -189.791107, -0.403265417, -1.47201238e-08, -0.915083051, -7.8374164e-08, 1, 1.84523863e-08, 0.915083051, 7.91600741e-08, -0.403265417)
        wait()
        game:GetService("ReplicatedStorage").FE.BuyAmmo:InvokeServer("Berreta M9")
        game:GetService("ReplicatedStorage").FE.BuyAmmo:InvokeServer("Berreta M9")
        game:GetService("ReplicatedStorage").FE.BuyAmmo:InvokeServer("Berreta M9")
        game:GetService("ReplicatedStorage").FE.BuyAmmo:InvokeServer("Berreta M9")
        game:GetService("ReplicatedStorage").FE.BuyAmmo:InvokeServer("Berreta M9")
        game:GetService("ReplicatedStorage").FE.BuyAmmo:InvokeServer("Berreta M9")
        game:GetService("ReplicatedStorage").FE.BuyAmmo:InvokeServer("Berreta M9")
        plr.Character.HumanoidRootPart.CFrame = oldCFrame
    end
})

Page7.Button({
    Text = "Refill M14 Ammo",
    Callback = function()
        local oldCFrame = plr.Character.HumanoidRootPart.CFrame

        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1224.47778, 24.336319, -189.791107, -0.403265417, -1.47201238e-08, -0.915083051, -7.8374164e-08, 1, 1.84523863e-08, 0.915083051, 7.91600741e-08, -0.403265417)
        wait()
        game:GetService("ReplicatedStorage").FE.BuyAmmo:InvokeServer("M14")
        game:GetService("ReplicatedStorage").FE.BuyAmmo:InvokeServer("M14")
        game:GetService("ReplicatedStorage").FE.BuyAmmo:InvokeServer("M14")
        game:GetService("ReplicatedStorage").FE.BuyAmmo:InvokeServer("M14")
        game:GetService("ReplicatedStorage").FE.BuyAmmo:InvokeServer("M14")
        game:GetService("ReplicatedStorage").FE.BuyAmmo:InvokeServer("M14")
        game:GetService("ReplicatedStorage").FE.BuyAmmo:InvokeServer("M14")
        plr.Character.HumanoidRootPart.CFrame = oldCFrame
    end
})

Page7.Button({
    Text = "Refill Colt M1911 Ammo",
    Callback = function()
        local oldCFrame = plr.Character.HumanoidRootPart.CFrame

        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1224.47778, 24.336319, -189.791107, -0.403265417, -1.47201238e-08, -0.915083051, -7.8374164e-08, 1, 1.84523863e-08, 0.915083051, 7.91600741e-08, -0.403265417)
        wait()
        game:GetService("ReplicatedStorage").FE.BuyAmmo:InvokeServer("Colt M1911")
        game:GetService("ReplicatedStorage").FE.BuyAmmo:InvokeServer("Colt M1911")
        game:GetService("ReplicatedStorage").FE.BuyAmmo:InvokeServer("Colt M1911")
        game:GetService("ReplicatedStorage").FE.BuyAmmo:InvokeServer("Colt M1911")
        game:GetService("ReplicatedStorage").FE.BuyAmmo:InvokeServer("Colt M1911")
        game:GetService("ReplicatedStorage").FE.BuyAmmo:InvokeServer("Colt M1911")
        game:GetService("ReplicatedStorage").FE.BuyAmmo:InvokeServer("Colt M1911")
        plr.Character.HumanoidRootPart.CFrame = oldCFrame
    end
})

Page7.Button({
    Text = "Refill Remington 870 Ammo",
    Callback = function()
        local oldCFrame = plr.Character.HumanoidRootPart.CFrame

        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1224.47778, 24.336319, -189.791107, -0.403265417, -1.47201238e-08, -0.915083051, -7.8374164e-08, 1, 1.84523863e-08, 0.915083051, 7.91600741e-08, -0.403265417)
        wait()
        game:GetService("ReplicatedStorage").FE.BuyAmmo:InvokeServer("Remington 870")
        game:GetService("ReplicatedStorage").FE.BuyAmmo:InvokeServer("Remington 870")
        game:GetService("ReplicatedStorage").FE.BuyAmmo:InvokeServer("Remington 870")
        game:GetService("ReplicatedStorage").FE.BuyAmmo:InvokeServer("Remington 870")
        game:GetService("ReplicatedStorage").FE.BuyAmmo:InvokeServer("Remington 870")
        game:GetService("ReplicatedStorage").FE.BuyAmmo:InvokeServer("Remington 870")
        game:GetService("ReplicatedStorage").FE.BuyAmmo:InvokeServer("Remington 870")
        plr.Character.HumanoidRootPart.CFrame = oldCFrame
    end
})

Page7.Button({
    Text = "Refill Skorpion Ammo",
    Callback = function()
        local oldCFrame = plr.Character.HumanoidRootPart.CFrame

        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1224.47778, 24.336319, -189.791107, -0.403265417, -1.47201238e-08, -0.915083051, -7.8374164e-08, 1, 1.84523863e-08, 0.915083051, 7.91600741e-08, -0.403265417)
        wait()
        game:GetService("ReplicatedStorage").FE.BuyAmmo:InvokeServer("Skorpion")
        game:GetService("ReplicatedStorage").FE.BuyAmmo:InvokeServer("Skorpion")
        game:GetService("ReplicatedStorage").FE.BuyAmmo:InvokeServer("Skorpion")
        game:GetService("ReplicatedStorage").FE.BuyAmmo:InvokeServer("Skorpion")
        game:GetService("ReplicatedStorage").FE.BuyAmmo:InvokeServer("Skorpion")
        game:GetService("ReplicatedStorage").FE.BuyAmmo:InvokeServer("Skorpion")
        game:GetService("ReplicatedStorage").FE.BuyAmmo:InvokeServer("Skorpion")
        plr.Character.HumanoidRootPart.CFrame = oldCFrame
    end
})

Page8 = UI.New({
    Title = "Police"
})

Page8.Button({
    Text = "Refill ammo",
    Callback = function()
        local oldCFrame = plr.Character.HumanoidRootPart.CFrame
        if plr.Team.Name == "Police" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(756.477356, 3.91197157, -61.0970573, 0.189580366, 5.30558104e-08, 0.981865227, -1.09343659e-07, 1, -3.29234595e-08, -0.981865227, -1.01119092e-07, 0.189580366)
        wait(1)
        keypress(0x45)
        wait()
        keyrelease(0x45)
        wait()
        plr.Character.HumanoidRootPart.CFrame = oldCFrame
        else
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-888.770691, 24.811985, -772.799622, -0.331657887, -6.72007561e-09, 0.943399727, 5.24043493e-08, 1, 2.55463206e-08, -0.943399727, 5.79108885e-08, -0.331657887)
            wait(1)
            keypress(0x45)
            wait()
            keyrelease(0x45)
            wait()
            plr.Character.HumanoidRootPart.CFrame = oldCFrame
        end
    end
})

Page9 = UI.New({
    Title = "Dev Stuff"
})

Page9.Button({
    Text = "Copy CFrame teleport script",
    Callback = function()
        local playerCFrame = "game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = " .. "CFrame.new(" .. tostring(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame) .. ")"
	    setclipboard(playerCFrame)
    end
})

Page9.Button({
    Text = "Copy CFrame",
    Callback = function()
        local copyCFrame = tostring(plr.Character.HumanoidRootPart.CFrame)
        setclipboard(copyCFrame)
    end
})

Page9.Button({
    Text = "Start House Timer",
    Callback = function()
        for count = 0, 370, 1 do
            wait(1)
            if count == 370 then
            Notification.Notify("Notice!", "House is robbable again!", "rbxassetid://4914902889");
            end
        end
    end
})

Page9.Button({
    Text = "Start ATM Timer",
    Callback = function()
        for count = 0, 370, 1 do
            wait(1)
            if count == 370 then
            Notification.Notify("Notice!", "ATM is robbable again!", "rbxassetid://4914902889");
            end
        end
    end
})

Page9.Button({
    Text = "Start Bank Timer",
    Callback = function()
        for count = 0, 390, 1 do
            wait(1)
            if count == 390 then
            Notification.Notify("Notice!", "Bank is robbable again!", "rbxassetid://4914902889");
            end
        end
    end
})

wait(2)
spawn(function()
    Notification.Notify("Welcome!", "I have automatically created a Mafia for you :)", "rbxassetid://4914902889");
end)

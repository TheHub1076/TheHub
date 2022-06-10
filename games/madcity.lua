local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/TheHub1076/TheHub/main/Wally%20V3.lua')))()

local main = library:CreateWindow("Madcity")

local scripts = main:CreateFolder("Scripts")



-- SCRIPTS

scripts:Button("Mad Lads",function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/JK-Hub-1076/Mad-lads/main/main"))()
end)

scripts:Button("Mad City script",function()
       loadstring(game:HttpGet('https://raw.githubusercontent.com/JK-Hub-1076/Madcity-script1/main/main'))()
end)

scripts:Button("Weinz",function()
       loadstring(game:HttpGet('https://raw.githubusercontent.com/weiny-ez/w-main/main/loader.lua'))()
end)

scripts:Button("XP auto farm",function()
       game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer("SetTeam", "Police")
wait(.75)
game:GetService("RunService").RenderStepped:Connect(function()
for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
   if v.Name == "Handcuffs" then v.Parent = game:GetService("Players").LocalPlayer.Character
   end
end
game:GetService("ReplicatedStorage").Event:FireServer("Eject", game:GetService("Players").LocalPlayer)
end)
end)

scripts:Button("Money auto farm",function()
       loadstring(game:HttpGet('https://www.system-exodus.com/scripts/madcity/MadLadsAR.lua'))()
end)



-- END

scripts:Label("",{
       TextSize = 25;
       TextColor = Color3.fromRGB(255,255,255);
       BgColor = Color3.fromRGB(38,38,38);
       
})

scripts:DestroyGui()

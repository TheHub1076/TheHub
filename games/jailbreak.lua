local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/TheHub1076/TheHub/main/Wally%20V3.lua')))()

local main = library:CreateWindow("Jailbreak")

local scripts = main:CreateFolder("Scripts")



-- SCRIPTS

scripts:Button("Vynixius",function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Vynixius/main/Jailbreak/Script.lua"))()
end)

scripts:Button("Evo V2",function()
    loadstring(game:HttpGet("https://projectevo.xyz/script/loader.lua"))()
end)

scripts:Button("Autofarm",function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/wawsdasdacx/ohascriptnrrewading/main/jbsaxcriptidk1"))();
end)



-- END

scripts:Label("",{
       TextSize = 25;
       TextColor = Color3.fromRGB(255,255,255);
       BgColor = Color3.fromRGB(38,38,38);
       
})

scripts:DestroyGui()

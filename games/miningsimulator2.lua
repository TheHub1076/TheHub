local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/TheHub1076/TheHub/main/Wally%20V3.lua')))()

local main = library:CreateWindow("Mining Simulator 2")

local scripts = main:CreateFolder("Scripts")



-- SCRIPTS

scripts:Button("Mining Simulator 2 GUI",function()
    loadstring(game:HttpGet'https://github.com/RunDTM/miningsim2/raw/main/script.lua')()
end)

scripts:Button("Extreme Hub (KEY)",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ExtremeAntonis/KeySystemUI/main/KeySystemUI-Obfuscated.lua"))()
end)


-- END

scripts:Label("",{
       TextSize = 25;
       TextColor = Color3.fromRGB(255,255,255);
       BgColor = Color3.fromRGB(38,38,38);
       
})

scripts:DestroyGui()
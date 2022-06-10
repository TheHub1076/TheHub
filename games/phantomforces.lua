local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/TheHub1076/TheHub/main/Wally%20V3.lua')))()

local main = library:CreateWindow("Phantom Forces")

local scripts = main:CreateFolder("Scripts")



-- SCRIPTS

scripts:Button("Ceri | Legit Cheat",function()
    loadstring(game:HttpGet("https://ducksite.xyz/ceri/main.lua"))()
end)

scripts:Button("Solaris 3.0",function()
    loadstring(game:HttpGet('https://solarishub.net/script.lua',true))()
end)



-- END

scripts:Label("",{
       TextSize = 25;
       TextColor = Color3.fromRGB(255,255,255);
       BgColor = Color3.fromRGB(38,38,38);
       
})

scripts:DestroyGui()

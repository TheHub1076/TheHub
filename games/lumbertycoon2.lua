local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/TheHub1076/TheHub/main/Wally%20V3.lua')))()

local main = library:CreateWindow("Lumber Tycoon 2")

local scripts = main:CreateFolder("Scripts")



-- SCRIPTS

scripts:Button("Ancestor V2",function()
       loadstring(game:HttpGetAsync'https://ataias.xyz/ancestor/script.lua')()
end)



-- END

scripts:Label("",{
       TextSize = 25;
       TextColor = Color3.fromRGB(255,255,255);
       BgColor = Color3.fromRGB(38,38,38);
       
})

scripts:DestroyGui()

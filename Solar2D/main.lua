display.setDefault("magTextureFilter", "nearest")
display.setDefault("minTextureFilter", "nearest")

local swordsman = require("module.character.swordsman")

-- ✅ Affiche Idle dès le début
swordsman.Idle()

-- Fonction pour gérer les touches clavier
local function onKeyEvent(event)
    if event.phase == "down" then
        if event.keyName == "z" then
            swordsman.Atk1()
        elseif event.keyName == "x" then
            swordsman.Atk2()
        elseif event.keyName == "r" then
            swordsman.AtkS()
        elseif event.keyName == "a" then
            swordsman.AA()
        end
    end
    return false  
end

Runtime:addEventListener("key", onKeyEvent)

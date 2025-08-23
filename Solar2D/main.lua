display.setDefault("magTextureFilter", "nearest")
display.setDefault("minTextureFilter", "nearest")

local swordsman = require("module.character.swordsman")
local compteur = require("module.compteur")

swordsman.Idle()

compteur.start(function()
    if swordsman.canAnimate() then
        swordsman.AA()
    end
end)

local function onKeyEvent(event)
    if event.phase == "down" then
        if event.keyName == "z" then
            swordsman.Atk1()
        elseif event.keyName == "e" then
            swordsman.Atk2()
        elseif event.keyName == "r" then
            swordsman.AtkS()
        end
    end
    return false
end

Runtime:addEventListener("key", onKeyEvent)

display.setDefault("magTextureFilter", "nearest")
display.setDefault("minTextureFilter", "nearest")

local swordsman = require("module.character.swordsman")
local skeleton = require("module.character.skeleton")
local compteur = require("module.compteur")
local lifebar = require("module.lifebar")
local background = require("module.asset.background")

-- position player controller
swordsman.posX = display.contentWidth * 0.25
swordsman.posY = 470
-- Création de la barre de vie
lifebar.create()
lifebar.update(swordsman.life)


swordsman.Idle()

-- compteur de AA
compteur.compteurX = 150
compteur.compteurY = 70

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

-- position ennemi

-- position player controller
skeleton.posX = display.contentWidth * 0.75
skeleton.posY = 470

skeleton.Idle()


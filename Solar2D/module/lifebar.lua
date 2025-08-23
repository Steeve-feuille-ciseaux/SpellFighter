local lifebar = {}

-- Variables internes
local barGroup
local barBackground
local barFill

-- Paramètres
local maxLife = 300
local barWidth = 300
local barHeight = 30
local barX = 50
local barY = 30

function lifebar.create()
    barGroup = display.newGroup()

    -- Arrière-plan de la barre
    barBackground = display.newRect(barGroup, barX, barY, barWidth, barHeight)
    barBackground.anchorX = 0
    barBackground:setFillColor(0.2, 0.2, 0.2) -- gris foncé

    -- Remplissage (vie actuelle)
    barFill = display.newRect(barGroup, barX, barY, barWidth, barHeight)
    barFill.anchorX = 0
    barFill:setFillColor(0, 0.5, 0) -- vert

    return barGroup
end

function lifebar.update(currentLife)
    if not barFill then return end

    local ratio = math.max(currentLife / maxLife, 0)
    barFill.width = barWidth * ratio
end

function lifebar.damage(amount)
    local swordsman = require("module.character.swordsman")
    swordsman.life = math.max(swordsman.life - amount, 0)
    lifebar.update(swordsman.life)
end

return lifebar

-- module/compteur.lua

local compteur = {}

-- Position par défaut
compteur.compteurX = display.contentCenterX
compteur.compteurY = 90

local countdownText
local countdown = 3.0
local interval = 3.0
local timerRef
local callbackWhenZero

-- Visuels
local barBackground
local barFill
local barWidth = 200
local barHeight = 20

function compteur.start(callback)
    callbackWhenZero = callback

    -- Barre de fond (grise)
    barBackground = display.newRect(compteur.compteurX, compteur.compteurY, barWidth, barHeight)
    barBackground:setFillColor(0.3, 0.3, 0.3)

    -- Barre de remplissage (verte)
    barFill = display.newRect(barBackground.x - barWidth / 2, compteur.compteurY, 0, barHeight)
    barFill.anchorX = 0
    barFill:setFillColor(0, 0.5, 0)

    -- Texte
    countdownText = display.newText({
        text = "AA dans : " .. string.format("%.1f", countdown) .. "s",
        x = compteur.compteurX,
        y = compteur.compteurY,
        font = native.systemFontBold,
        fontSize = 18
    })

    -- Timer de progression
    timerRef = timer.performWithDelay(100, function()
        countdown = countdown - 0.1

        local progress = math.min((interval - countdown) / interval, 1)
        barFill.width = barWidth * progress

        if countdownText then
            if countdown <= 0 then
                countdownText.text = "AA"
            else
                countdownText.text = string.format("%.1f", countdown) .. "s"
            end
        end

        if countdown <= 0 then
            countdown = 0
            if callbackWhenZero then
                callbackWhenZero()
            end
        end
    end, 0)
end

function compteur.reset()
    countdown = interval
end

function compteur.restart()
    countdown = interval
end

return compteur

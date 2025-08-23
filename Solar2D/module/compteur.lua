-- module/compteur.lua

local compteur = {}

local countdownText
local countdown = 3.0
local interval = 3.0
local timerRef
local callbackWhenZero

-- Fonction d'initialisation du compteur
function compteur.start(callback)
    callbackWhenZero = callback

    countdownText = display.newText({
        text = "AA dans : " .. string.format("%.1f", countdown) .. "s",
        x = display.contentCenterX,
        y = 50,
        font = native.systemFontBold,
        fontSize = 24
    })

    -- Timer qui décrémente toutes les 0.1 seconde
    timerRef = timer.performWithDelay(100, function()
        countdown = countdown - 0.1

        if countdown <= 0 then
            countdown = 0
            if callbackWhenZero then
                callbackWhenZero()
            end
            countdown = interval
        end

        if countdownText then
            countdownText.text = "AA dans : " .. string.format("%.1f", countdown) .. "s"
        end
    end, 0)
end

-- Permet de reset le compteur à 3.0
function compteur.reset()
    countdown = interval
end

return compteur

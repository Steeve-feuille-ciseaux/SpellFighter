local anime = require("module.anime")
local compteur = require("module.compteur")

local swordsman = {}
local currentAnimation = nil
local isAnimating = false  -- bloque interruption quand true

local function clearAnimation()
    if currentAnimation then
        for i = 1, #currentAnimation do
            if currentAnimation[i] and currentAnimation[i].removeSelf then
                currentAnimation[i]:removeSelf()
            end
        end
        currentAnimation = nil
    end
end

local function playAnimation(dossier, prefix, suffix, nbImages, scale, vitesseTotale, loop, onComplete)
    clearAnimation()
    isAnimating = not loop  -- si loop = false => animation bloquante
    currentAnimation = anime.anime(
        dossier,
        prefix,
        suffix,
        nbImages,
        scale,
        vitesseTotale,
        display.contentCenterX,
        display.contentCenterY,
        loop,
        function()
            isAnimating = false
            if onComplete then
                onComplete()
            end
        end
    )
end

function swordsman.Idle()
    -- Idle peut être interrompu, donc on force isAnimating = false
    if isAnimating then return end -- Ne rien faire si une autre animation bloque
    playAnimation("sprite/swordsman/Idle/", "Idle_Swordsman", ".png", 6, 8, 600, true)
end

function swordsman.AA()
    if isAnimating then return end  
    playAnimation(
        "sprite/swordsman/AA/",
        "AA_Swordsman",
        ".png",
        7,
        8,
        600,
        false,
        function()
            swordsman.Idle()
            compteur.restart()
        end
    )
end

function swordsman.Atk1()
    if isAnimating then return end
    playAnimation("sprite/swordsman/Atk1/", "Atk1_Swordsman", ".png", 10, 8, 600, false, swordsman.Idle)
end

function swordsman.Atk2()
    if isAnimating then return end
    playAnimation("sprite/swordsman/Atk2/", "Atk2_Swordsman", ".png", 5, 8, 600, false, swordsman.Idle)
end

function swordsman.AtkS()
    if isAnimating then return end
    playAnimation("sprite/swordsman/AtkS/", "AtkS_Swordsman", ".png", 12, 8, 600, false, swordsman.Idle)
end

function swordsman.canAnimate()
    return not isAnimating
end

return swordsman

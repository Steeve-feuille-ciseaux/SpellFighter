local anime = require("module.anime")
local compteur = require("module.compteur")

-- Stat
local skeleton = {}
skeleton.life = 300

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
        skeleton.posX,
        skeleton.posY,
        loop,
        function()
            isAnimating = false
            if onComplete then
                onComplete()
            end
        end,
        true    
    )
    
end

function skeleton.Idle()
    -- Idle peut être interrompu, donc on force isAnimating = false
    if isAnimating then return end -- Ne rien faire si une autre animation bloque
    playAnimation("sprite/skeleton/Idle/", "Idle_skeleton", ".png", 6, 8, 600, true)
end

function skeleton.AA()
    if isAnimating then return end  
    playAnimation(
        "sprite/skeleton/AA/",
        "AA_skeleton",
        ".png",
        7,
        8,
        600,
        false,
        function()
            skeleton.Idle()
            compteur.restart()
        end
    )
end

function skeleton.Spell1()
    if isAnimating then return end
    playAnimation("sprite/skeleton/Spell1/", "Spell1_skeleton", ".png", 10, 8, 600, false, skeleton.Idle)
    compteur.reset()
end

function skeleton.Spell2()
    if isAnimating then return end
    playAnimation("sprite/skeleton/Spell2/", "Spell2_skeleton", ".png", 5, 8, 600, false, skeleton.Idle)
    compteur.reset()
end

function skeleton.Spell4()
    if isAnimating then return end
    playAnimation("sprite/skeleton/Spell4/", "Spell4_skeleton", ".png", 12, 8, 600, false, skeleton.Idle)
    compteur.reset()
end

function skeleton.canAnimate()
    return not isAnimating
end

return skeleton

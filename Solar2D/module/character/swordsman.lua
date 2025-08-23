local anime = require("module.anime")

local swordsman = {}
local currentAnimation = nil

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

function swordsman.Idle()
    print("🔁 Retour à Idle")
    clearAnimation()
    currentAnimation = anime.anime(
        "sprite/swordsman/Idle/",
        "Idle_Swordsman",
        ".png",
        6,
        8,
        600,
        display.contentCenterX,
        display.contentCenterY,
        true
    )
end

function swordsman.AA()
    clearAnimation()
    currentAnimation = anime.anime(
        "sprite/swordsman/AA/",
        "AA_Swordsman",
        ".png",
        7,
        8,
        600,
        display.contentCenterX,
        display.contentCenterY,
        false,  -- no loop
        swordsman.Idle  -- callback à la fin
    )
end

function swordsman.Atk1()
    clearAnimation()
    currentAnimation = anime.anime(
        "sprite/swordsman/Atk1/",
        "Atk1_Swordsman",
        ".png",
        10,
        8,
        600,
        display.contentCenterX,
        display.contentCenterY,
        false,
        swordsman.Idle
    )
end

function swordsman.Atk2()
    clearAnimation()
    currentAnimation = anime.anime(
        "sprite/swordsman/Atk2/",
        "Atk2_Swordsman",
        ".png",
        5,
        8,
        600,
        display.contentCenterX,
        display.contentCenterY,
        false,
        swordsman.Idle
    )
end

function swordsman.AtkS()
    clearAnimation()
    currentAnimation = anime.anime(
        "sprite/swordsman/AtkS/",
        "AtkS_Swordsman",
        ".png",
        12,
        8,
        600,
        display.contentCenterX,
        display.contentCenterY,
        false,
        swordsman.Idle
    )
end

return swordsman

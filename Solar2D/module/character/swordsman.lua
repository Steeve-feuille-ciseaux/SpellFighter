local anime = require("module.anime")

local swordsman = {}

function swordsman.Idle()
    local Idle_Swordsman = anime.anime(
        "sprite/swordsman/Idle/",
        "Idle_Swordsman",
        ".png",
        6,
        8,
        600,
        display.contentCenterX,
        display.contentCenterY
    )
end

function swordsman.AA()
    local AA_Swordsman = anime.anime(
        "sprite/swordsman/AA/",
        "AA_Swordsman",
        ".png",
        7,
        8,
        600,
        display.contentCenterX,
        display.contentCenterY
    )
end

function swordsman.Atk1()
    local Atk1_Swordsman = anime.anime(
        "sprite/swordsman/Atk1/",
        "Atk1_Swordsman",
        ".png",
        10,
        8,
        600,
        display.contentCenterX,
        display.contentCenterY
    )
end

function swordsman.Atk2()
    local Atk2_Swordsman = anime.anime(
        "sprite/swordsman/Atk2/",
        "Atk2_Swordsman",
        ".png",
        5,
        8,
        600,
        display.contentCenterX,
        display.contentCenterY
    )
end

function swordsman.AtkS()
    local AtkS_Swordsman = anime.anime(
        "sprite/swordsman/AtkS/",
        "AtkS_Swordsman",
        ".png",
        12,
        8,
        600,
        display.contentCenterX,
        display.contentCenterY
    )
end

return swordsman

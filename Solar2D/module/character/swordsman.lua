
local anime = require("module.anime") -- ou juste "anime" si le fichier est à la racine

-- Appel de l'action Idle
local Idle_Swordsman = anime.anime(
    "sprite/swordsman/Idle/",     -- dossier
    "Idle_Swordsman",             -- préfixe
    ".png",                       -- suffixe
    6,                            -- nombre d’images
    8,                            -- scale
    600,                          -- durée totale (ms)
    display.contentCenterX,       -- position X
    display.contentCenterY        -- position Y
)

-- Appeler l'action AA
local AA_Swordsman = anime.anime(
    "sprite/swordsman/AA/",     -- dossier
    "AA_Swordsman",             -- préfixe
    ".png",                       -- suffixe
    7,                            -- nombre d’images
    8,                            -- scale
    600,                          -- durée totale (ms)
    display.contentCenterX,       -- position X
    display.contentCenterY        -- position Y
)

-- Appel de l'action Atk1
local Atk1_Swordsman = anime.anime(
    "sprite/swordsman/Atk1/",     -- dossier
    "Atk1_Swordsman",             -- préfixe
    ".png",                       -- suffixe
    10,                            -- nombre d’images
    8,                            -- scale
    600,                          -- durée totale (ms)
    display.contentCenterX,       -- position X
    display.contentCenterY        -- position Y
)

-- Appel de l'action Atk2
local Atk1_Swordsman = anime.anime(
    "sprite/swordsman/Atk2/",     -- dossier
    "Atk2_Swordsman",             -- préfixe
    ".png",                       -- suffixe
    5,                            -- nombre d’images
    8,                            -- scale
    600,                          -- durée totale (ms)
    display.contentCenterX,       -- position X
    display.contentCenterY        -- position Y
)

-- Appel de l'action AtkS
local AtkS_Swordsman = anime.anime(
    "sprite/swordsman/AtkS/",     -- dossier
    "AtkS_Swordsman",             -- préfixe
    ".png",                       -- suffixe
    12,                            -- nombre d’images
    8,                            -- scale
    600,                          -- durée totale (ms)
    display.contentCenterX,       -- position X
    display.contentCenterY        -- position Y
)
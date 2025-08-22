-- main.lua

display.setDefault("magTextureFilter", "nearest")
display.setDefault("minTextureFilter", "nearest")

-- Charger le module (adapter selon ton chemin)
local anime = require("module.anime") -- ou juste "anime" si le fichier est à la racine

-- Appeler l'action AA
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
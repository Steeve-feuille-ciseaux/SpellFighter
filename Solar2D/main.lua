-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Désactiver le lissage (important pour le pixel art)
display.setDefault("magTextureFilter", "nearest")
display.setDefault("minTextureFilter", "nearest")

-- Définir la couleur de fond (optionnel)
-- display.setDefault("background", 0.1, 0.1, 0.1)  -- Gris foncé

-- Charger et afficher l'image
local monImage = display.newImage("sprite/swordsman/Idle1_Swordsman.png")

-- Centrer l'image à l'écran
monImage.x = display.contentCenterX
monImage.y = display.contentCenterY

-- Doubler la taille (x2)
monImage.xScale = 8
monImage.yScale = 8

local M = {}

-- Ajouter l'image de fond
M.montage = display.newImageRect("module/asset/BG_montage.png", display.actualContentWidth, display.actualContentHeight)
M.montage.x = display.contentCenterX
M.montage.y = display.contentCenterY
M.montage:toBack()  -- Met l'image derrière tous les autres objets

return M

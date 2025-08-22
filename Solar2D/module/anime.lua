-- anime.lua

local M = {}

function M.anime(dossier, prefix, suffix, nbImages, scale, vitesseTotale, posX, posY)
    local tempsParImage = vitesseTotale / nbImages
    local frames = {}

    for i = 1, nbImages do
        local chemin = dossier .. prefix .. i .. suffix
        local img = display.newImage(chemin)

        if img then
            img.isVisible = false
            img.x = posX
            img.y = posY
            img.xScale = scale
            img.yScale = scale
            frames[#frames + 1] = img
        else
            print("❌ Image non trouvée :", chemin)
        end
    end

    local index = 1
    frames[index].isVisible = true

    timer.performWithDelay(tempsParImage, function()
        frames[index].isVisible = false
        index = index + 1
        if index > #frames then index = 1 end
        frames[index].isVisible = true
    end, 0)

    return frames
end

return M

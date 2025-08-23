-- anime.lua

local M = {}

function M.anime(dossier, prefix, suffix, nbImages, scale, vitesseTotale, posX, posY, loop, onComplete)
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

    if #frames == 0 then
        print("❌ Aucune image chargée pour l'animation :", prefix)
        return nil
    end

    local index = 1
    frames[index].isVisible = true

    local function afficherImage()
        frames[index].isVisible = false
        index = index + 1

        if index > #frames then
            if loop then
                index = 1
            else
                -- Supprimer les frames
                for i = 1, #frames do
                    if frames[i] and frames[i].removeSelf then
                        frames[i]:removeSelf()
                    end
                end
                -- ✅ Callback vers Idle
                if onComplete then
                    onComplete()
                end
                return
            end
        end

        if frames[index] then
            frames[index].isVisible = true
        end
    end

    local repeatCount = loop and 0 or #frames
    timer.performWithDelay(tempsParImage, afficherImage, repeatCount)

    return frames
end

return M

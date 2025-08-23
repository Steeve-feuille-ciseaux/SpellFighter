-- anime.lua

local M = {}

function M.anime(dossier, prefix, suffix, nbImages, scale, vitesseTotale, posX, posY, loop, onComplete, flip)
    local tempsParImage = vitesseTotale / nbImages
    local frames = {}
    local timerRef

    for i = 1, nbImages do
        local chemin = dossier .. prefix .. i .. suffix
        local img = display.newImage(chemin)

        if img then
            img.isVisible = false
            img.x = posX
            img.y = posY
            img.xScale = flip and -scale or scale
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
        if frames[index] then
            frames[index].isVisible = false
        end

        index = index + 1

        if index > #frames then
            if loop then
                index = 1
            else
                -- Nettoyage
                if timerRef then
                    timer.cancel(timerRef)
                    timerRef = nil
                end

                for i = 1, #frames do
                    if frames[i] and frames[i].removeSelf then
                        frames[i]:removeSelf()
                    end
                end

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

    local repeatCount = loop and 0 or nbImages
    timerRef = timer.performWithDelay(tempsParImage, afficherImage, repeatCount)

    return frames
end

return M

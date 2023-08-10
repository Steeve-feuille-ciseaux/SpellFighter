-- title: proto SoulFighter
-- author: libertybanshee
-- desc: game inspired by SoulFighter Mod
-- script: lua

-- Mode Debug
debug = false
debugLife = false
function initGame(pHP1,pHP2)
-- Player
spritePlayer = 2
stopSpritePlayer = false
playerX = 30
playerY = 70
talkPlayer = false
lifePlayer = pHP1
namePlayer = "Player"
damagePlayer = 0
damageSpellPlayer = 0
showDomagePlayer = {}

-- Ennemy
spriteEnnemy = 83
stopSpriteEnnemy = false
EspriteAction = 149
ennemyX = 200
ennemyY = 70
talkEnnemy = false
lifeEnnemy = pHP2
nameEnnemy = "Ennemy"
damageEnnemy = 0
damageSpellEnnemy = 0


-- timing
startTime = time()
secondeSetting = 250
seconde = 10
secondeSprite = 0
secondeEnnemy = 7

-- Seconde + CoolDown Spell
secondeSpellA = 3
secondeSpellZ = 5
secondeSpellE = 7
secondeSpellR = 15

CooldownA = true
CooldownZ = true
CooldownE = true
CooldownR = false
cooldown = true

-- Animation Sprite Spell Player
spriteAction = 69
spriteSpellA = 5
spriteSpellZ = 21
spriteSpellE = 37
spriteSpellR = 53

-- Move Player
moveLock = false
moveAA = true
moveA = false
moveZ = false
moveE = false
moveR = false

-- Move Ennemy
EmoveLock = false
EmoveAA = true
EmoveA = false
EmoveZ = false
EmoveE = false
EmoveR = false

-- Status AI
EmoveAI = 0
EmoveCycle = 0

-- Animation Sprite du Sort A
spellASprites = {5, 6, 7, 8, 9}
currentSpellASpriteIndex = 1
spellAAnimTimer = 0
spellAAnimSpeed = 200  -- Vitesse de l'animation du sort A

-- List DPS
showDamagePlayer = {}
showDamageEnnemy = {}

end

initGame(1500,1500)

function TIC()

cls()

    local currentTime = time()
    local elapsedTime = currentTime - startTime
    
    -- verification cooldown Proto
    if cooldown == false then
        elapsedTime = 0
    end

    -- Vérifier si 1 seconde (1000 millisecondes) s'est écoulée
    if elapsedTime >= secondeSetting then 
        startTime = currentTime  -- Réinitialiser le temps de départ
        seconde = seconde - 1  -- Augmenter le compteur de secondes
        secondeEnnemy = secondeEnnemy + 1
        secondeSprite = seconde + 1
        secondeSpellA = secondeSpellA - 1
        secondeSpellZ = secondeSpellZ - 1
        secondeSpellE = secondeSpellE - 1
        secondeSpellR = secondeSpellR - 1
        
        -- Anime sprite 
        if seconde ~= secondeSprite then
            -- Sprite Player
            if stopSpritePlayer == false then
                spritePlayer = spritePlayer + 1
            elseif stopSpritePlayer == true then
                spriteAction = 1
                spritePlayer = 1
                moveAA = not false
                moveA = false
                moveZ = false
                moveE = false
                moveR = false
                moveLock = true
            end
            
            if moveAA == true and
            spritePlayer == 3 then
                damageSpellPlayer = 10 
                damageEnnemy = damageEnnemy + damageSpellPlayer
                local newDamage = {
                    x = 134,
                    y = 35,
                    value = damageSpellPlayer,
                    color = 4
                }
                table.insert(showDamagePlayer, newDamage)
            elseif moveA == true and
            spritePlayer == 6 then
                damageSpellPlayer = 30 
                damageEnnemy = damageEnnemy + damageSpellPlayer
                local newDamage = {
                    x = 134,
                    y = 35,
                    value = damageSpellPlayer,
                    color = 4
                }
                table.insert(showDamagePlayer, newDamage)
            elseif moveZ == true and
            spritePlayer == 22 then
                damageSpellPlayer = 50
                damageEnnemy = damageEnnemy + damageSpellPlayer
                local newDamage = {
                    x = 134,
                    y = 35,
                    value = damageSpellPlayer,
                    color = 4
                }
                table.insert(showDamagePlayer, newDamage)
            elseif moveE == true and
            spritePlayer == 38 then
                damageSpellPlayer = 80 
                damageEnnemy = damageEnnemy + damageSpellPlayer
                local newDamage = {
                    x = 134,
                    y = 35,
                    value = damageSpellPlayer,
                    color = 4
                }
                table.insert(showDamagePlayer, newDamage)
            elseif moveR == true and
            spritePlayer == 54 then
                damageSpellPlayer = 150
                damageEnnemy = damageEnnemy + damageSpellPlayer
                local newDamage = {
                    x = 134,
                    y = 35,
                    value = damageSpellPlayer,
                    color = 4
                }
                table.insert(showDamagePlayer, newDamage)
            end
            
            if moveAA == true and 
            spritePlayer > 3 then
                spritePlayer = 2
                spriteAction = 69
                talkPlayer = false
                moveA = false
                moveZ = false
                moveE = false
                moveR = false
                
            elseif moveA == true and
            spritePlayer >= 10 then
                spritePlayer = 2
                spriteAction = 69
                talkPlayer = false
                moveLock = false
                moveAA = true
                moveA = false
                
            elseif moveZ == true and
            spritePlayer >= 26 then
                spritePlayer = 2
                spriteAction = 69
                talkPlayer = false
                moveLock = false
                moveAA = true
                moveZ = false
                
            elseif moveE == true and
            spritePlayer >= 42 then
                spritePlayer = 2
                spriteAction = 69
                talkPlayer = false
                moveLock = false
                moveAA = true
                moveE = false
                
            elseif moveR == true and
            spritePlayer >= 58 then
                spritePlayer = 2
                spriteAction = 69
                talkPlayer = false
                moveLock = false
                moveAA = true
                moveR = false
            end 
            
            -- Sprite Ennemy
            if stopSpriteEnnemy == false then
                spriteEnnemy = spriteEnnemy + 1 
            elseif stopSpriteEnnemy == true then
                secondeEnnemy = 0
                spriteEnnemy = 81
                EspriteAction = 81
                EmoveAI = 0
                EmoveAA = true
                EmoveA = false
                EmoveZ = false
                EmoveE = false
                EmoveR = false
                EmoveLock = false
            end
            
            if EmoveAA == true and
            spriteEnnemy == 83 then
                damageSpellEnnemy = 10 
                damagePlayer = damagePlayer + damageSpellEnnemy
                local newDamage = {
                    x = 96,
                    y = 35,
                    value = damageSpellEnnemy,
                    color = 4
                }
                table.insert(showDamageEnnemy, newDamage)
            elseif EmoveA == true and
            spriteEnnemy == 86 then
                damageSpellEnnemy = 30 
                damagePlayer = damagePlayer + damageSpellEnnemy
                local newDamage = {
                    x = 96,
                    y = 35,
                    value = damageSpellEnnemy,
                    color = 4
                }
                table.insert(showDamageEnnemy, newDamage)
            elseif EmoveZ == true and
            spriteEnnemy == 102 then
                damageSpellEnnemy = 50 
                damagePlayer = damagePlayer + damageSpellEnnemy
                local newDamage = {
                    x = 96,
                    y = 35,
                    value = damageSpellEnnemy,
                    color = 4
                }
                table.insert(showDamageEnnemy, newDamage)
            elseif EmoveE == true and
            spriteEnnemy == 118 then
                damageSpellEnnemy = 70 
                damagePlayer = damagePlayer + damageSpellEnnemy
                local newDamage = {
                    x = 96,
                    y = 35,
                    value = damageSpellEnnemy,
                    color = 4
                }
                table.insert(showDamageEnnemy, newDamage)
            elseif EmoveR == true and
            spriteEnnemy == 134 then
                damageSpellEnnemy = 150
                damagePlayer = damagePlayer + damageSpellEnnemy
                local newDamage = {
                    x = 90,
                    y = 35,
                    value = damageSpellEnnemy,
                    color = 4
                }
                table.insert(showDamageEnnemy, newDamage)
            end
             
            if EmoveAA == true and
            spriteEnnemy >= 84 then
                spriteEnnemy = 82
                EspriteAction = 149
                talkEnnemy = false
                EmoveA = false
                EmoveZ = false
                EmoveE = false
                EmoveR = false
                
            elseif EmoveA == true and 
            spriteEnnemy >= 90 then
                spriteEnnemy = 82
                EspriteAction = 149
                EmoveAI = 0
                talkEnnemy = false
                EmoveAA = true
                EmoveA = false
                EmoveLock = false
                
            elseif EmoveZ == true and 
            spriteEnnemy >= 106 then
                spriteEnnemy = 82
                EspriteAction = 149
                EmoveAI = 0
                talkEnnemy = false
                EmoveAA = true
                EmoveZ = false
                EmoveLock = false
                
            elseif EmoveE == true and 
            spriteEnnemy >= 122 then
                spriteEnnemy = 82
                EspriteAction = 149
                EmoveAI = 0
                talkEnnemy = false
                EmoveAA = true
                EmoveE = false
                EmoveLock = false
                
            elseif EmoveR == true and 
            spriteEnnemy >= 138 then
                spriteEnnemy = 82
                EspriteAction = 149
                EmoveAI = 0
                talkEnnemy = false
                EmoveAA = true
                EmoveR = false
                EmoveLock = false
            end
        end
        
        -- Setting Cooldown A
        if secondeSpellA <= 0 then
            secondeSpellA = 0
            CooldownA = true
        end
        
        -- Setting Cooldown Z
        if secondeSpellZ <= 0 then
            secondeSpellZ = 0
            CooldownZ = true
        end
        
        -- Setting Cooldown E
        if secondeSpellE <= 0 then
            secondeSpellE = 0
            CooldownE = true
        end
        
        -- Setting Cooldown R
        if secondeSpellR <= 0 then
            secondeSpellR = 0
            CooldownR = true
        end
    end
    
    -- Player talking attack
    if talkPlayer == true then
        local nameAtk = " "
        local stringLength = string.len(nameAtk)
        
        if moveA == true then
            nameAtk = "SPELL A"
            stringLength = string.len(nameAtk)
            print(nameAtk,45-(stringLength*5.5),20,12)
        elseif moveZ == true then
            nameAtk = "SPELL Z"
            stringLength = string.len(nameAtk)
            print(nameAtk,45-(stringLength*5.5),20,12)
        elseif moveE == true then
            nameAtk = "SPELL E"
            stringLength = string.len(nameAtk)
            print(nameAtk,45-(stringLength*5.5),20,12)
        elseif moveR == true then
            nameAtk = "SPELL R"
            stringLength = string.len(nameAtk)
            print(nameAtk,45-(stringLength*5.5),20,12)
        end
    end
    
    -- Ennemy talking attack
    if talkEnnemy == true then
        local nameAtkE = " "
        local stringLength = string.len(nameAtkE)
        
        if EmoveA == true then
            nameAtkE = "SPELL A"
            stringLength = string.len(nameAtkE)
            print(nameAtkE,235-(stringLength*5.5),20,12)
        elseif EmoveZ == true then
            nameAtkE = "SPELL Z"
            stringLength = string.len(nameAtkE)
            print(nameAtkE,235-(stringLength*5.5),20,12)
        elseif EmoveE == true then
            nameAtkE = "SPELL E"
            stringLength = string.len(nameAtkE)
            print(nameAtkE,235-(stringLength*5.5),20,12)
        elseif EmoveR == true then
            nameAtkE = "SPELL R"
            stringLength = string.len(nameAtkE)
            print(nameAtkE,235-(stringLength*5.5),20,12)
        end
    end
    
    -- DEbug 
    if debug == true then
        print("currentime : "..currentTime,10,0,12)
        print("elapsedTime : "..elapsedTime,10,10,12)
        print("startTime : "..startTime,10,20,12)
        print("seconde : "..seconde,10,30,12)
        print("seconde SPrite : "..secondeSprite,10,40,12)
        -- Debug player
        print("N'sprite"..spritePlayer,playerX-15,playerY+10,12)
        print("AA : "..tostring(moveAA),playerX-3,100+10,12)
        print("Move A : "..tostring(moveA),playerX-25,100+15,12)
        print("Move Z : "..tostring(moveZ),playerX-25,100+20,12)
        print("Move E : "..tostring(moveE),playerX-25,100+25,12)
        print("Move R : "..tostring(moveR),playerX-25,100+30,12)
        print("Move Locked : "..tostring(moveLock),playerX-25,100-10,12)
        -- DEbug ennemy
        print("N'sprite"..spriteEnnemy,ennemyX-30,ennemyY+10,12)
        print("AA : "..tostring(EmoveAA),ennemyX-23,100+10,12)
        print("Move A : "..tostring(EmoveA),ennemyX-45,100+15,12)
        print("Move Z : "..tostring(EmoveZ),ennemyX-45,100+20,12)
        print("Move E : "..tostring(EmoveE),ennemyX-45,100+25,12)
        print("Move R : "..tostring(EmoveR),ennemyX-45,100+30,12)
        print("Move Locked : "..tostring(EmoveLock),ennemyX-75,100-10,12)
        -- Debug timing ennemy
        print("timing AI : "..secondeEnnemy,160,0,12)
        print("Random N' : "..EmoveAI,160,10,12)
        print("Cycle ULTI : "..(EmoveCycle),160,20,12)
    end
    
    -- Setting AI
    if secondeEnnemy >= 10 then
        EmoveAI = math.random(1, 3)
        secondeEnnemy = 0
        EmoveCycle = EmoveCycle + 1
        if EmoveCycle >= 4 then
            EmoveAI = 4
            EmoveCycle = 0
        end
    end
    
    if EmoveAI == 1 and 
    EmoveLock == false and 
    EmoveAA == true then
        EmoveA = true
        EmoveAA = false
        EmoveLock = true
        talkEnnemy = true
        spriteEnnemy = 85
        EspriteAction = 85
        
    elseif EmoveAI == 2 and 
    EmoveLock == false and 
    EmoveAA == true then
        EmoveZ = true
        EmoveAA = false
        EmoveLock = true
        talkEnnemy = true
        spriteEnnemy = 101
        EspriteAction = 101
        
    elseif EmoveAI == 3 and 
    EmoveLock == false and 
    EmoveAA == true then
        EmoveE = true
        EmoveAA = false
        EmoveLock = true
        talkEnnemy = true
        spriteEnnemy = 117
        EspriteAction = 117
        
    elseif EmoveAI == 4 and 
    EmoveLock == false and 
    EmoveAA == true then
        EmoveR = true
        EmoveAA = false
        EmoveLock = true
        talkEnnemy = true
        spriteEnnemy = 133
        EspriteAction = 133
    end

    -- Input Player
    if keyp(16) then
        debug = not debug
    elseif keyp(15) then
        debugLife = not debugLife
    elseif keyp(09)then
        stopSpritePlayer = not stopSpritePlayer
        stopSpriteEnnemy = not stopSpriteEnnemy
    elseif keyp(01) and 
    moveLock == false and
    CooldownA == true then
        moveLock = true
        moveAA = false
        moveA = true
        talkPlayer = true
        spritePlayer = 5
        spriteAction = 5
        secondeSpellA = 3
        CooldownA = false
    elseif keyp(26) and
    moveLock == false and
    CooldownZ == true then
        moveLock = true
        moveAA = false
        moveZ = true
        talkPlayer = true
        spritePlayer = 21
        spriteAction = 21
        secondeSpellZ = 5
        CooldownZ = false
    elseif key(05) and
    moveLock == false and
    CooldownE == true then
        moveLock = true
        moveAA = false
        moveE = true
        talkPlayer = true
        spritePlayer = 37
        spriteAction = 37
        secondeSpellE = 5
        CooldownE = false
    elseif key(18) and
    moveLock == false and
    CooldownR == true then
        moveLock = true
        moveAA = false
        moveR = true
        talkPlayer = true
        spritePlayer = 53
        spriteAction = 53
        secondeSpellR = 15
        CooldownR = false
    end
    
    -- Affichage DPS Player
    for i = #showDamagePlayer, 1, -1 do
        local damage = showDamagePlayer[i]
        damage.y = damage.y - 0.3
        
        if damage.y < 18 then
            table.remove(showDamagePlayer, i)
        else
            print(damage.value, damage.x, damage.y, damage.color)
        end
    end
    
    -- Affichage DPS Ennemy
    for i = #showDamageEnnemy, 1, -1 do
        local damage = showDamageEnnemy[i]
        damage.y = damage.y - 0.3
        
        if damage.y < 18 then
            table.remove(showDamageEnnemy, i)
        else
            print(damage.value, damage.x, damage.y, damage.color)
        end
    end
    
    -- Affichage time round
    spr(33,112,8)
    spr(33,122,8)

    -- Calcul du pourcentage de vie actuel
    local currentLifePlayer = (lifePlayer - damagePlayer) / lifePlayer * 100
    local currentLifeEnnemy = (lifeEnnemy - damageEnnemy) / lifeEnnemy * 100
    local playerHP = lifePlayer - damagePlayer
    local ennemyHP = lifeEnnemy - damageEnnemy
    local lifeXPlayer = 100 - math.floor(currentLifePlayer)
    local lifecolorPlayer = 7
    local lifecolorEnnemy = 7
    
    -- Lifebar color player
    if currentLifePlayer <= 60 and
    currentLifePlayer >= 41 then
        lifecolorPlayer = 6
    elseif currentLifePlayer <= 40 and
    currentLifePlayer >= 11 then
        lifecolorPlayer = 4
    elseif currentLifePlayer <= 10 and
    currentLifePlayer >= 0 then
        lifecolorPlayer = 3
    elseif currentLifePlayer <= 1 then
        -- Afficher un écran jaune
        rect(0, 0, 240, 136, 13)
        print("YOU FAIL... Try Again", 100, 60, 12)
        spritePlayer = 4
        
        -- Dessiner les options "oui" et "non"
        -- Obtenir les coordonnées de la souris
        local mouseX, mouseY, leftB = mouse()
        print("Yes", 90, 80, choice == "yes" and 11 or (mouseX >= 90 and mouseX <= 130 and mouseY >= 80 and mouseY <= 90) and 10 or 12)
        print("No", 150, 80, choice == "no" and 11 or (mouseX >= 150 and mouseX <= 180 and mouseY >= 80 and mouseY <= 90) and 10 or 12)
        
        -- Vérifier si le joueur a cliqué sur les options
        if (leftB or btnp(5)) and mouseX >= 90 and mouseX <= 180 and mouseY >= 80 and mouseY <= 90 then
            if mouseX >= 90 and mouseX <= 130 then
                choice = "yes"
            elseif mouseX >= 150 and mouseX <= 180 then
                choice = "no"
            end
        end
        
        -- Si le choix est "oui", réinitialiser currentLife à 20 et réinitialiser le jeu
        if choice == "yes" then
            initGame(1500,1500)
            choice = nil
            -- Réinitialiser les autres variables du jeu ici
            -- ...
elseif choice == "no" then
    initGame(1500,1500)
    choice = nil
        
        end
    end
    
        
    
    -- Lifebar color ennemy
    if currentLifeEnnemy <= 60 and
    currentLifeEnnemy >= 41 then
        lifecolorEnnemy = 6
    elseif currentLifeEnnemy <= 40 and
    currentLifeEnnemy >= 11 then
        lifecolorEnnemy = 4
    elseif currentLifeEnnemy <= 10 and
    currentLifeEnnemy >= 0 then
        lifecolorEnnemy = 3
    end
    
    -- Affichage Life Bar / damageEnnemy
    print(namePlayer,5,0,12)
    rect(5, 7, 100+2, 10, 12)  -- Cadre Player
    rect(6, 8, 100, 8, 2)  -- Fond Player
    rect(lifeXPlayer+6, 8, currentLifePlayer, 8, lifecolorPlayer)  -- vie actuelle Player
    
    print(nameEnnemy,200,0,12)
    rect(134, 7, 100+2, 10, 12)  -- Cadre Ennemy
    rect(135, 8, 100, 8, 2)  -- Fond ENnemy
    rect(135, 8, currentLifeEnnemy, 8, lifecolorEnnemy)  -- vie actuelle Ennemy
    if debugLife == true then
        print(math.floor(currentLifePlayer).." % ".."- "..playerHP.." HPMAX ",14,10,12)
        print(ennemyHP.." HPMAX ".."- "..math.floor(currentLifeEnnemy).." % ",137,10,12)
    end
    
    -- Affichage Sprite
    spr(EspriteAction,ennemyX,ennemyY-15)
    spr(spriteEnnemy,ennemyX,ennemyY)
    spr(spriteAction,playerX,playerY-15)
    spr(spritePlayer,playerX,playerY)
    
    -- Affichage Sprite + CoolDown A
    if CooldownA == false then
        rect(10,100,8,8,2)
        print(secondeSpellA,11,102,12)
    else 
        spr(spriteSpellA,10,100)
    end
    
    -- Affichage Sprite + CoolDown Z
    if CooldownZ == false then
        rect(25,100,8,8,2)
        print(secondeSpellZ,26,102,12)
    else 
        spr(spriteSpellZ,25,100)
    end
    
    -- Affichage Sprite + CoolDown E
    if CooldownE == false then
        rect(40,100,8,8,2)
        print(secondeSpellE,41,102,12)
    else 
        spr(spriteSpellE,40,100)
    end
    
    -- Affichage Sprite + CoolDown R
    if CooldownR == false then
        rect(55,100,8,8,2)
        print(secondeSpellR,56,102,12)
    else 
        spr(spriteSpellR,55,100)
    end

end
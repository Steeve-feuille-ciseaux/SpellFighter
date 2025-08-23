-- main.lua

display.setDefault("magTextureFilter", "nearest")
display.setDefault("minTextureFilter", "nearest")

local swordsman = require("module.character.swordsman")

local playerState = ""

playerState = "Idle"

if playerState == "Idle" then
    swordsman.Idle()
elseif playerState == "AA" then
    swordsman.AA()
elseif playerState == "attack1" then
    swordsman.Atk1()
elseif playerState == "attack2" then
    swordsman.Atk2()
elseif playerState == "attackS" then
    swordsman.AtkS()
end
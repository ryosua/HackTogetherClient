-- Modules
local button = require "modules.button"
local colors = require "modules.colors"
local composer = require "composer"

local font = native.systemFont

local function changeScene(e)
    composer.gotoScene( e.target.scene )
end

local scene = composer.newScene()

function scene:create( event )
    local sceneGroup = self.view

    local TITLE_SIZE = 25
    local TEXT_SPACING = 50
    local TEXT_X = W * .1

    local sceneTitle = display.newText("Register", W * .5, H * .2, font, TITLE_SIZE )

    local userNameText = display.newText("Username", TEXT_X, sceneTitle.y + TEXT_SPACING, font, TITLE_SIZE * .7 )
    userNameText.anchorX = 0

    local emailText = display.newText("Email", TEXT_X, userNameText.y + TEXT_SPACING, font, TITLE_SIZE * .7 )
    emailText.anchorX = 0

    local universityText = display.newText("University", TEXT_X, emailText.y + TEXT_SPACING, font, TITLE_SIZE * .7 )
    universityText.anchorX = 0



    sceneGroup:insert( sceneTitle )
    sceneGroup:insert( userNameText )
    sceneGroup:insert( emailText )
    sceneGroup:insert( universityText )
end

function scene:show( event )
    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then

    elseif ( phase == "did" ) then
        
    end
end

function scene:hide( event )
    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then

    elseif ( phase == "did" ) then

    end
end

function scene:destroy( event )
    local sceneGroup = self.view
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene
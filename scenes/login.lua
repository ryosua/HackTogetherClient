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
    local sceneTitle = display.newText("Login", W * .5, H * .2, font, TITLE_SIZE )

    local BUTTON_Y_SPACING = H / 10

    local BUTTON_X = W * .5
    local green = colors.green

    sceneGroup:insert( sceneTitle )
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
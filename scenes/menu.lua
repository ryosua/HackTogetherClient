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
    local appTitle = display.newText("Hack Together", W * .5, H * .2, font, TITLE_SIZE )

    local PLAY_TEXT_SIZE = 25
    local BUTTON_Y_SPACING = H / 10

    local BUTTON_X = W * .5
    local green = colors.green
    local playBtn = button.createInstance("Find Hackers", 0, green)
    playBtn.x = BUTTON_X
    playBtn.y = H * .5
    playBtn.scene = "scenes.newScene"
    playBtn:addEventListener( "tap", changeScene )


    sceneGroup:insert( appTitle )
    sceneGroup:insert( playBtn )
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
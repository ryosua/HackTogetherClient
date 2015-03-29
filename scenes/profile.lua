-- Modules
local button = require "modules.button"
local colors = require "modules.colors"
local networkController = require "modules.networkController"

local font = native.systemFont

local function changeScene(scene)
    composer.gotoScene( "scenes." .. scene )
end

local scene = composer.newScene()

function scene:create( event )
    local sceneGroup = self.view

    local newtwork = networkController.createInstance()

    local TITLE_SIZE = 25

    local sceneTitle = display.newText("Profile", W * .5, H * .2, font, TITLE_SIZE )

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
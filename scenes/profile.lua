-- Modules
local button = require "modules.button"
local colors = require "modules.colors"
local networkController = require "modules.networkController"

local font = native.systemFont

local session = composer.state.session

local function changeScene(scene)
    composer.gotoScene( "scenes." .. scene )
end

local function changeSceneWithHacker(scene)

    local hacker = session.getLoggedInUser()

    assert( hacker ~= nil )

    local options =
    {
        --effect = "fade",
        --time = 400,
        params = 
        {
            hacker = hacker
        }
    }
   
    composer.gotoScene( "scenes." .. scene, options )
end

local scene = composer.newScene()

function scene:create( event )
    changeSceneWithHacker("viewHacker")
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
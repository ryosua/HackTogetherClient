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

    local BUTTON_Y_SPACING = .25 * H

    local BUTTON_X = W * .5
    local green = colors.green

    local loginButton = button.createInstance("Login", 0, green)
    loginButton.x = BUTTON_X
    loginButton.y = H * .5
    loginButton.scene = "scenes.login"
    loginButton:addEventListener( "tap", changeScene )

    local registerButton = button.createInstance("Register", 0, green)
    registerButton.x = BUTTON_X
    registerButton.y = loginButton.y  + BUTTON_Y_SPACING
    registerButton.scene = "scenes.register"
    registerButton:addEventListener( "tap", changeScene )

    sceneGroup:insert( appTitle )
    sceneGroup:insert( loginButton )
    sceneGroup:insert( registerButton )
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
-- Modules
local button = require "modules.button"
local colors = require "modules.colors"
local networkController = require "modules.networkController"

local font = native.systemFont

local session = composer.state.session

local function changeScene(e)
    if session.getLoggedInUser(user) ~= nil then
        composer.gotoScene( e.target.scene )
    else
        print "There is no user set."
    end
end

local scene = composer.newScene()

function scene:create( event )
    local sceneGroup = self.view

    local networkControllerI = networkController.createInstance()
    -- Warning, no failure callback!!!!

    if session.getUid() ~= -1 then
        networkControllerI.getUser(session.getUid())
    else
        composer.gotoScene( "scenes.login" )
    end

    local TITLE_SIZE = 25
    local appTitle = display.newText("Hack Together", W * .5, H * .2, font, TITLE_SIZE)

    local PLAY_TEXT_SIZE = 25
    local BUTTON_Y_SPACING = .15 * H

    local BUTTON_X = W * .5
    local green = colors.green

    local profileButton = button.createInstance("Profile", 0, green)
    profileButton.x = BUTTON_X
    profileButton.y = H * .5
    profileButton.scene = "scenes.profile"
    profileButton:addEventListener( "tap", changeScene )

    local hackersButton = button.createInstance("Find Hackers", 0, green)
    hackersButton.x = BUTTON_X
    hackersButton.y = profileButton.y + BUTTON_Y_SPACING
    hackersButton.scene = "scenes.findHackers"
    hackersButton:addEventListener( "tap", changeScene )

    local hackathonsButton = button.createInstance("Hackathons", 0, green)
    hackathonsButton.x = BUTTON_X
    hackathonsButton.y = hackersButton.y + BUTTON_Y_SPACING
    hackathonsButton.scene = "scenes.hackathons"
    hackathonsButton:addEventListener( "tap", changeScene )

    sceneGroup:insert( appTitle )
    sceneGroup:insert( profileButton )
    sceneGroup:insert( hackersButton )
    sceneGroup:insert( hackathonsButton )
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
-- Modules
local button = require "modules.button"
local colors = require "modules.colors"
local composer = require "composer"
local networkController = require "modules.networkController"

local font = native.systemFont

local function changeScene(scene)
    composer.gotoScene( "scenes." .. scene )
end

local scene = composer.newScene()

function scene:create( event )
    local sceneGroup = self.view
    local params = event.params
    local hackerName = event.params.hacker.name

    local newtwork = networkController.createInstance()

    local TITLE_SIZE = 25

    local sceneTitle = display.newText(hackerName, W * .5, H * .2, font, TITLE_SIZE )

    local TEXT_SPACING = 50
    local TEXT_X = W * .1

    local emailText = display.newText("Email:", TEXT_X, sceneTitle.y + TEXT_SPACING, font, TITLE_SIZE * .7 )
    emailText.anchorX = 0

    local universityText = display.newText("University:", TEXT_X, emailText.y + TEXT_SPACING, font, TITLE_SIZE * .7 )
    universityText.anchorX = 0

    local endorsementsText = display.newText("Endorsements:", TEXT_X, universityText.y + TEXT_SPACING, font, TITLE_SIZE * .7 )
    endorsementsText.anchorX = 0

    sceneGroup:insert( sceneTitle )
    sceneGroup:insert( emailText )
    sceneGroup:insert( universityText )
    sceneGroup:insert( endorsementsText )
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
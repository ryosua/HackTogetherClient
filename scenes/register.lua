-- Modules
local button = require "modules.button"
local colors = require "modules.colors"
local composer = require "composer"
local networkController = require "modules.networkController"

local font = native.systemFont

local function changeScene(e)
    composer.gotoScene( e.target.scene )
end

local scene = composer.newScene()

function scene:create( event )
    local sceneGroup = self.view

    local newtwork = networkController.createInstance()

    local TITLE_SIZE = 25
    local TEXT_SPACING = 50
    local TEXT_X = W * .1

    local sceneTitle = display.newText("Register", W * .5, H * .2, font, TITLE_SIZE )

    local emailText = display.newText("Email", TEXT_X, sceneTitle.y + TEXT_SPACING, font, TITLE_SIZE * .7 )
    emailText.anchorX = 0

    local passwordText = display.newText("Password", TEXT_X, emailText.y + TEXT_SPACING, font, TITLE_SIZE * .7 )
    passwordText.anchorX = 0

    local universityText = display.newText("University", TEXT_X, passwordText.y + TEXT_SPACING, font, TITLE_SIZE * .7 )
    universityText.anchorX = 0

    local TEXT_FIELD_X = TEXT_X + emailText.contentWidth + 100
    local TEXT_FIELD_Y = emailText.y
    local TEXT_FIELD_WIDTH = 100
    local TEXT_FIELD_HEIGHT = 20

    local emailField = native.newTextField( TEXT_FIELD_X, TEXT_FIELD_Y, TEXT_FIELD_WIDTH, TEXT_FIELD_HEIGHT )
    local passwordField = native.newTextField( TEXT_FIELD_X, emailField.y + TEXT_SPACING, TEXT_FIELD_WIDTH, TEXT_FIELD_HEIGHT )
    local universityField = native.newTextField( TEXT_FIELD_X, passwordField.y + TEXT_SPACING, TEXT_FIELD_WIDTH, TEXT_FIELD_HEIGHT )

    local BUTTON_X = W * .5
    local BUTTON_Y = H * .8

    local green = colors.green
    local registerButton = button.createInstance("Register", 0, green)
    registerButton.x = BUTTON_X
    registerButton.y = BUTTON_Y

    local function registerButtonPush()
        newtwork.register(emailField.text, passwordField.text, universityField.text)
    end

    registerButton:addEventListener("tap", registerButtonPush)

    sceneGroup:insert( sceneTitle )
    sceneGroup:insert( emailText )
    sceneGroup:insert( passwordText )
    sceneGroup:insert( universityText )

    sceneGroup:insert( emailField )
    sceneGroup:insert( passwordField )
    sceneGroup:insert( universityField )

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
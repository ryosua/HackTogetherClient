-- Modules
local button = require "modules.button"
local colors = require "modules.colors"
local networkController = require "modules.networkController"

local font = native.systemFont

local scene = composer.newScene()

function scene:create( event )
    local sceneGroup = self.view

    local function loginFailedCallback()
        usernameTextField.text = ""
        passwordField.text = ""
    end

    local newtwork = networkController.createInstance(loginFailedCallback)

    local TITLE_SIZE = 25
    local TEXT_SPACING = 50
    local TEXT_X = W * .1

    local sceneTitle = display.newText("Login", W * .5, H * .2, font, TITLE_SIZE )

    local usernameText = display.newText("Username", TEXT_X, sceneTitle.y + TEXT_SPACING, font, TITLE_SIZE * .7 )
    usernameText.anchorX = 0

    local passwordText = display.newText("Password", TEXT_X, usernameText.y + TEXT_SPACING, font, TITLE_SIZE * .7 )
    passwordText.anchorX = 0

    local TEXT_FIELD_X = TEXT_X + usernameText.contentWidth + 100
    local TEXT_FIELD_Y = usernameText.y
    local TEXT_FIELD_WIDTH = 100
    local TEXT_FIELD_HEIGHT = 20

    local usernameTextField = native.newTextField( TEXT_FIELD_X, TEXT_FIELD_Y, TEXT_FIELD_WIDTH, TEXT_FIELD_HEIGHT )
    local passwordField = native.newTextField( TEXT_FIELD_X, usernameTextField.y + TEXT_SPACING, TEXT_FIELD_WIDTH, TEXT_FIELD_HEIGHT )
    passwordField.isSecure = true

    local function loginFailedCallback()
        usernameTextField.text = ""
        passwordField.text = ""
    end

    local newtwork = networkController.createInstance(loginFailedCallback)

    local BUTTON_X = W * .5
    local BUTTON_Y = H * .8

    local green = colors.green
    local loginButton = button.createInstance("Login", 0, green)
    loginButton.x = BUTTON_X
    loginButton.y = BUTTON_Y

    local function login()
        newtwork.login(usernameTextField.text, passwordField.text)
    end

    loginButton:addEventListener("tap", login)

    sceneGroup:insert( sceneTitle )
    sceneGroup:insert( usernameText )
    sceneGroup:insert( passwordText )

    sceneGroup:insert( usernameTextField )
    sceneGroup:insert( passwordField )

    sceneGroup:insert( loginButton )
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
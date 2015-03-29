-- Modules
local button = require "modules.button"
local colors = require "modules.colors"
local lists = require "modules.lists"
local networkController = require "modules.networkController"
local widget = require "widget"

local font = native.systemFont

local function changeScene(scene)
    composer.gotoScene( "scenes." .. scene )
end

local scene = composer.newScene()

function scene:create( event )
    local sceneGroup = self.view

    local TITLE_SIZE = 25
    local TEXT_SPACING = 50
    local TEXT_X = W * .1

    local sceneTitle = display.newText("Register", W * .5, H * .2, font, TITLE_SIZE )

    local emailText = display.newText("Email", TEXT_X, sceneTitle.y + TEXT_SPACING, font, TITLE_SIZE * .7 )
    emailText.anchorX = 0

    local userNameText = display.newText("Username", TEXT_X, emailText.y + TEXT_SPACING, font, TITLE_SIZE * .7 )
    userNameText.anchorX = 0

    local passwordText = display.newText("Password", TEXT_X, userNameText.y + TEXT_SPACING, font, TITLE_SIZE * .7 )
    passwordText.anchorX = 0

    local universityText = display.newText("University", TEXT_X, passwordText.y + TEXT_SPACING, font, TITLE_SIZE * .7 )
    universityText.anchorX = 0

    local TEXT_FIELD_X = TEXT_X + emailText.contentWidth + 100
    local TEXT_FIELD_Y = emailText.y
    local TEXT_FIELD_WIDTH = 100
    local TEXT_FIELD_HEIGHT = 20

    local emailField = native.newTextField( TEXT_FIELD_X, TEXT_FIELD_Y, TEXT_FIELD_WIDTH, TEXT_FIELD_HEIGHT )
    local userNameField = native.newTextField( TEXT_FIELD_X, emailField.y + TEXT_SPACING, TEXT_FIELD_WIDTH, TEXT_FIELD_HEIGHT )
    local passwordField = native.newTextField( TEXT_FIELD_X, userNameField.y + TEXT_SPACING, TEXT_FIELD_WIDTH, TEXT_FIELD_HEIGHT )
    passwordField.isSecure = true
    local selectedUniversityText = display.newText("Selected university", TEXT_FIELD_X - 50, passwordText.y + TEXT_SPACING, font, TITLE_SIZE * .7 )
    selectedUniversityText.anchorX = 0
    selectedUniversityText.alpha = 0

    local columnData = 
    {
        -- Universities
        { 
            align = "center",
            width = 140,
            startIndex = 1,
            labels = lists.getUniversities()
        },
    }

    local universityPicker = widget.newPickerWheel
    {
        top = userNameField.y + TEXT_SPACING,
        columns = columnData
    }

    universityPicker.alpha = 0

    local values = universityPicker:getValues()
    local university = values[1].value

    local universityPickerSelectionBox = display.newRect(universityPicker.x, universityPicker.y, universityPicker.contentWidth, universityPicker.contentHeight)
    universityPickerSelectionBox:setFillColor( 1, 1, 1 )
    universityPickerSelectionBox.alpha = 0

    local BUTTON_X = W * .5
    local BUTTON_Y = H * .8

    local green = colors.green
    local registerButton = button.createInstance("Register", 0, green)
    registerButton.x = universityPicker.x
    registerButton.y = universityPicker.y
    registerButton.scene = "menu"

    local green = colors.green
    local universityButton = button.createInstance("Choose", 0, green)
    universityButton.x = TEXT_FIELD_X
    universityButton.y =  passwordField.y + TEXT_SPACING
    universityButton.scene = "menu"

    local function onUniversityButtonPush()
        universityButton.alpha = 0
        universityPicker.alpha = 1
        universityPickerSelectionBox.alpha = 1

        return true
    end

    local values = universityPicker:getValues()
    local university = values[1].value

    universityButton:addEventListener( "tap", onUniversityButtonPush )

    local function onUniversityPickerSelectionBoxTap()
        universityButton.alpha = 0
        universityPicker.alpha = 0
        universityPickerSelectionBox.alpha = 0

        local values = universityPicker:getValues()
        local university = values[1].value

        selectedUniversityText.text = university
        selectedUniversityText.alpha = 1

        return true
    end

    universityPickerSelectionBox:addEventListener( "tap", onUniversityPickerSelectionBoxTap )

    local function loginFailedCallback()
        emailField.text = ""
        userNameField.text = ""
        passwordField.text = ""
    end

    local networkControllerI = networkController.createInstance(loginFailedCallback)

    local function registerButtonPush()
        local values = universityPicker:getValues()
        local university = values[1].value

        if  university ~= "" then
            networkControllerI.register(emailField.text, userNameField.text, passwordField.text, university)
        end
        
        return true
    end

    registerButton:addEventListener("tap", registerButtonPush)

    sceneGroup:insert( registerButton )
    sceneGroup:insert( universityButton )

    sceneGroup:insert( sceneTitle )
    sceneGroup:insert( emailText )
    sceneGroup:insert( userNameText )
    sceneGroup:insert( passwordText )
    sceneGroup:insert( universityText )
    sceneGroup:insert( selectedUniversityText )

    sceneGroup:insert( emailField )
    sceneGroup:insert( userNameField )
    sceneGroup:insert( passwordField )
    sceneGroup:insert( universityPickerSelectionBox )
    sceneGroup:insert( universityPicker )    
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
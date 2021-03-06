-- Mission: We connect people to build things!

-- Hide the status bar.
display.setStatusBar( display.HiddenStatusBar )

-- Global Variables
W = display.contentWidth
H = display.contentHeight

-- Modules
composer = require "composer"
local sessionController = require "modules.sessionController"

composer.state = {}
composer.state.session = sessionController.createInstance()

-- Load menu screen.
composer.gotoScene( "scenes.registerOrLogin" )

-- Set composer to recycle on scene change, 
-- or create a new scene everytime that scene is launched vs simpily hiding the display group.
composer.recycleOnSceneChange = true
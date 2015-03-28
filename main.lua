-- Hide the status bar.
display.setStatusBar( display.HiddenStatusBar )

-- Global Variables
W = display.contentWidth
H = display.contentHeight

-- Modules
local composer = require "composer"

-- Load menu screen.
composer.gotoScene( "scenes.menu" )

-- Set composer to recycle on scene change, 
-- or create a new scene everytime that scene is launched vs simpily hiding the display group.
composer.recycleOnSceneChange = true
-- Modules
local button = require "modules.button"
local colors = require "modules.colors"
local composer = require "composer"
local networkController = require "modules.networkController"
local widget = require( "widget" )

local font = native.systemFont

local function changeScene(scene)
    composer.gotoScene( "scenes." .. scene )
end

local function changeSceneWithHacker(scene, hacker)

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
    local sceneGroup = self.view

    local newtwork = networkController.createInstance()

    local TITLE_SIZE = 25

    local sceneTitle = display.newText("Find Hackers", W * .5, H * .2, font, TITLE_SIZE )

    -- ScrollView listener
    local function scrollListener( event )

        local phase = event.phase
        if ( phase == "began" ) then -- print( "Scroll view was touched" )
        elseif ( phase == "moved" ) then -- print( "Scroll view was moved" )
        elseif ( phase == "ended" ) then -- print( "Scroll view was released" )
        end

        -- In the event a scroll limit is reached...
        if ( event.limitReached ) then
            if ( event.direction == "up" ) then -- print( "Reached top limit" )
            elseif ( event.direction == "down" ) then -- print( "Reached bottom limit" )
            elseif ( event.direction == "left" ) then -- print( "Reached left limit" )
            elseif ( event.direction == "right" ) then -- print( "Reached right limit" )
            end
        end

        return true
    end

    local function onUserTap(e)
        print ("User with userID: " .. e.target.hacker.id .. " tapped.")
        changeSceneWithHacker("viewHacker", e.target.hacker)
    end

    -- Create the widget
    local scrollView = widget.newScrollView
    {
        backgroundColor = { 0, 0, 0},
        top = H * .25,
        left = 0,
        width = W,
        height = 400,
        scrollWidth = 600,
        scrollHeight = 800,
        listener = scrollListener
    }

    scrollView.backgroundColor = { 0, 0, 0}

    scrollView.anchorX = .5
    scrollView.anchorY = .5

    local USER_NAME_SIZE = TITLE_SIZE * .8
    local USER_TEXT_SPACING = 40

    local hackers = newtwork.getHackers(1)

    for i = 1, table.getn(hackers) do
        local hacker = hackers[i]

        local user = display.newText(hacker.name, 20, i * USER_TEXT_SPACING, font, USER_NAME_SIZE )
        user.anchorX = 0
        user.hacker = hacker
        user:setFillColor( 1, 1, 1 )
        user:addEventListener( "tap", onUserTap )
        scrollView:insert( user )
    end

    sceneGroup:insert( sceneTitle )
    sceneGroup:insert( scrollView )
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
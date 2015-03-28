-- Modules
local colors = require "modules.colors"

local button = {}

function button.createInstance(text, color)
    local group = display.newGroup()

    local text = display.newText(text, 0, 0, font, 20 )
    local rect = display.newRect(0, 0, text.contentWidth * 1.25, text.contentHeight * 1.25 )
    rect:setFillColor( colors.black.R, colors.black.G, colors.black.B )
    rect.strokeWidth = 2
    rect:setStrokeColor( colors.white.R, colors.white.G, colors.white.B )

    --[[
    if color ~= nil then
        text:setFillColor( color.R, color.G, color.B )
        rect:setStrokeColor( color.R, color.G, color.B )
    end
    ]]--

    group:insert( rect )
    group:insert( text )

    return group
end

return button
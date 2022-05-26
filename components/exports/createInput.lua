local useful = require('@omni/useful')
local components = require('@omni/components')
local utils = require('@omni/utils')
local shaders = require('@omni/shaders')

local inputs = {}

function omniCreateInput ( id, options )
    if inputs[id] == nil then
        inputs[id] = {}
        --inputs[id].x = x inputs[id].y = y inputs[id].width = width inputs[id].height = height inputs[id].radius = radius
        --inputs[id].color = color inputs[id].alpha = alpha inputs[id].borderSize = border inputs[id].borderColor = borderColor
        --inputs[id].borderAlpha = borderAlpha inputs[id].icon = icon inputs[id].password = password
        -- x, y, width, height, radius, color, alpha, border, borderColor, borderAlpha, hoverColor, hoverAlpha, selectedColor, selectedAlpha, icon, password, postGUI
        table.insert( inputs, {
            id = id,
            text = options.placeholder,
            x = options.x,
            y = options.y,
            width = options.width,
            height = options.height,
            radius = options.radius,
            selectable = options.selectable,
            hover = options.hover,
            color = options.color,
            alpha = options.alpha,
            textColor = options.textColor,
            textAlpha = options.textAlpha,
            hoverText = options.hoverText,
            borderSize = options.borderSize,
            borderColor = options.borderColor,
            borderAlpha = options.borderAlpha,
            hoverColor = options.hoverColor,
            hoverAlpha = options.hoverAlpha,
            tick = getTickCount()
        })
    end
    for key, _ in ipairs( inputs ) do
        local table = inputs[key]
        local padding = 20
        if icon then padding = 40 else padding = 20 end
        if table.borderSize > 0 then
            omniCreateRectangle( table.x, table.y, table.width, table.height, table.radius, table.borderColor, table.borderAlpha )
            omniCreateRectangle( table.x + table.borderSize, table.y + table.borderSize, table.width - table.borderSize * 2, table.height - table.borderSize * 2, table.radius, table.color, table.alpha )
            omniCreateText( table.text, table.x + padding, table.y + 15, table.width, table.height, table.textColor, table.textAlpha, "roboto.Regular", 10, "left", "top", false, false, false, false, false )
        else
            omniCreateRectangle( table.x, table.y, table.width, table.height, table.radius, table.color, table.alpha )
        end
        if table.hover then
            table.text = ""
        else
            table.text = options.placeholder
        end
        if useful.isMouseIn( table.x, table.y, table.width, table.height ) then
            table.textColor = table.hoverText
            if getKeyState( "mouse1" ) and ( getTickCount() - table.tick >= 500 ) then
                if not table.hover and table.selectable then
                    table.hover = true
                    --table.color = table.hoverColor
                    print( table.text )
                end
            end
        else
            if not table.hover then
                table.textColor = options.textColor
            end
            if getKeyState( "mouse1" ) and ( getTickCount() - table.tick >= 500 ) then
                if table.hover then
                    table.hover = false
                    table.color = options.color
                end
            end
        end
    end
end

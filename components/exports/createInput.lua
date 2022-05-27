local useful = require('@omni/useful')
local components = require('@omni/components')
local utils = require('@omni/utils')
local shaders = require('@omni/shaders')

local inputs = {}
local svg_icons = {}

function omniCreateInput( id, options )
    if inputs[id] == nil then
        inputs[id] = {}
        local infos_inputs = options.infos
        local borders = options.borders
        local icons = options.icons
        table.insert( inputs, {
            id = id,
            x = options.x,
            y = options.y,
            width = options.width,
            height = options.height,
            radius = options.radius,
            paddingX = options.paddingX,
            paddingY = options.paddingY,
            color = options.color,
            alpha = options.alpha,
            infos = infos_inputs,
            borders = borders,
            icons = icons,
            defaults = {
                color = options.color,
                alpha = options.alpha,
                textColor = infos_inputs.textColor,
                textAlpha = infos_inputs.textAlpha,
                borderColor = borders.borderColor,
                borderAlpha = borders.borderAlpha,
                iconColor = icons.iconColor,
                iconAlpha = icons.iconAlpha,
            },
            tick = getTickCount(),
        })
    end
    for key, _ in ipairs( inputs ) do
        local element = inputs[key]
        local infos = element.infos
        local borders = element.borders
        local icons = element.icons
        local defaults = element.defaults
        local text_input = table.concat( infos.text )
        if text_input == "" then infos.text = { infos.placeholder } end
        if element then
            if borders.borderSize > 0 then
                omniCreateRectangle( element.x, element.y, element.width, element.height, element.radius, borders.borderColor, borders.borderAlpha )
                omniCreateRectangle( element.x + borders.borderSize, element.y + borders.borderSize, element.width - borders.borderSize * 2, element.height - borders.borderSize * 2, element.radius, element.color, element.alpha )
                omniCreateText( text_input, element.x + infos.paddingX, element.x + infos.paddingY, element.width, element.height, infos.textColor, infos.textAlpha, infos.font, infos.fontSize, "left", "top", false, false, false, false, false )
            else
                omniCreateRectangle( element.x, element.y, element.width, element.height, element.radius, element.color, element.alpha )
                omniCreateText( text_input, element.x + infos.paddingX, element.x + infos.paddingY, element.width, element.height )
            end
            if icons.icon then
                if not svg_icons[id] then
                    svg_icons[id] = svgCreate( icons.iconWidth, icons.iconHeight, icons.icon )
                else
                    omniCreateImage( element.x + icons.paddingX, element.y + icons.paddingY, icons.iconWidth, icons.iconHeight, svg_icons[id], 0, 0, 0, icons.iconColor, icons.iconAlpha, false )
                end
            end
            if useful.isMouseIn( element.x, element.y, element.width, element.height ) then
                if infos.hoverColor then
                    infos.textColor = infos.hoverColor
                    infos.textAlpha = infos.hoverAlpha
                end
                if borders.hoverBorder then
                    borders.borderColor = borders.hoverBorder
                    borders.borderAlpha = borders.hoverAlpha
                end
                if icons.hoverIcon then
                    icons.iconColor = icons.hoverIcon
                    icons.iconAlpha = icons.hoverIconAlpha
                end
                if getKeyState( "mouse1" ) and ( getTickCount() - element.tick >= 500 ) then
                    element.tick = getTickCount()
                    if not infos.hover and infos.selectable then
                        infos.hover = true
                    end
                end
            else
                if not infos.hover then
                    infos.textColor = defaults.textColor
                    infos.textAlpha = defaults.textAlpha
                    borders.borderColor = defaults.borderColor
                    borders.borderAlpha = defaults.borderAlpha
                    icons.iconColor = defaults.iconColor
                    icons.iconAlpha = defaults.iconAlpha
                end
                if getKeyState( "mouse1" ) and ( getTickCount() - element.tick >= 150 ) then
                    element.tick = getTickCount()
                    if infos.hover then
                        infos.hover = false
                        if text_input == "" then
                            infos.text = { infos.placeholder }
                        end
                    end
                end
            end
        end
    end
end

function destroyInput( id )
    for key, value in ipairs( inputs ) do
        if inputs[key].id == id then
            table.remove( inputs, key )
        end
    end
end

function writeInput( character )
    if inputs then
        for key, value in ipairs( inputs ) do
            local element = inputs[key]
            local infos = element.infos
            if infos.hover then
                if infos.text and ( getTickCount() - element.tick >= 50 ) then
                    element.tick = getTickCount()
                    local the_input = table.concat( infos.text )
                    if the_input == infos.placeholder then
                        infos.text = {}
                    end
                    if #infos.text < infos.characterLimit then
                        table.insert( infos.text, character )
                    end
                end
            end
        end
    end
end
addEventHandler( "onClientCharacter", root, writeInput )

function delWriteInput()
    if inputs then
        for key, _ in ipairs( inputs ) do
            local element = inputs[key]
            local infos = element.infos
            if infos.hover then
                if infos.text and ( getTickCount() - element.tick >= 50 ) then
                    element.tick = getTickCount()
                    table.remove( infos.text, #infos.text )
                end
            end
        end
    end
end
bindKey( "backspace", "down", delWriteInput )
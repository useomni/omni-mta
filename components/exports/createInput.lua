local useful = require('@omni/useful')
local components = require('@omni/components')
local utils = require('@omni/utils')
local shaders = require('@omni/shaders')
local instance = {}

local inputs = {}
local svg_icons = {}

-- icons = {
--     icon = [[
--         <svg width="20" height="21" viewBox="0 0 20 21" fill="none" xmlns="http://www.w3.org/2000/svg">
--             <path d="M12.9938 3.02266C12.2336 2.20195 11.1719 1.75 10 1.75C8.82192 1.75 7.75668 2.19922 7.00004 3.01484C6.23519 3.83945 5.86254 4.96016 5.95004 6.17031C6.12348 8.55781 7.94028 10.5 10 10.5C12.0598 10.5 13.8735 8.5582 14.0497 6.17109C14.1383 4.97187 13.7633 3.85352 12.9938 3.02266Z" fill="#505059"/>
--             <path d="M16.8752 19.25H3.12522C2.94525 19.2523 2.76702 19.2145 2.60349 19.1393C2.43997 19.0641 2.29526 18.9534 2.17991 18.8152C1.926 18.5117 1.82366 18.0973 1.89944 17.6781C2.22913 15.8492 3.25804 14.3129 4.87522 13.2344C6.31194 12.277 8.13186 11.75 10.0002 11.75C11.8686 11.75 13.6885 12.2773 15.1252 13.2344C16.7424 14.3125 17.7713 15.8488 18.101 17.6777C18.1768 18.0969 18.0744 18.5113 17.8205 18.8148C17.7052 18.9531 17.5605 19.0639 17.397 19.1391C17.2335 19.2144 17.0552 19.2523 16.8752 19.25Z" fill="#505059"/>
--         </svg>
--     ]],
--     iconWidth = 20,
--     iconHeight = 21,
--     iconColor = "neutralColor.100",
--     iconAlpha = 255,
--     hoverIcon = "massiveWhite.300",
--     hoverIconAlpha = 255,
--     paddingX = 10,
--     paddingY = 11,
-- },
function omniCreateInput( id, options )
    if inputs[id] == nil then
        inputs[id] = {}
        local infos_inputs = options.infos
        local borders = options.borders
        local icons = options.icons
        if not options.color then options.color = "neutralColor.500" end
        if not options.alpha then options.alpha = 255 end

        if not infos_inputs.text then infos_inputs.text = {} end
        if not infos_inputs.textColor then infos_inputs.textColor = "massiveWhite.500" end
        if not infos_inputs.textAlpha then infos_inputs.textAlpha = 255 end
        if not infos_inputs.hoverColor then infos_inputs.hoverColor = "neutralColor.300" end
        if not infos_inputs.hoverAlpha then infos_inputs.hoverAlpha = 255 end
        if not infos_inputs.hoverText then infos_inputs.hoverText = "neutralColor.300" end
        if not infos_inputs.hoverTextAlpha then infos_inputs.hoverTextAlpha = 255 end
        if not infos_inputs.font then infos_inputs.font = "roboto.Regular" end
        if not infos_inputs.fontSize then infos_inputs.fontSize = 10 end

        if not borders.borderSize then borders.borderSize = 0 end
        if not borders.borderColor then borders.borderColor = "semantic.positive" end
        if not borders.maxAlpha then borders.maxAlpha = 255 end
        borders.borderAlpha = 0

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
            omniCreateRectangle( element.x, element.y, element.width, element.height, element.radius, borders.borderColor, borders.borderAlpha )
            if text_input ~= "" and text_input ~= infos.placeholder and borders.borderSize > 0 then
                local now = getTickCount()
                borders.borderAlpha = interpolateBetween(borders.borderAlpha, 0, 0, 255, 0, 0, (getTickCount()-now - 1000)/5000, "OutBounce")
                omniCreateRectangle( element.x + borders.borderSize, element.y + borders.borderSize, element.width - borders.borderSize * 2, element.height - borders.borderSize * 2, element.radius, element.color, element.alpha )
            else
                if borders.borderSize > 0 then
                    local now = getTickCount()
                    borders.borderAlpha = interpolateBetween(borders.borderAlpha, 0, 0, 0, 0, 0, (getTickCount()-now - 1000)/5000, "OutBounce")
                end
                omniCreateRectangle( element.x + borders.borderSize, element.y + borders.borderSize, element.width - borders.borderSize * 2, element.height - borders.borderSize * 2, element.radius, element.color, element.alpha )
            end
            omniCreateText( text_input, element.x + infos.paddingX, element.y + infos.paddingY, element.width, element.height, infos.textColor, infos.textAlpha, infos.font, infos.fontSize, "left", "top", false, false, false, false, false )
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

instance.getInputById = function( id )
    local infos = {}
    for index, value in ipairs( id ) do
        for key, _ in ipairs( inputs ) do
            if inputs[key].id == value then
                local element = inputs[key]
                local element_info = element.infos
                local text_input = table.concat( element_info.text )
                table.insert( infos, { 
                    element_info.placeholder,
                    text_input,
                    element_info.characterLimit,
                    element_info.selectable,
                    element_info.hover,
                })
            end
        end
    end
    return infos
end

module.exports('@omni/inputs', instance)
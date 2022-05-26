local instance = {}
local useful = require('@omni/useful')
local components = require('@omni/components')
local utils = require('@omni/utils')
local shaders = require('@omni/shaders')

instance.createRectangle = function(x, y, width, height, radius, color, alpha, postGUI, subPixelPositioning)
    assert(type(x) == "number","Bad argument @createRectangle at argument 1, expect number got "..type(x))
    assert(type(y) == "number","Bad argument @createRectangle at argument 2, expect number got "..type(y))
    assert(type(width) == "number","Bad argument @createRectangle at argument 3, expect number got "..type(width))
    assert(type(height) == "number","Bad argument @createRectangle at argument 4, expect number got "..type(height))
    assert(type(radius) == "number","Bad argument @createRectangle at argument 5, expect number got "..type(radius))
    assert(type(color) == "string","Bad argument @createRectangle at argument 6, expect string got "..type(color))
    dxDrawRectangle(x+radius, y+radius, width-(radius*2), height-(radius*2), utils.colorParser(color, alpha), postGUI, subPixelPositioning)
    dxDrawCircle(x+radius, y+radius, radius, 180, 270, utils.colorParser(color, alpha), utils.colorParser(color, alpha), 16, 1, postGUI)
    dxDrawCircle(x+radius, (y+height)-radius, radius, 90, 180, utils.colorParser(color, alpha), utils.colorParser(color, alpha), 16, 1, postGUI)
    dxDrawCircle((x+width)-radius, (y+height)-radius, radius, 0, 90, utils.colorParser(color, alpha), utils.colorParser(color, alpha), 16, 1, postGUI)
    dxDrawCircle((x+width)-radius, y+radius, radius, 270, 360, utils.colorParser(color, alpha), utils.colorParser(color, alpha), 16, 1, postGUI)
    dxDrawRectangle(x, y+radius, radius, height-(radius*2), utils.colorParser(color, alpha), postGUI, subPixelPositioning)
    dxDrawRectangle(x+radius, y+height-radius, width-(radius*2), radius, utils.colorParser(color, alpha), postGUI, subPixelPositioning)
    dxDrawRectangle(x+width-radius, y+radius, radius, height-(radius*2), utils.colorParser(color, alpha), postGUI, subPixelPositioning)
    dxDrawRectangle(x+radius, y, width-(radius*2), radius, utils.colorParser(color, alpha), postGUI, subPixelPositioning)
end

instance.createText = function(text, x, y, width, height, color, alpha, font, size, haligh, valign, clip, wordbreak, postgui)
    dxDrawText(text, x, y, width, height, utils.colorParser(color, alpha), size/100, components.Fonts[font], "center", "center", haligh, valign, clip, wordbreak, postgui)
end


instance.image = function (x, y, width, height, path, rotx, roty, rotz, color, alpha, postgui)
    dxDrawImage (x, y, width, height, path, rotx, roty, rotz, utils.colorParser(color, alpha), postgui)
end


instance.createRectangleGradient = function( x, y, width, height, radius, colorOne, opacityOne, colorTwo, opacityTwo, postGUI )
    local colorParser = utils.colorParser( colorOne, opacityOne )
    local colorParserTwo = utils.colorParser( colorTwo, opacityTwo )
    local gradient_color = shaders.gradientColor( colorParser, colorParserTwo )
    dxDrawImage( x + radius, y + radius, width - ( radius * 2 ), height - ( radius * 2 ), gradient_color, 0, 0, 0, tocolor(255,255,255,255), postGui ) -- Center

    dxDrawCircle( x + radius, y + radius, radius, 180, 270, colorOne, colorOne, 16, 1, postGui ) -- Left Top
    dxDrawCircle( x + radius, y + height - radius, radius, 90, 180, colorOne, colorOne, 16, 1, postGui ) -- Left Bottom
    dxDrawCircle( ( x + width ) - radius, ( y + height ) - radius, radius, 0, 90, colorTwo, colorTwo, 16, 1, postGui ) -- Right Bottom
    dxDrawCircle( ( x + width ) - radius, y + radius, radius, 270, 360, colorTwo, colorTwo, 16, 1, postGui ) -- Right Top

    dxDrawImage( x + radius, y, width - ( radius * 2 ), height - ( radius * 2 ), gradient_color, 0, 0, 0, tocolor(255,255,255,255), postGui  ) -- Top
    dxDrawImage( x + radius, y + height - radius, width - ( radius * 2 ), radius, gradient_color, 0, 0, 0, tocolor(255,255,255,255), postGui  ) -- Bottom
    dxDrawRectangle( x, y + radius, radius, height - ( radius * 2 ), colorOne, postGui ) -- Left
    dxDrawRectangle( x + width - radius, y + radius, radius, height - ( radius * 2 ), colorTwo, postGui ) -- Right
end

local gradient_image_color = {}

instance.createCircle = function( id, x, y, width, height, radius, colorOne, opacityOne, colorTwo, opacityTwo, postGUI )
    local colorParser = utils.colorParser( colorOne, opacityOne )
    local colorParserTwo = utils.colorParser( colorTwo, opacityTwo )
    if radius < 10 then
        radius = 10
    end
    if gradient_image_color[id] == nil then
        gradient_image_color[id] = {}
        gradient_image_color[id] = shaders.gradientSVG( width, height, radius, colorParser, colorParserTwo )
    end
    dxDrawImage( x, y, width, height, gradient_image_color[id], 0, 0, 0, tocolor( 255, 255, 255, 255 ), postGUI )
end

local inputs = {}

instance.createInput = function( id, options )
    if inputs[id] == nil then
        inputs[id] = {}
        --inputs[id].x = x inputs[id].y = y inputs[id].width = width inputs[id].height = height inputs[id].radius = radius
        --inputs[id].color = color inputs[id].alpha = alpha inputs[id].borderSize = border inputs[id].borderColor = borderColor
        --inputs[id].borderAlpha = borderAlpha inputs[id].icon = icon inputs[id].password = password
        -- x, y, width, height, radius, color, alpha, border, borderColor, borderAlpha, hoverColor, hoverAlpha, selectedColor, selectedAlpha, icon, password, postGUI
        table.insert( inputs, { 
            id = id,
            x = options.x,
            y = options.y,
            width = options.width,
            height = options.height,
            radius = options.radius,
            selectable = options.selectable,
            hover = options.hover
            defaultColor = options.color,
            defaultAlpha = options.alpha,
            color = options.color,
            alpha = options.alpha,
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
        if table.borderSize > 0 then
            instance.createRectangle( table.x, table.y, table.width, table.height, table.radius, table.borderColor, table.borderAlpha )
            instance.createRectangle( table.x + table.borderSize, table.y + table.borderSize, table.width - table.borderSize * 2, table.height - table.border * 2, table.radius, table.color, table.alpha )
        else
            instance.createRectangle( table.x, table.y, table.width, table.height, table.radius, table.color, table.alpha )
        end
        if useful.isMouseIn( table.x, table.y, table.width, table.height ) then
            if not table.hover then
                table.color = utils.colorParser( table.hoverColor, table.hoverAlpha )
            end
        else
            if table.hover then
                table.color = utils.colorParser( table.hoverColor, table.hoverAlpha )
            end
            if getKeyState( "mouse1" ) and ( getTickCount() - table.tick >= 500 ) then
                
            end
        end

        if inputs[key].borderSize > 0 then
            instance.createRectangle( inputs[key].x, inputs[key].y, inputs[key].width, inputs[key].height, inputs[key].radius, inputs[key].borderColor, inputs[key].borderAlpha )
            instance.createRectangle( inputs[key].x + inputs[key].borderSize, inputs[key].y + inputs[key].borderSize, inputs[key].width - inputs[key].borderSize * 2, inputs[key].height - inputs[key].borderSize * 2, inputs[key].radius, inputs[key].color, inputs[key].alpha )
        else
            instance.createRectangle( inputs[key].x, inputs[key].y, inputs[key].width, inputs[key].height, inputs[key].radius, inputs[key].color, inputs[key].alpha )
        end
        if useful.isMouseIn( inputs[key].x, inputs[key].y, inputs[key].width, inputs[key].height ) then
            if inputs[key].hover then
                inputs[key].color = utils.colorParser( hoverColor, hoverAlpha )
            else
                inputs[key].color = 
            end
            if getKeyState( "mouse1" ) and ( getTickCount() - inputs[key].tick >= 500 ) then
                inputs[key].tick = getTickCount()
                inputs[key].hover = true
            end
        else
            if getKeyState( "mouse1" ) and ( getTickCount() - inputs[key].tick >= 500 ) then
                inputs[key].tick = getTickCount()
                inputs[key].hover = false
            end
        end
    end
end

module.exports("omni-system", instance)

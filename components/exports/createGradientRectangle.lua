local components = require('@omni/components')
local utils = require('@omni/utils')
local shaders = require('@omni/shaders')

function omniCreateGradientRectangle( x, y, width, height, radius, colorOne, opacityOne, colorTwo, opacityTwo, postGUI )
    local colorParser = utils.colorParser( colorOne, opacityOne )
    local colorParserTwo = utils.colorParser( colorTwo, opacityTwo )
    local gradient_color = shaders.gradientColor( colorParser, colorParserTwo )
    dxDrawImage( x + radius, y + radius, width - ( radius * 2 ), height - ( radius * 2 ), gradient_color, 0, 0, 0, tocolor(255,255,255,255), postGUI ) -- Center

    dxDrawCircle( x + radius, y + radius, radius, 180, 270, colorParser, colorParser, 16, 1, postGUI ) -- Left Top
    dxDrawCircle( x + radius, y + height - radius, radius, 90, 180, colorParser, colorParser, 16, 1, postGUI ) -- Left Bottom
    dxDrawCircle( ( x + width ) - radius, ( y + height ) - radius, radius, 0, 90, colorParserTwo, colorParserTwo, 16, 1, postGUI ) -- Right Bottom
    dxDrawCircle( ( x + width ) - radius, y + radius, radius, 270, 360, colorParserTwo, colorParserTwo, 16, 1, postGUI ) -- Right Top

    dxDrawImage( x + radius, y, width - ( radius * 2 ), height - ( radius * 2 ), gradient_color, 0, 0, 0, tocolor(255,255,255,255), postGUI  ) -- Top
    dxDrawImage( x + radius, y + height - radius, width - ( radius * 2 ), radius, gradient_color, 0, 0, 0, tocolor(255,255,255,255), postGUI  ) -- Bottom
    dxDrawRectangle( x, y + radius, radius, height - ( radius * 2 ), colorParser, postGUI ) -- Left
    dxDrawRectangle( x + width - radius, y + radius, radius, height - ( radius * 2 ), colorParserTwo, postGUI ) -- Right
end

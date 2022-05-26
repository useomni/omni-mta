local components = require('@omni/components')
local utils = require('@omni/utils')
local shaders = require('@omni/shaders')


local gradient_image_color = {}

function omniCreateGradientCircle( id, x, y, width, height, radius, colorOne, opacityOne, colorTwo, opacityTwo, postGUI )
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

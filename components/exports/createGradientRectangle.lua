local components = require('@omni/components')
local utils = require('@omni/utils')
local shaders = require('@omni/shaders')

function omniCreateGradientRectangle( x, y, width, height, radius, colorOne, opacityOne, colorTwo, opacityTwo, postGUI )
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

local components = require('@omni/components')
local utils = require('@omni/utils')

function omniCreateRectangle(x, y, width, height, radius, color, alpha, postGUI, subPixelPositioning)
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

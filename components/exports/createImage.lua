local components = require('@omni/components')
local utils = require('@omni/utils')

function omniCreateImage(x, y, width, height, path, rotx, roty, rotz, color, alpha, postgui)
  dxDrawImage (x, y, width, height, path, rotx, roty, rotz, utils.colorParser(color, alpha), postgui)
end

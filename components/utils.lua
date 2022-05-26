local instance = {}
local components = require('@omni/components')

instance.colorParser = function (color, alpha)
  return tocolor(components.Pallete[tostring(color)][1], components.Pallete[tostring(color)][2], components.Pallete[tostring(color)][3], alpha)
end

module.exports("@omni/utils", instance)

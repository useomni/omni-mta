local components = require('@omni/components')
local utils = require('@omni/utils')

function omniCreateText(text, x, y, width, height, color, alpha, font, size, horizontal, vertical, haligh, valign, clip, wordbreak, postgui)
  dxDrawText(text, x, y, width, height, utils.colorParser(color, alpha), size/100, components.Fonts[font], horizontal, vertical, haligh, valign, clip, wordbreak, postgui)
end

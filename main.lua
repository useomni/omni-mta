local instance = {}


instance.createRectangle = function (x, y, width, height, radius, color, alpha, postGUI, subPixelPositioning)
    return omniCreateRectangle(x, y, width, height, radius, color, alpha, postGUI, subPixelPositioning)
end

instance.createBluredRectangle = function (pos_x, pos_y, size_x, size_y, color, alpha, post_gui)
    return createBluredRectangle (pos_x, pos_y, size_x, size_y, color, alpha, post_gui)
end

instance.createImage = function (x, y, width, height, path, rotx, roty, rotz, color, alpha, postgui)
    return omniCreateImage(x, y, width, height, path, rotx, roty, rotz, color, alpha, postgui)
end

instance.createGradientRectangle = function ( x, y, width, height, radius, colorOne, opacityOne, colorTwo, opacityTwo, postGUI )
    return omniCreateGradientRectangle( x, y, width, height, radius, colorOne, opacityOne, colorTwo, opacityTwo, postGUI )
end

instance.createGradientCircle = function (id, x, y, width, height, radius, colorOne, opacityOne, colorTwo, opacityTwo, postGUI)
    return omniCreateGradientCircle( id, x, y, width, height, radius, colorOne, opacityOne, colorTwo, opacityTwo, postGUI )
end

instance.createText = function (text, x, y, width, height, color, alpha, font, size, horizontal, vertical, haligh, valign, clip, wordbreak, postgui)
    return omniCreateText(text, x, y, width, height, color, alpha, font, size, horizontal, vertical, haligh, valign, clip, wordbreak, postgui)
end

instance.createInput = function ( id, options )
    return omniCreateInput ( id, options )
end

module.exports("omni-system", instance)

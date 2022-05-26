local omni = require('omni-system')

-- addEventHandler("onClientRender", root,
--     function()
--         for i = 0, 1 do
--             --omni.createRectangle( 500, 500, 500, 500, 5, "semantic.positive" )
--             --omni.createInput( "Username", 500, 500, 347, 47, 5, "thirdColor.light", 255, 3, "thirdColor.dark", 255 )
--             --omni.createInput( "Password", 500, 500 + 50, 347, 47, 5, "thirdColor.light", 255, 3, "thirdColor.dark", 255 )
--             omni.createInput( "Username", {
--                 x = 500,
--                 y = 500,
--                 width = 347,
--                 height = 47,
--                 radius = 5,
--                 placeholder = "Username",
--                 color = "neutralColor.500",
--                 alpha = 255,
--                 textColor = "massiveWhite.500",
--                 textAlpha = 255,
--                 hoverText = "massiveWhite.300",
--                 borderSize = 2,
--                 selectable = true,
--                 hover = false,
--                 borderColor = "neutralColor.100.blue",
--                 borderAlpha = 255,
--                 hoverColor = "neutralColor.blue.300",
--                 hoverAlpha = 255,
--             })
--             omni.createInput( "Password", {
--                 x = 500,
--                 y = 500 + 55,
--                 width = 347,
--                 height = 47,
--                 radius = 5,
--                 placeholder = "Password",
--                 color = "neutralColor.500",
--                 alpha = 255,
--                 textColor = "massiveWhite.500",
--                 textAlpha = 255,
--                 hoverText = "massiveWhite.300",
--                 borderSize = 2,
--                 selectable = false,
--                 hover = false,
--                 borderColor = "neutralColor.100.blue",
--                 borderAlpha = 255,
--                 hoverColor = "neutralColor.300",
--                 hoverAlpha = 255,
--             })
--             --omni.createCircle( "omni", 500, 500, 500, 500, 360, "semantic.positive", 255, "semantic.negative", 255 )
--             --omni.createCircle( "omni2", 500 + 500, 500, 500, 500, 360, tocolor( 255, 0, 0, 255 ), tocolor( 0, 0, 255, 255 ) )
--             --omni.createText( "Omni-System", 500 + 500 / 2 - 90 / 2, 500 + 500 / 2 - 90 / 2, 0, 0, "massiveWhite.100", "roboto.Medium", 10 )
--         end
--     end
-- )


addEventHandler("onClientRender", root, function ()
    omni.createRectangle(0, 0, 500, 500, 50, "semantic.positive", 255, false, false)
    omni.createBluredRectangle(0, 0, 600, 900, "neutralColor.900", 255, false)
    omni.createText("hi Azedo", 0, 0, 500, 200, "semantic.positive", 255, "roboto.Bold", 50, "center", "center", false, false, false, false, false)
    omni.createImage(0, 0, 50, 50, ":guieditor/images/dx_elements/checkbox_tick.png", 0, 0, 0, "neutralColor.100", 255, false)
    omni.createGradientRectangle(0, 0, 600, 600, 10, "semantic.positive", 255, "semantic.negative", 255, false)
    omni.createGradientCircle(1, 0, 0, 299, 200, 200, "secondColor.light", 255, "secondColor.gray", 10, false)
end)

bindKey( "m", "down",
    function()
        if isCursorShowing() then
            showCursor( false )
        else
            showCursor( true, true )
        end
    end
)

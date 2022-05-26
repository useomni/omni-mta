local omni = require('omni-system')

addEventHandler("onClientRender", root,
    function()
        for i = 0, 1 do
            --omni.createRectangle( 500, 500, 500, 500, 5, "semantic.positive" )
            omni.createInput( "Username", 500, 500, 347, 47, 5, "thirdColor.light", 255, 3, "thirdColor.dark", 255 )
            omni.createInput( "Password", 500, 500 + 50, 347, 47, 5, "thirdColor.light", 255, 3, "thirdColor.dark", 255 )
            omni.createInput( "Username", {
                x = 500,
                y = 500,
                width = 347,
                height = 47,
                radius = 5,
                color = "neutralColor.500",
                alpha = 255,
                borderSize = 2,
                selectable = true,
                hover = false,
                borderColor = "neutralColor.100.blue",
                borderAlpha = 255,
                hoverColor = "neutralColor.500.blue",
                hoverAlpha = 255,
            })
            --omni.createCircle( "omni", 500, 500, 500, 500, 360, "semantic.positive", 255, "semantic.negative", 255 )
            --omni.createCircle( "omni2", 500 + 500, 500, 500, 500, 360, tocolor( 255, 0, 0, 255 ), tocolor( 0, 0, 255, 255 ) )
            --omni.createText( "Omni-System", 500 + 500 / 2 - 90 / 2, 500 + 500 / 2 - 90 / 2, 0, 0, "massiveWhite.100", "roboto.Medium", 10 )
        end
    end
)

bindKey( "m", "down",
    function()
        if isCursorShowing() then
            showCursor( false )
        else
            showCursor( true, true )
        end
    end
)
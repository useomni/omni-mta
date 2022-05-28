local omni = require('omni-system')

addEventHandler("onClientRender", root,
    function()
        omni.createInput( "Username", {
            x = 500,
            y = 500,
            width = 347,
            height = 47,
            radius = 5,
            paddingX = 20,
            paddingY = 20,
            --color = "neutralColor.500",
            --alpha = 255,
            infos = {
                --     textColor = "massiveWhite.500", 
                --     textAlpha = 255, 
                --     hoverColor = "neutralColor.300", 
                --     hoverAlpha = 255, 
                --     hoverText = "massiveWhite.300", 
                --     hoverTextAlpha = 255, 
                --     font = "roboto.Regular", 
                selectable = true,
                placeholder = "Username",
                characterLimit = 38,
                paddingX = 35,
                paddingY = 15,
            },
            borders = {
                -- borderSize = 2, 
                -- borderColor = "neutralColor.100.blue", 
                -- maxAlpha = 255, 
            },
            icons = { -- TOTALMENTE  ( Mas se colocar um icon é totalmente necessario todos )
                -- icon = [[
                --     <svg width="20" height="21" viewBox="0 0 20 21" fill="none" xmlns="http://www.w3.org/2000/svg">
                --         <path d="M12.9938 3.02266C12.2336 2.20195 11.1719 1.75 10 1.75C8.82192 1.75 7.75668 2.19922 7.00004 3.01484C6.23519 3.83945 5.86254 4.96016 5.95004 6.17031C6.12348 8.55781 7.94028 10.5 10 10.5C12.0598 10.5 13.8735 8.5582 14.0497 6.17109C14.1383 4.97187 13.7633 3.85352 12.9938 3.02266Z" fill="#505059"/>
                --         <path d="M16.8752 19.25H3.12522C2.94525 19.2523 2.76702 19.2145 2.60349 19.1393C2.43997 19.0641 2.29526 18.9534 2.17991 18.8152C1.926 18.5117 1.82366 18.0973 1.89944 17.6781C2.22913 15.8492 3.25804 14.3129 4.87522 13.2344C6.31194 12.277 8.13186 11.75 10.0002 11.75C11.8686 11.75 13.6885 12.2773 15.1252 13.2344C16.7424 14.3125 17.7713 15.8488 18.101 17.6777C18.1768 18.0969 18.0744 18.5113 17.8205 18.8148C17.7052 18.9531 17.5605 19.0639 17.397 19.1391C17.2335 19.2144 17.0552 19.2523 16.8752 19.25Z" fill="#505059"/>
                --     </svg>
                -- ]],
                -- iconWidth = 20,
                -- iconHeight = 21,
                -- iconColor = "neutralColor.100",
                -- iconAlpha = 255,
                -- hoverIcon = "massiveWhite.300",
                -- hoverIconAlpha = 255,
                -- paddingX = 10,
                -- paddingY = 11,
            },
        })
        omni.createInput( "Password", {
            x = 500,
            y = 550,
            width = 347,
            height = 47,
            radius = 5,
            paddingX = 20,
            paddingY = 20,
            color = "neutralColor.500",
            alpha = 255,
            infos = {
                    textColor = "massiveWhite.500", 
                    textAlpha = 255, 
                    hoverColor = "neutralColor.300", 
                    hoverAlpha = 255, 
                    hoverText = "massiveWhite.300", 
                    hoverTextAlpha = 255, 
                    font = "roboto.Regular", 
                selectable = true,
                placeholder = "Username",
                characterLimit = 38,
                paddingX = 35,
                paddingY = 15,
            },
            borders = {
                borderSize = 2, 
                borderColor = "neutralColor.100.blue", 
                maxAlpha = 255, 
            },
            icons = {
                icon = [[
                    <svg width="20" height="21" viewBox="0 0 20 21" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M12.9938 3.02266C12.2336 2.20195 11.1719 1.75 10 1.75C8.82192 1.75 7.75668 2.19922 7.00004 3.01484C6.23519 3.83945 5.86254 4.96016 5.95004 6.17031C6.12348 8.55781 7.94028 10.5 10 10.5C12.0598 10.5 13.8735 8.5582 14.0497 6.17109C14.1383 4.97187 13.7633 3.85352 12.9938 3.02266Z" fill="#505059"/>
                        <path d="M16.8752 19.25H3.12522C2.94525 19.2523 2.76702 19.2145 2.60349 19.1393C2.43997 19.0641 2.29526 18.9534 2.17991 18.8152C1.926 18.5117 1.82366 18.0973 1.89944 17.6781C2.22913 15.8492 3.25804 14.3129 4.87522 13.2344C6.31194 12.277 8.13186 11.75 10.0002 11.75C11.8686 11.75 13.6885 12.2773 15.1252 13.2344C16.7424 14.3125 17.7713 15.8488 18.101 17.6777C18.1768 18.0969 18.0744 18.5113 17.8205 18.8148C17.7052 18.9531 17.5605 19.0639 17.397 19.1391C17.2335 19.2144 17.0552 19.2523 16.8752 19.25Z" fill="#505059"/>
                    </svg>
                ]],
                iconWidth = 20,
                iconHeight = 21,
                iconColor = "neutralColor.100",
                iconAlpha = 255,
                hoverIcon = "massiveWhite.300",
                hoverIconAlpha = 255,
                paddingX = 10,
                paddingY = 11,
            },
        })
    end
)




--  addEventHandler("onClientRender", root, function ()
--     omni.createCircleLine(670, 649, 150,150, "semantic.negative", 220, 280, 13, 100)
--        --dxDrawRoundedRectangle(350, 50, 100, 100, tocolor(0, 255, 0, 255), 20)
--      omni.createRectangle(0, 0, 500, 500, 50, "semantic.positive", 255, false, false)
--     omni.createBluredRectangle(0, 0, 600, 900, "neutralColor.900", 255, false)
--      omni.createText("hi Azedo", 0, 0, 500, 200, "semantic.positive", 255, "rajdhani.Bold", 100, "center", "center", false, false, false, false, false)
--     omni.createImage(0, 0, 50, 50, ":guieditor/images/dx_elements/checkbox_tick.png", 0, 0, 0, "neutralColor.100", 255, false)
--      omni.createGradientRectangle(0, 0, 600, 600, 10, "semantic.positive", 255, "semantic.negative", 255, false)
--     omni.createGradientCircle(1, 0, 0, 299, 200, 200, "secondColor.light", 255, "secondColor.gray", 10, false)
--  end)

bindKey( "m", "down",
    function()
        if isCursorShowing() then
            showCursor( false )
        else
            showCursor( true, true )
        end
    end
)
local instance = {}
local components = require('@omni/components')
local gradientShader = dxCreateShader( components.Shaders["gradient"] )

instance.gradientColor = function( colorOne, colorTwo )
    if colorOne then
        local redOne = bitExtract(colorOne, 16, 8)
        local greenOne = bitExtract(colorOne, 8, 8)
        local blueOne = bitExtract(colorOne, 0, 8)
        local alphaOne = bitExtract(colorOne, 24, 8)

        dxSetShaderValue( gradientShader, "startColor", redOne/255, greenOne/255, blueOne/255, alphaOne/255 )
    end
    if colorTwo then
        local redTwo = bitExtract(colorTwo, 16, 8)
        local greenTwo = bitExtract(colorTwo, 8, 8)
        local blueTwo = bitExtract(colorTwo, 0, 8)
        local alphaTwo = bitExtract(colorTwo, 24, 8)

        dxSetShaderValue( gradientShader, "endColor", redTwo/255, greenTwo/255, blueTwo/255, alphaTwo/255 )
    end
    return gradientShader
end

instance.gradientSVG = function( width, height, radius, colorOne, colorTwo )
    local colors = {}
    if colorOne then
        local redOne = bitExtract(colorOne, 16, 8)
        local greenOne = bitExtract(colorOne, 8, 8)
        local blueOne = bitExtract(colorOne, 0, 8)
        local alphaOne = bitExtract(colorOne, 24, 8)

        colors.one = { redOne, greenOne, blueOne, alphaOne }
    end
    if colorTwo then
        local redTwo = bitExtract(colorTwo, 16, 8)
        local greenTwo = bitExtract(colorTwo, 8, 8)
        local blueTwo = bitExtract(colorTwo, 0, 8)
        local alphaTwo = bitExtract(colorTwo, 24, 8)
        colors.two = { redTwo, greenTwo, blueTwo, alphaTwo }
    end
    local rawSvgData = [[
        <svg viewBox="0 0 ]].. width * 2 ..[[ ]].. height * 2 ..[[" xmlns="http://www.w3.org/2000/svg">
            <linearGradient id="grad1" x1="0%" y1="0%" x2="100%" y2="0%">
                <stop offset="0%" style="stop-color:rgb(]].. colors.one[1] ..[[, ]].. colors.one[2] ..[[, ]].. colors.one[3] ..[[);stop-opacity:]].. colors.one[4]/255 ..[[" />
                <stop offset="100%" style="stop-color:rgb(]].. colors.two[1] ..[[, ]].. colors.two[2] ..[[, ]].. colors.two[3] ..[[);stop-opacity:]].. colors.two[4]/255 ..[[" />
            </linearGradient>
            <circle cx="]].. width ..[[" cy="]].. height ..[[" r="]].. radius ..[[" fill="url(#grad1)" />
        </svg>
    ]]
    local svgImg = svgCreate( width, height, rawSvgData )
    return svgImg
end



module.exports("@omni/shaders", instance)
local utils = require('@omni/utils')



function omniCreateCircleLine( x, y, width, height, color, angleStart, angleSweep, borderWidth, alpha )
	height = height or width
	-- color = color or tocolor(255,255,255)
	borderWidth = borderWidth or 1e9
	angleStart = angleStart or 0
	angleSweep = angleSweep or 360 - angleStart
	if ( angleSweep < 360 ) then
		angleEnd = math.fmod( angleStart + angleSweep, 360 ) + 0
	else
		angleStart = 0
		angleEnd = 360
	end
	x = x - width / 2
	y = y - height / 2
	if not circleShader then
		circleShader = dxCreateShader ( "components/shaders/hou_circle.fx" )
	end
	dxSetShaderValue ( circleShader, "sCircleWidthInPixel", width );
	dxSetShaderValue ( circleShader, "sCircleHeightInPixel", height );
	dxSetShaderValue ( circleShader, "sBorderWidthInPixel", borderWidth );
	dxSetShaderValue ( circleShader, "sAngleStart", math.rad( angleStart ) - math.pi );
	dxSetShaderValue ( circleShader, "sAngleEnd", math.rad( angleEnd ) - math.pi );
	dxDrawImage( x, y, width, height, circleShader, 0, 0, 0, utils.colorParser(color, alpha) )
end

local instance = {}

instance.Pallete = {
    -- Semantic
    ["semantic.positive"] = { 4, 211, 97 },
    ["semantic.negative"] = { 255, 83, 67 },

    -- Primary Colors
    ["primaryColor.light"] = { 106, 128, 255 },
    ["primaryColor.gray"] = { 72, 99, 247 },
    ["primaryColor.mid"] = { 50, 73, 203 },
    ["primaryColor.dark"] = { 24, 32, 73 },


    -- Second Colors
    ["secondColor.light"] = { 0, 179, 126 },
    ["secondColor.gray"] = { 0, 135, 95 },
    ["secondColor.mid"] = { 1, 95, 67 },
    ["secondColor.dark"] = { 0, 41, 29 },


    -- Third Colors
    ["thirdColor.light"] = { 252, 71, 55 },
    ["thirdColor.gray"] = { 215, 54, 40 },
    ["thirdColor.mid"] = { 173, 30, 18 },
    ["thirdColor.dark"] = { 66, 17, 13 },


    -- Fourth Colors
    ["fourthColor.light"] = { 153, 109, 255 },
    ["fourthColor.gray"] = { 130, 87, 229 },
    ["fourthColor.mid"] = { 99, 59, 188 },
    ["fourthColor.dark"] = { 39, 26, 69 },


    -- Neutral Colors / White
    ["neutralColor.100"] = { 242, 242, 250 },
    ["neutralColor.200"] = { 225, 225, 230 },
    ["neutralColor.300"] = { 168, 168, 179 },
    ["neutralColor.400"] = { 41, 41, 46 },
    ["neutralColor.500"] = { 32, 32, 36 },
    ["neutralColor.600"] = { 18, 18, 20 },
    ["neutralColor.900"] = { 16, 16, 17 },
    ["neutralColor.1000"] = { 0, 0, 0 },

    -- Neutral Colors / Blue
    ["neutralColor.100.blue"] = { 33, 150, 253 },
    ["neutralColor.200.blue"] = { 40, 121, 212 },
    ["neutralColor.300.blue"] = { 14, 109, 192 },
    ["neutralColor.400.blue"] = { 39, 40, 55 },
    ["neutralColor.500.blue"] = { 29, 31, 46 },
    ["neutralColor.600.blue"] = { 22, 23, 36 },

    -- Neutral Colors  / Gray
    ["neutralColor.100.gray"] = { 105, 105, 117 },
    ["neutralColor.200.gray"] = { 87, 87, 97 },
    ["neutralColor.300.gray"] = { 41, 41, 46 },
    ["neutralColor.400.gray"] = { 32, 32, 36 },
    ["neutralColor.500.gray"] = { 28, 28, 30 },
    ["neutralColor.600.gray"] = { 16, 16, 17 },

    -- Massive Colors
    ["massiveWhite.100"] = { 225, 225, 230 },
    ["massiveWhite.200"] = { 196, 196, 204 },
    ["massiveWhite.300"] = { 141, 141, 153 },
    ["massiveWhite.400"] = { 124, 124, 138 },
    ["massiveWhite.500"] = { 80, 80, 89 },
    ["massiveWhite.600"] = { 50, 50, 56 },
    ["massiveWhite.700"] = { 41, 41, 46 },
    ["massiveWhite.800"] = { 32, 32, 36 },
    ["massiveWhite.900"] = { 18, 18, 20 },
    ["massiveWhite.1000"] = { 9, 9, 10 },


    -- Massive Colors
    ["massiveBlur.100"] = { 138, 138, 255 },
    ["massiveBlur.200"] = { 117, 117, 251 },
    ["massiveBlur.300"] = { 93, 93, 252 },
    ["massiveBlur.400"] = { 79, 79, 207 },
    ["massiveBlur.500"] = { 62, 62, 189 },
    ["massiveBlur.600"] = { 48, 48, 164 },
    ["massiveBlur.700"] = { 42, 42, 133 },
    ["massiveBlur.800"] = { 33, 33, 129 },
    ["massiveBlur.900"] = { 20, 0, 90 },
    ["massiveBlur.1000"] = { 18, 18, 69 },
}

instance.Fonts = {
    ["poppins.Light"] = dxCreateFont("components/fonts/Poppins/poppinsLight.ttf", 100),
    ["poppins.Regular"] = dxCreateFont("components/fonts/Poppins/poppinsRegular.ttf", 100),
    ["poppins.Medium"] = dxCreateFont("components/fonts/Poppins/poppinsMedium.ttf", 100),
    ["poppins.Bold"] = dxCreateFont("components/fonts/Poppins/poppinsBold.ttf", 100),

    ["roboto.Light"] = dxCreateFont("components/fonts/Roboto/robotoLight.ttf", 100),
    ["roboto.Regular"] = dxCreateFont("components/fonts/Roboto/robotoRegular.ttf", 100),
    ["roboto.Medium"] = dxCreateFont("components/fonts/Roboto/robotoMedium.ttf", 100),
    ["roboto.Bold"] = dxCreateFont("components/fonts/Roboto/robotoBold.ttf", 100),

    ["opensans.Light"] = dxCreateFont("components/fonts/OpenSans/opensansLight.ttf", 100),
    ["opensans.Regular"] = dxCreateFont("components/fonts/OpenSans/opensansRegular.ttf", 100),
    ["opensans.Medium"] = dxCreateFont("components/fonts/OpenSans/opensansMedium.ttf", 100),
    ["opensans.Bold"] = dxCreateFont("components/fonts/OpenSans/opensansBold.ttf", 100)
}

instance.Shaders = {
    ["gradient"] = "components/shaders/gradient.fx",
    ["mta-helper"] = "components/shaders/mta-helper.fx",
    ["blurH"] = "components/shaders/blurH.fx",
    ["blurV"] = "components/shaders/blurV.fx",
}

module.exports("@omni/components", instance)

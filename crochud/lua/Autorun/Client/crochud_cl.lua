surface.CreateFont( "TheDefaultSettings", {
	font = "Garamond", --  Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = 30,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = true,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

surface.CreateFont( "NewFont", {
	font = "Bauhaus 93", --  Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = 30,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = true,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

local hide = {
	["CHudHealth"] = true,
	["CHudBattery"] = true,
	["CHudAmmo"] = false,
	["CHudSecondaryAmmo"] = false
}

hook.Add( "HUDShouldDraw", "HideHUD", function( name )
	if ( hide[ name ] ) then
		return false
	end 

	-- Don't return anything here, it may break other addons that rely on this hook.
end )

hook.Add("HUDPaint" , "DrawMyHud" , function()

    local health = LocalPlayer():Health()
    local armor = LocalPlayer():Armor()
 
	draw.RoundedBox(10,5,ScrH() - 130,300 + 10,120 + 4,Color(53,53,53))
    draw.RoundedBox(5,8,ScrH() - 52,300 + 4,30 + 4,Color(109,97,96))
    draw.RoundedBox(5,10,ScrH() - 50,math.min(health, 100) / 42.52 * 128,30,Color(253,103,92))
    draw.SimpleText(health.. "%","TheDefaultSettings",10 + 120,ScrH() - 50, Color(255,255,255))

    draw.RoundedBox(5,8,ScrH() - 100,300 + 4,30 + 4,Color(109,97,96))
    draw.RoundedBox(5,10,ScrH() - 98,math.min(armor, 100) / 42.52 * 128,30,Color(96,180,236))
    draw.SimpleText(armor.. "%","TheDefaultSettings",10 + 120,ScrH() - 97, Color(255,255,255))

	draw.SimpleText("CrocHUD","NewFont",95,950,Color(255,255,255)) --Change name "CrocHUD" to whatever you like


end)
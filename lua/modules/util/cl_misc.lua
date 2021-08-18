Mint = Mint or {}
Mint.Helper = Mint.Helper or {}

function Mint.Helper.drawOutline( Start, Start2, End, End2, color )
	surface.SetDrawColor(color)
	surface.DrawOutlinedRect( Start, Start2, End, End2 )
end

function Mint.Helper.drawRectan( Startx, StartY, Width, Length, Color )
	surface.SetDrawColor(Color)
	surface.DrawRect( Startx, StartY, Width, Length )
end

function Mint.Helper.getTextSize(text, font, wide)
	surface.SetFont(font)
	local w, h = surface.GetTextSize( text )
	if wide then
		return w
	else
		return w, h
	end
end

function Mint.Helper.getLargestSizeText(text, text2, font)
     surface.SetFont(font)

	local w, h = surface.GetTextSize( text )
     local x, y = surface.GetTextSize( text2 )

     if (x > w) then return x else return w end
end
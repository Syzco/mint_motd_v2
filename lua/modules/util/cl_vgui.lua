Mint = Mint or {}
Mint.windows = Mint.windows or {}

local blur = Material("pp/blurscreen")
function Mint.drawBlur( x, y, w, h, amount )
	surface.SetDrawColor( 255, 255, 255, 255 )
	surface.SetMaterial( blur )

	for i = 1, 6 do
		blur:SetFloat( "$blur", ( i / 3 ) * ( amount or 6 ) )
		blur:Recompute()

		render.UpdateScreenEffectTexture()
		render.SetScissorRect( x, y, x + w, y + h, true )
			surface.DrawTexturedRect( 0, 0, ScrW(), ScrH() )
		render.SetScissorRect( 0, 0, 0, 0, false )
	end
end

function Mint.buildBlurBackground(intensity, color) 
     if (IsValid(Mint.windows.blur)) then return end

     Mint.windows.blur = vgui.Create("DPanel")
     Mint.windows.blur:SetPos(0, 0)
     Mint.windows.blur:SetSize(ScrW(), ScrH())
     Mint.windows.blur.Paint = function(self, w, h)
          Mint.drawBlur( 0, 0, w, h, intensity)
          draw.RoundedBox( 0, 0, 0, w, h, color)
     end
end

function Mint.close() 
     for k, v in pairs(Mint.windows) do
          if (IsValid(v)) then
               v:Remove()
          end
     end
end
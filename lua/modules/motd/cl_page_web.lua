function Mint.Motd.Web(tbl)
     if not IsValid(Mint.windows.Motd) then return end

	Mint.windows.Motd.panel = vgui.Create( "DPanel", Mint.windows.Motd )
	Mint.windows.Motd.panel:SetSize( ScrW(), ScrH()-235 )
	Mint.windows.Motd.panel:SetPos( ScrW(), Mint.Motd.contentStart )
	Mint.windows.Motd.panel:MoveTo( 0, Mint.Motd.contentStart, Mint.motd.config.SpeedAnimations, .05 )
	Mint.windows.Motd.panel.Paint = function(self, w, h)
		draw.RoundedBox( 0, 0, 0, w, h, Mint.motd.config.Color.Background )
		draw.SimpleText( "Loading...", "motd_option_btn", w/2, h/2-15, Mint.motd.config.Color.Text, TEXT_ALIGN_CENTER )
	end

	local WebPage = vgui.Create("DHTML", Mint.windows.Motd.panel)
	WebPage:SetPos(0, 0)
	WebPage:SetSize(Mint.windows.Motd.panel:GetWide(), Mint.windows.Motd.panel:GetTall())
	WebPage:OpenURL(tbl.URL)
end
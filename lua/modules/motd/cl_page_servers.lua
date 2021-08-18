function Mint.Motd.Servers()
	Mint.windows.Motd.panel = vgui.Create( "DPanel", Mint.windows.Motd )
	Mint.windows.Motd.panel:SetSize( ScrW(), ScrH()-235 )
	Mint.windows.Motd.panel:SetPos( ScrW(), Mint.Motd.contentStart )
	Mint.windows.Motd.panel:MoveTo( 0, Mint.Motd.contentStart, Mint.motd.config.SpeedAnimations, .05 )
	Mint.windows.Motd.panel.Paint = function(self, w, h)
		draw.RoundedBox( 0, 0, 0, w, h, Mint.motd.config.Color.Background )
		draw.SimpleText( string.upper("servers"), "motd_server_title", w/2, 15, Mint.motd.config.Color.Text, TEXT_ALIGN_CENTER )
	end
	local ServerScroll = vgui.Create( "DScrollPanel", Mint.windows.Motd.panel )
	ServerScroll:SetSize( Mint.windows.Motd.panel:GetWide()-225, Mint.windows.Motd.panel:GetTall()-200)
	ServerScroll:SetPos( 125, 100 )
	ServerScroll.VBar.Paint = function(self, w, h)
		
	end
	ServerScroll.VBar.btnUp.Paint = function(self, w, h)
	end
	ServerScroll.VBar.btnDown.Paint = function(self, w, h)
	end
	ServerScroll.VBar.btnGrip.Paint = function(self, w, h)	
		draw.RoundedBox( 6, 0, 0, w, h, Mint.motd.config.Color.SecondBackground )
	end

	local ServerList = vgui.Create( "DIconLayout", ServerScroll )
	ServerList:SetSize( ServerScroll:GetWide(), ServerScroll:GetTall() )
	ServerList:SetPos( 0, 0 )
	ServerList:SetSpaceY( 20 )
	ServerList:SetSpaceX( 0 )

	for k, v in pairs(Mint.motd.config.Servers) do
		local Server = vgui.Create( "DPanel" )
		Server:SetSize( ServerList:GetWide()-25, 80 )
		Server.Paint = function(self, w, h)
			draw.RoundedBox( 0, 0, 0, w, h, Mint.motd.config.Color.Lightground )
			draw.SimpleText( v.Name, "motd_server_screen_name", 20, 13, Mint.motd.config.Color.Text, TEXT_ALIGN_LEFT )
			draw.SimpleText( v.IP, "motd_server_ip", 22, 43, Mint.motd.config.Color.Text, TEXT_ALIGN_LEFT )
		end

		if v.GameTracker then
			local WebPage = vgui.Create("DHTML", Server)
			WebPage:SetSize(350, 20)
			WebPage:SetPos(Server:GetWide()/2-175, 30)
			WebPage:OpenURL("http://cache.www.gametracker.com/server_info/"..v.IP.."/b_350_20_323957_202743_F19A15_111111.png")
		end

		local Join = vgui.Create( "DButton", Server )
		Join:SetSize( 120, 50 )
		Join:SetPos( Server:GetWide()-135, 15 )
		Join:SetText( "" )
		Join:SetFont( "Marlett" )
		Join.Paint = function(self, w, h)
			draw.RoundedBox( 0, 0, 0, w, h, Mint.motd.config.Color.PrimaryColor )
			draw.SimpleText( "JOIN", "motd_server_btn", w/2, 7, Mint.motd.config.Color.Text, TEXT_ALIGN_CENTER )
		end
		Join.DoClick = function()
			LocalPlayer():ConCommand( "connect "..v.IP )		
		end
		ServerList:Add(Server)
	end
end
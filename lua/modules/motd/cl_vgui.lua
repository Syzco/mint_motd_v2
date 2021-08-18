surface.CreateFont( "motd_server_name", {
	font = "Bebas Neue",
	size = 85,
	weight = 500
} )
surface.CreateFont( "motd_server_title", {
	font = "Bebas Neue",
	size = 78,
	weight = 500
} )

surface.CreateFont( "motd_option_btn", {
	font = "Bebas Neue",
	size = 50,
	weight = 500
} )

surface.CreateFont( "motd_server_btn", {
	font = "Bebas Neue",
	size = 40,
	weight = 400
} )

surface.CreateFont( "motd_timer", {
	font = "Bebas Neue",
	size = 34,
	weight = 500
} )
surface.CreateFont( "motd_server_screen_name", {
	font = "Bebas Neue",
	size = 38,
	weight = 500
} )
surface.CreateFont( "motd_server_ip", {
	font = "Bebas Neue",
	size = 22,
	weight = 400
} )

surface.CreateFont( "motd_rules", {
	font = "Roboto",
	size = 22,
	weight = 450
} )

Mint.Motd.contentStart = 118

function Mint.Motd.buildPopup()
     local join = net.ReadBool() or false
	local close = "materials/motd/close.png"
     
	Mint.windows.Motd = vgui.Create( "DFrame" ) 
	Mint.windows.Motd:SetSize( ScrW(), ScrH() )
	Mint.windows.Motd:Center()
	Mint.windows.Motd:SetTitle( " " ) 
	Mint.windows.Motd:SetVisible( true )
	Mint.windows.Motd:SetDraggable( false ) 
	Mint.windows.Motd:ShowCloseButton( false ) 				
	Mint.windows.Motd:MakePopup() 
	Mint.windows.Motd.OpenPanel = ""
	Mint.windows.Motd.Paint = function(self, w, h)
	end
     
	Mint.windows.Motd.title = vgui.Create( "DPanel", Mint.windows.Motd )

	Mint.windows.Motd.title:SetPos( (ScrW()/2)-(Mint.Helper.getTextSize(Mint.motd.config.ServerName, "motd_server_name", true)/2), -(select(2, Mint.Helper.getTextSize(Mint.motd.config.ServerName, "motd_server_name", false))) )

	Mint.windows.Motd.title:MoveTo( (ScrW()/2)-(Mint.Helper.getTextSize(Mint.motd.config.ServerName, "motd_server_name", true)/2), 35, Mint.motd.config.SpeedAnimations, .05 )

	Mint.windows.Motd.title:SetSize( Mint.Helper.getTextSize(Mint.motd.config.ServerName, "motd_server_name", true), select(2, Mint.Helper.getTextSize(Mint.motd.config.ServerName, "motd_server_name", false)) )
	Mint.windows.Motd.title.Paint = function(self, w, h)
		draw.SimpleText( string.upper(Mint.motd.config.ServerName), "motd_server_name", w/2, 0, Mint.motd.config.Color.Text, TEXT_ALIGN_CENTER )
	end

	Mint.windows.Motd.close = vgui.Create( "DButton", Mint.windows.Motd )
	Mint.windows.Motd.close:SetSize( 100, 33 )
	Mint.windows.Motd.close:SetPos( ScrW(), 60 )
	Mint.windows.Motd.close:MoveTo( ScrW()-100, 60, Mint.motd.config.SpeedAnimations, .05 )
	Mint.windows.Motd.close:SetText( "" )
	Mint.windows.Motd.close:SetFont( "Marlett" )
	if join then
		Mint.windows.Motd.close:SetEnabled(false)
	else
		Mint.windows.Motd.close:SetEnabled(true)
		Mint.windows.Motd.close.Enable = true
	end
	Mint.windows.Motd.close.Paint = function(self, w, h)
		draw.RoundedBox( 0, 0, 0, w, h, Mint.motd.config.Color.Background )
		surface.SetDrawColor(Color(255, 255, 255, 255))
		surface.SetMaterial( Material(close) )
		if Mint.windows.Motd.close.Enable then
			surface.DrawTexturedRect(4, 2, 29, 29)
		elseif timer.Exists("ReadRules") then
			draw.SimpleText( math.Round(timer.TimeLeft("ReadRules")), "motd_timer", 12, 0, Mint.motd.config.Color.Text, TEXT_ALIGN_LEFT )
		end
	end
	Mint.windows.Motd.close.DoClick = function()
		Mint.close()          

		if Mint.motd.config.Color.NCSupport and NC then
			if NC.callOnMOTDClose then
				NC:openNCMenuJoin()
			end
		end	
          
          net.Start("mint_close_motd")
          net.SendToServer()

          hook.Run("PlayerClosedMOTD", LocalPlayer(), join)
	end

	if join then
		timer.Create("ReadRules", Mint.motd.config.TimerAmount, 1, function()
			Mint.windows.Motd.close:SetEnabled(true)
			Mint.windows.Motd.close.Enable = true
		end)
	end

	local CommandScrollPanel = vgui.Create( "DScrollPanel", Mint.windows.Motd )
	CommandScrollPanel:SetSize(Mint.Motd.getButtonWidth()+((table.Count(Mint.motd.config.Options)-1)*50), 90 )
	CommandScrollPanel:SetPos( (ScrW()/2)-(Mint.Motd.getButtonWidth()+((table.Count(Mint.motd.config.Options)-1)*50))/2, ScrH() )
	CommandScrollPanel:MoveTo( (ScrW()/2)-(Mint.Motd.getButtonWidth()+((table.Count(Mint.motd.config.Options)-1)*50))/2, ScrH()-90, Mint.motd.config.SpeedAnimations, .05 )
	CommandScrollPanel.VBar.Paint = function(self, w, h)
	end
	CommandScrollPanel.VBar.btnUp.Paint = function(self, w, h)
	end
	CommandScrollPanel.VBar.btnDown.Paint = function(self, w, h)
	end
	CommandScrollPanel.VBar.btnGrip.Paint = function(self, w, h)	
	end
	
	local CommandList = vgui.Create( "DIconLayout", CommandScrollPanel )
	CommandList:SetSize( CommandScrollPanel:GetWide(), CommandScrollPanel:GetTall() )
	CommandList:SetPos( 0, 0 )
	CommandList:SetSpaceX( 50 )
	CommandList:SetSpaceY( 0 )

	for k, v in pairs(Mint.motd.config.Options) do
		local HoverTop
		local HoverBot
		local SettingOptionButton = vgui.Create( "DButton" )
		SettingOptionButton:SetSize( Mint.Motd.getButtonSize(v.Title)+10, 80 )
		SettingOptionButton:SetPos( 0, 0 )
		SettingOptionButton:SetText( "" )
		SettingOptionButton:SetTextColor( Color(235, 72, 73) )
		SettingOptionButton.Paint = function(self, w, h)
			draw.SimpleText( v.Title, "motd_option_btn", w/2, 18, Mint.motd.config.Color.Text, TEXT_ALIGN_CENTER )
		end
		SettingOptionButton.DoClick = function()
			if Mint.windows.Motd.OpenPanel != v.Title then
				Mint.Motd.nextOption(Mint.Motd.GetActivePanel(Mint.windows.Motd.OpenPanel))
				timer.Simple(0.075, function()
					if v.Type == "rules" then
						Mint.Motd.Rules(v)
						Mint.windows.Motd.OpenPanel = v.Title
						ActiveTop:Remove()
						ActiveBot:Remove()
					elseif v.Type == "site" then
						Mint.Motd.Web(v)
						Mint.windows.Motd.OpenPanel = v.Title
						ActiveTop:Remove()
						ActiveBot:Remove()
					elseif v.Type == "server" then
						Mint.Motd.Servers()
						Mint.windows.Motd.OpenPanel = v.Title
						ActiveTop:Remove()
						ActiveBot:Remove()
					end
				end)
			end
		end
		SettingOptionButton.OnCursorEntered = function( self )
			self.hover = true
		end
		SettingOptionButton.OnCursorExited = function( self )
			self.hover = false
		end
		SettingOptionButton.Think = function(self)
			if self.hover == true and string.lower(Mint.windows.Motd.OpenPanel) != string.lower(v.Title) then
				if not IsValid(HoverTop) then
					HoverTop = vgui.Create( "DPanel", self )
					HoverTop:SetPos( 0, 0 )
					HoverTop:MoveTo( 0, 15, Mint.motd.config.ButtonAnimations, .05 )
					HoverTop:SetSize( Mint.Motd.getButtonSize(v.Title)+10, 3 )
					HoverTop.Paint = function(hover, w, h)
						Mint.Helper.drawRectan( 0, 0, w, h, Mint.motd.config.Color.PrimaryColor )
					end
				end
				if not IsValid(HoverBot) then
					HoverBot = vgui.Create( "DPanel", self )
					HoverBot:SetPos( 0, 74 )
					HoverBot:MoveTo( 0, 62, Mint.motd.config.ButtonAnimations, .05 )
					HoverBot:SetSize( Mint.Motd.getButtonSize(v.Title)+10, 3 )
					HoverBot.Paint = function(hover, w, h)
						Mint.Helper.drawRectan( 0, 0, w, h, Mint.motd.config.Color.PrimaryColor )
					end
				end
			end
			if string.lower(Mint.windows.Motd.OpenPanel) == string.lower(v.Title) then
				if not IsValid(ActiveTop) then
					ActiveTop = vgui.Create( "DPanel", self )
					ActiveTop:SetPos( 0, 0 )
					ActiveTop:MoveTo( 0, 15, Mint.motd.config.ButtonAnimations, .05 )
					ActiveTop:SetSize( Mint.Motd.getButtonSize(v.Title)+10, 3 )
					ActiveTop.Paint = function(hover, w, h)
						Mint.Helper.drawRectan( 0, 0, w, h, Mint.motd.config.Color.PrimaryColor )
					end
				end
				if not IsValid(ActiveBot) then
					ActiveBot = vgui.Create( "DPanel", self )
					ActiveBot:SetPos( 0, 74 )
					ActiveBot:MoveTo( 0, 62, Mint.motd.config.ButtonAnimations, .05 )
					ActiveBot:SetSize( Mint.Motd.getButtonSize(v.Title)+10, 3 )
					ActiveBot.Paint = function(hover, w, h)
						Mint.Helper.drawRectan( 0, 0, w, h, Mint.motd.config.Color.PrimaryColor )
					end
				end
			end
			if vgui.GetHoveredPanel() != SettingOptionButton then
				if vgui.GetHoveredPanel() == HoverTop or vgui.GetHoveredPanel() == HoverBot then
					self.hover = true
				else
					self.hover = false
				end
			end
			if not self.hover then
				if IsValid(HoverTop) then
					HoverTop:Remove()
				end
				if IsValid(HoverBot) then
					HoverBot:Remove()
				end
			end
		end
		CommandList:Add(SettingOptionButton)
	end

     local starter = Mint.Motd.findStarter()

	if starter == "rules" then
		Mint.Motd.Rules(Mint.Motd.findStarterInfo())
		Mint.windows.Motd.OpenPanel = string.lower(Mint.Motd.findStarterInfo().Title)
	elseif FindStarter() == "site" then
		Mint.Motd.Web(Mint.Motd.findStarterInfo())
		Mint.windows.Motd.OpenPanel = string.lower(Mint.Motd.findStarterInfo().Title)
	elseif FindStarter() == "servers" then
		Mint.Motd.Servers()
		Mint.windows.Motd.OpenPanel = string.lower(Mint.Motd.findStarterInfo().Title) 
	end
end

function Mint.Motd.open()
     Mint.buildBlurBackground(Mint.motd.config.Color.Blur, Mint.motd.config.Color.BlurBackground)
     Mint.Motd.buildPopup()
end
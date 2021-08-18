function Mint.Motd.Rules(tbl)
	Mint.windows.Motd.panel = vgui.Create( "DPanel", Mint.windows.Motd )
	Mint.windows.Motd.panel:SetSize( ScrW(), ScrH()-235 )
	Mint.windows.Motd.panel:SetPos( ScrW(), Mint.Motd.contentStart )
	Mint.windows.Motd.panel:MoveTo( 0, Mint.Motd.contentStart, Mint.motd.config.SpeedAnimations, .05 )
	Mint.windows.Motd.panel.Paint = function(self, w, h)
		draw.RoundedBox( 0, 0, 0, w, h, Mint.motd.config.Color.Background )
	end
	local RulesOne = vgui.Create( "DPanel", Mint.windows.Motd.panel )
	RulesOne:SetSize( (Mint.windows.Motd.panel:GetWide()-150)/2, Mint.windows.Motd.panel:GetTall()-100 )
	RulesOne:SetPos( 50, 50 )
	RulesOne.Paint = function(self, w, h)
		draw.RoundedBoxEx( 10, 0, 0, w, 80, Mint.motd.config.Color.SecondBackground, true, true, false, false )
		Mint.Helper.drawOutline( 0, 80, w, h-80, Mint.motd.config.Color.SecondBackground )
		Mint.Helper.drawOutline( 1, 81, w-2, h-82, Mint.motd.config.Color.SecondBackground )
		draw.SimpleText( tbl.Column, "motd_option_btn", w/2, 20, Mint.motd.config.Color.Text, TEXT_ALIGN_CENTER )
	end
	local RuleScroll = vgui.Create( "DScrollPanel", RulesOne )
	RuleScroll:SetSize( RulesOne:GetWide()-30, RulesOne:GetTall()-100)
	RuleScroll:SetPos( 15, 90 )
	RuleScroll.VBar.Paint = function(self, w, h)

	end
	RuleScroll.VBar.btnUp.Paint = function(self, w, h)
	end
	RuleScroll.VBar.btnDown.Paint = function(self, w, h)
	end
	RuleScroll.VBar.btnGrip.Paint = function(self, w, h)	

	end

	local RuleList = vgui.Create( "DIconLayout", RuleScroll )
	RuleList:SetSize( RuleScroll:GetWide(), RuleScroll:GetTall() )
	RuleList:SetPos( 0, 0 )
	RuleList:SetSpaceY( 15 )
	RuleList:SetSpaceX( 5 )

	for k, v in pairs(tbl.Tbl) do
		local EachRule = vgui.Create( "DLabel" )
		EachRule:SetSize( RuleList:GetWide()/2-8, 40 )
		EachRule:SetText( k..". ".. v )
		EachRule:SetAutoStretchVertical(true)
		EachRule:SetFont("motd_rules")
		EachRule:SetTextColor(Mint.motd.config.Color.Text)
		RuleList:Add(EachRule)
	end

	local RulesDos = vgui.Create( "DPanel", Mint.windows.Motd.panel )
	RulesDos:SetSize( (Mint.windows.Motd.panel:GetWide()-150)/2, Mint.windows.Motd.panel:GetTall()-100 )
	RulesDos:SetPos( Mint.windows.Motd.panel:GetWide()/2+25, 50 )
	RulesDos.Paint = function(self, w, h)
		draw.RoundedBoxEx( 10, 0, 0, w, 80, Mint.motd.config.Color.SecondBackground, true, true, false, false )
		Mint.Helper.drawOutline( 0, 80, w, h-80, Mint.motd.config.Color.SecondBackground )
		Mint.Helper.drawOutline( 1, 81, w-2, h-82, Mint.motd.config.Color.SecondBackground )
		draw.SimpleText( tbl.Column2, "motd_option_btn", w/2, 20, Mint.motd.config.Color.Text, TEXT_ALIGN_CENTER )
	end
	local RuleDosScroll = vgui.Create( "DScrollPanel", RulesDos )
	RuleDosScroll:SetSize( RulesDos:GetWide()-30, RulesDos:GetTall()-100)
	RuleDosScroll:SetPos( 15, 90 )
	RuleDosScroll.VBar.Paint = function(self, w, h)

	end
	RuleDosScroll.VBar.btnUp.Paint = function(self, w, h)
	end
	RuleDosScroll.VBar.btnDown.Paint = function(self, w, h)
	end
	RuleDosScroll.VBar.btnGrip.Paint = function(self, w, h)	

	end

	local RuleDosList = vgui.Create( "DIconLayout", RuleDosScroll )
	RuleDosList:SetSize( RuleDosScroll:GetWide(), RuleDosScroll:GetTall() )
	RuleDosList:SetPos( 0, 0 )
	RuleDosList:SetSpaceY( 15 )
	RuleDosList:SetSpaceX( 5 )

	for k, v in pairs(tbl.Tbl2) do
		local EachRule = vgui.Create( "DLabel" )
		EachRule:SetSize( RuleDosList:GetWide()/2-8, 40 )
		EachRule:SetText( k..". ".. v )
		EachRule:SetAutoStretchVertical(true)
		EachRule:SetFont("motd_rules")
		EachRule:SetTextColor(Mint.motd.config.Color.Text)
		RuleDosList:Add(EachRule)
	end
end
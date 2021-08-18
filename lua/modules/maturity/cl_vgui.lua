surface.CreateFont( "motd_age_title", {
	font = "Roboto",
	size = 28,
	weight = 1000
} )
surface.CreateFont( "motd_age_desc", {
	font = "DermaLarge",
	size = 20,
	weight = 600
} )
surface.CreateFont( "motd_age_question", {
	font = "Roboto",
	size = 22,
	weight = 600
} )
surface.CreateFont( "motd_age_button", {
	font = "Roboto",
	size = 18,
	weight = 500
} )

Mint = Mint or {}
Mint.Maturity = Mint.Maturity or {}
Mint.windows = Mint.windows or {}

function Mint.Maturity.buildPopup() 
     Mint.windows.popup = vgui.Create( "DFrame" ) 
	Mint.windows.popup:SetSize( ScrW(), ScrH() )
	Mint.windows.popup:Center()
	Mint.windows.popup:SetTitle( " " ) 
	Mint.windows.popup:SetVisible( true )
	Mint.windows.popup:SetDraggable( false ) 
	Mint.windows.popup:ShowCloseButton( false ) 				
	Mint.windows.popup:MakePopup() 
	Mint.windows.popup.Paint = function(self, w, h)
	end

     local mainPanel = vgui.Create( "DPanel", Mint.windows.popup )
     mainPanel:SetSize(680, 300)
     mainPanel:Center()
     mainPanel:SetContentAlignment(5)
     mainPanel.Paint = function(self, w, h)
          draw.RoundedBox( 40, 0, 0, w, h, Mint.config.maturity.bgColor )
     end 

     mainPanel.icon = vgui.Create( "DPanel", mainPanel )
     mainPanel.icon:SetSize(64, 64)
     mainPanel.icon:SetPos(mainPanel:GetWide()/2 - mainPanel.icon:GetWide()/2, 20)
     mainPanel.icon.Paint = function(self, w, h)
          surface.SetDrawColor(Color(255, 255, 255, 255))
		surface.SetMaterial( Material("materials/syzco/age-limit.png") )
          surface.DrawTexturedRect(0, 0, 64, 64)
     end

     mainPanel.title = vgui.Create( "DLabel", mainPanel )
     mainPanel.title:SetText(Mint.config.maturity.title)
     mainPanel.title:SetFont("motd_age_title")
     mainPanel.title:SetTextColor(Mint.config.maturity.titleColor)
     mainPanel.title:SetContentAlignment(5)
     mainPanel.title:SizeToContents()
     mainPanel.title:SetPos( mainPanel:GetWide()/2 - mainPanel.title:GetWide()/2, 94 )

     mainPanel.desc = vgui.Create( "DLabel", mainPanel )
     mainPanel.desc:SetText(string.Left(Mint.config.maturity.description, 58))
     mainPanel.desc:SetFont("motd_age_desc")
     mainPanel.desc:SetTextColor(Mint.config.maturity.descriptionColor)
     mainPanel.desc:SetContentAlignment(5)
     mainPanel.desc:SetWidth(mainPanel:GetWide() - 30)
     mainPanel.desc:SizeToContentsY()
     mainPanel.desc:SetPos( mainPanel:GetWide()/2 - mainPanel.desc:GetWide()/2, (94 + (mainPanel.title:GetTall() + 15)) )

     mainPanel.descTwo = vgui.Create( "DLabel", mainPanel )
     mainPanel.descTwo:SetText(string.Right(Mint.config.maturity.description, 59))
     mainPanel.descTwo:SetFont("motd_age_desc")
     mainPanel.descTwo:SetTextColor(Mint.config.maturity.descriptionColor)
     mainPanel.descTwo:SetContentAlignment(5)
     mainPanel.descTwo:SetWidth(mainPanel:GetWide() - 30)
     mainPanel.descTwo:SizeToContentsY()
     mainPanel.descTwo:SetPos( mainPanel:GetWide()/2 - mainPanel.descTwo:GetWide()/2, (94 + (mainPanel.title:GetTall() + 15) + (mainPanel.desc:GetTall() + 3)) )

     mainPanel.question = vgui.Create( "DLabel", mainPanel )
     mainPanel.question:SetText(Mint.config.maturity.question)
     mainPanel.question:SetFont("motd_age_question")
     mainPanel.question:SetTextColor(Mint.config.maturity.questionColor)
     mainPanel.question:SetContentAlignment(5)
     mainPanel.question:SizeToContents()
     mainPanel.question:SetPos( mainPanel:GetWide()/2 - mainPanel.question:GetWide()/2, mainPanel:GetTall() - (80 + mainPanel.question:GetTall()) )
     

     local button = {
          width = Mint.Helper.getLargestSizeText(Mint.config.maturity.leaveText, Mint.config.maturity.enterText, "motd_age_button") + 30, 
          height = 40,
          spacing = 20,
          padding = 20
     }

     mainPanel:SetWide((button.width * 2) + (button.padding * 2) + button.spacing)

     mainPanel.leaveBtn = vgui.Create( "DButton", mainPanel )
	mainPanel.leaveBtn:SetSize( button.width, button.height )
	mainPanel.leaveBtn:SetPos( ((mainPanel:GetWide()/2) - (mainPanel.leaveBtn:GetWide()+(button.spacing/2))), (mainPanel:GetTall() - (mainPanel.leaveBtn:GetTall()+button.padding)) )
	mainPanel.leaveBtn:SetText( "" )
	mainPanel.leaveBtn.Paint = function(self, w, h)
          if (self:IsHovered()) then
               draw.RoundedBox( 20, 0, 0, w, h, Mint.config.maturity.leaveHoverColor )
               if (Mint.config.maturity.makeSure) then
                    draw.SimpleText( Mint.config.maturity.makeSure, "motd_age_button", w/2, h/2, Mint.config.maturity.buttonTextHoverColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
               else
                    draw.SimpleText( Mint.config.maturity.leaveText, "motd_age_button", w/2, h/2, Mint.config.maturity.buttonTextHoverColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
               end
          else 
               draw.RoundedBox( 20, 0, 0, w, h, Mint.config.maturity.leaveHoverColor )
               draw.RoundedBox( 20, 2, 2, w-4, h-4, Mint.config.maturity.leaveColor )
               draw.SimpleText( Mint.config.maturity.leaveText, "motd_age_button", w/2, h/2, Mint.config.maturity.buttonTextColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
          end
	end
	mainPanel.leaveBtn.DoClick = function()
		RunConsoleCommand("disconnect")
	end

     mainPanel.enterBtn = vgui.Create( "DButton", mainPanel )
     mainPanel.enterBtn:SetSize( button.width, button.height )
     mainPanel.enterBtn:SetPos( ((mainPanel:GetWide()/2) + (button.spacing/2)), (mainPanel:GetTall() - (mainPanel.enterBtn:GetTall()+button.padding)) )
	mainPanel.enterBtn:SetText( "" )
	mainPanel.enterBtn:SetText( "" )
	mainPanel.enterBtn.Paint = function(self, w, h)
          if (self:IsHovered()) then
		     draw.RoundedBox( 20, 0, 0, w, h, Mint.config.maturity.enterHoverColor )
               if (Mint.config.maturity.makeSure) then
                    draw.SimpleText( Mint.config.maturity.makeSure, "motd_age_button", w/2, h/2, Mint.config.maturity.buttonTextHoverColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
               else
                    draw.SimpleText( Mint.config.maturity.enterText, "motd_age_button", w/2, h/2, Mint.config.maturity.buttonTextHoverColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
               end
          else 
               draw.RoundedBox( 20, 0, 0, w, h, Mint.config.maturity.enterHoverColor )
               draw.RoundedBox( 20, 2, 2, w-4, h-4, Mint.config.maturity.enterColor )
               draw.SimpleText( Mint.config.maturity.enterText, "motd_age_button", w/2, h/2, Mint.config.maturity.buttonTextColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
          end
	end
	mainPanel.enterBtn.DoClick = function()
		Mint.close()

          net.Start("mint_save_maturity")
          net.SendToServer()

          if (Mint.config.maturity.openMintMotd) then
               Mint.Motd.open()
          end
	end
end

function Mint.Maturity.open()
     Mint.buildBlurBackground(Mint.config.maturity.bgBlurLevel, Mint.config.maturity.bgBlurColor)
     Mint.Maturity.buildPopup()
end
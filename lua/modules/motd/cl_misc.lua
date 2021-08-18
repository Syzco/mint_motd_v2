function Mint.Motd.findStarter()
	for k, v in pairs(Mint.motd.config.Options) do
		if string.lower(v.Title) == string.lower(Mint.motd.config.Starter) then
			return v.Type
		end
	end
end

function Mint.Motd.findStarterInfo()
	for k, v in pairs(Mint.motd.config.Options) do
		if string.lower(v.Title) == string.lower(Mint.motd.config.Starter) then
			return v
		end
	end
end

function Mint.Motd.nextOption(panel)
	if IsValid(panel) then
		panel:MoveTo( -ScrW(), Mint.Motd.contentStart, Mint.motd.config.SpeedAnimations, .05 )
		timer.Simple(Mint.motd.config.SpeedAnimations, function()
			panel:Remove()
		end)
	end
end

function Mint.Motd.getActiveType(panel)
	for k, v in pairs(Mint.motd.config.Options) do
		if string.lower(v.Title) == string.lower(panel) then
			return v.Type
		end
	end
end

function Mint.Motd.GetActivePanel(panel)
	local act = Mint.Motd.getActiveType(panel)
	if act == "rules" then
		return Mint.windows.Motd.rules
	elseif act == "site" then
		return Mint.windows.Motd.site
	elseif act == "server" then
		return Mint.windows.Motd.server
	end 
end

function Mint.Motd.getButtonWidth()
	local width = 0
	surface.SetFont("motd_option_btn")
	for k, v in pairs(Mint.motd.config.Options) do
		local w, h = surface.GetTextSize( v.Title )
		width = width + w + 10
	end
	return width
end

function Mint.Motd.getButtonSize(text)
	local width = 0
	surface.SetFont("motd_option_btn")
	local w, h = surface.GetTextSize( text )
	width = w
	return width
end
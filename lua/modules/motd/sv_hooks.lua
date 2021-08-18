hook.Add("PlayerInitialSpawn", "mint_open_motd_join", function(ply)
	timer.Simple(1, function()
		if Mint.motd.config.OpenOnJoin then
			Mint.Motd.open(ply, Mint.motd.config.Timer)
		end
	end)
end)

hook.Add("PlayerSay", "mint_open_motd_chat", function(ply, text)
    if Mint.motd.config.ChatCommandEnabled then
        if string.lower(Mint.motd.config.ChatCommand) == string.lower(text) then
               Mint.Motd.open(ply, false)
        end
    end
end)

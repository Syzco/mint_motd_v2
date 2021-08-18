/** 
@ Open Maturity on Initial Spawn
**/
hook.Add("PlayerInitialSpawn", "syzco_maturity_popup", function(ply)
     Mint.Maturity.shouldOpen(ply)
end)

/** 
@ Fix awaits on disconnect
**/
hook.Add("PlayerDisconnected", "syzco_maturity_remove_awaiting", function(ply)
     if (!Mint.isAwaiting(ply)) then return end

     Mint.removeAwaiting(ply)
end)


//Hold awaiting hooks.
if (Mint.config.maturity.holdAwaiting) then
     TEAM_AWAITING = DarkRP.createJob("Awaiting Maturity Confirmation", {
          color = Color(0, 178, 255, 255),
          model = {"models/player/p2_chell.mdl"},
          description = [[Spawned in, but awaiting the maturity check.]],
          weapons = {},
          command = "awaiting",
          max = 0,
          salary = 0,
          admin = 0,
          vote = false,
          hasLicense = false,
          candemote = false,
          hide = true,
          PlayerSpawn = function(ply)
               ply:StripWeapons()
               ply:Freeze()
          end,
          customCheck = function(ply) 
               return false
          end,
          CustomCheckFailMsg = "This job is for new players only",
          sortOrder = 1,
          category = "Awaiting Agreement"
     })     

     GAMEMODE.DefaultTeam = TEAM_AWAITING
end

hook.Add("PlayerCanHearPlayersVoice", "syzco_maturity_nosounds", function(ply, talker)
     if (Mint.config.maturity.holdAwaiting && Mint.isAwaiting(ply) == "maturity" && Mint.config.maturity.holdDisableVoices) then
          return false
     end
end)

hook.Add("PlayerAcceptedMaturity", "syzco_maturity_new_team", function(ply)
     if not (Mint.config.maturity.holdAwaiting) then return end
     ply:changeTeam(Mint.config.maturity.defaultTeam, true, true)
     ply:Spawn()
end)
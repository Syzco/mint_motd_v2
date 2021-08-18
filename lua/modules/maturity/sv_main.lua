Mint = Mint or {}
Mint.Maturity = Mint.Maturity or {}

util.AddNetworkString("mint_open_maturity")
util.AddNetworkString("mint_save_maturity")

local SAVE_FILE = Mint.info.DataFolder.."/maturity_agreements.txt"

function Mint.Maturity.open(ply) 
     net.Start("mint_open_maturity")
     net.Send(ply)

     Mint.addAwaiting(ply, "maturity")
end

function Mint.Maturity.loadSaveData() 
     local data = {}
     if (file.Exists(SAVE_FILE, 'DATA')) then
          data = util.JSONToTable(file.Read(SAVE_FILE, 'DATA'))
     end

     return data
end

function Mint.Maturity.saveData(data)
     file.Write(SAVE_FILE, util.TableToJSON(data))
end  

function Mint.Maturity.checkUserCompleted(ply)
     if (!file.Exists(SAVE_FILE, 'DATA')) then return false end

     local playerAgreements = Mint.Maturity.loadSaveData()

     if (!playerAgreements[ply:SteamID()]) then return false end

     return true
end

function Mint.Maturity.shouldOpen(ply)
     if (Mint.Maturity.checkUserCompleted(ply)) then 
          if Mint.config.maturity.openMintMotd then
               Mint.Motd.open(ply, Mint.config.motd.Timer)
               timer.Simple(1, function() if (Mint.config.maturity.holdAwaiting) then ply:changeTeam(Mint.config.maturity.defaultTeam, true, true) ply:Spawn() end end)
		end

          return
     end

     Mint.Maturity.open(ply)
end

net.Receive("mint_save_maturity", function(len, ply) 
     if (!Mint.isAwaiting(ply)) then return end
     if (Mint.isAwaiting(ply) != "maturity") then return end

     local prevData = Mint.Maturity.loadSaveData() 

     prevData[ply:SteamID()] = true

     hook.Run("PlayerAcceptedMaturity", ply)

     Mint.Maturity.saveData(prevData)

     Mint.removeAwaiting(ply)
end)
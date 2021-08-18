Mint = Mint or {}
Mint.Motd = Mint.Motd or {}

util.AddNetworkString("mint_open_motd")
util.AddNetworkString("mint_close_motd")

function Mint.Motd.open(ply, bool)
     if !ply:IsValid() or !ply:IsPlayer() or Mint.isAwaiting(ply) then return end

     net.Start("mint_open_motd")
          net.WriteBool(bool)
     net.Send(ply)

     Mint.addAwaiting(ply, "motd")
end

net.Receive("mint_close_motd", function(len, ply)
     if !(Mint.isAwaiting(ply)) then return end
     if (Mint.isAwaiting(ply) != "motd") then return end
     
     hook.Run("PlayerClosedMOTD", ply)

     Mint.removeAwaiting(ply)
end)
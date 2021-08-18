Mint = Mint or {}
Mint.awaitingResponses = Mint.awaitingResponses or {}

function Mint.addAwaiting(ply, action)
     Mint.awaitingResponses[ply:SteamID()] = action
end

function Mint.isAwaiting(ply)
     return Mint.awaitingResponses[ply:SteamID()] or false
end

function Mint.removeAwaiting(ply)
     Mint.awaitingResponses[ply:SteamID()] = nil
end
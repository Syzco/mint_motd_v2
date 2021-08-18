Mint = Mint or {}
Mint.Motd = Mint.Motd or {}

net.Receive("mint_open_motd", function()
     Mint.Motd.open()
end)
Mint = Mint or {}
Mint.Maturity = Mint.Maturity or {}

net.Receive("mint_open_maturity", function(len, ply) 
     Mint.Maturity.open()
end)
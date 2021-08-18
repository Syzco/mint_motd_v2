//                       //
//        Hooks          //
//                       //
// SERVER - PlayerAcceptedMaturity (ply) - Called when player accepts the maturity.
// CLIENT/SERVER - PlayerClosedMOTD (ply) - Called when player closes the MOTD.

Mint = Mint or {}
Mint.config = Mint.config or {}
Mint.config.motd = Mint.config.motd or {}
Mint.config.maturity = Mint.config.maturity or {}
Mint.config.maturity = Mint.config.motd or {}

Mint.config.packages = {
     ["maturity"] = true,
     ["motd"] = true
}
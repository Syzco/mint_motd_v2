Mint = Mint or {}
Mint.motd = Mint.motd or {}
Mint.motd.config = Mint.motd.config or {}
Mint.motd.config.Color = Mint.motd.config.Color or {}
Mint.motd.config.Options = Mint.motd.config.Options or {}
Mint.motd.config.Servers = Mint.motd.config.Servers or {}

local function AddRules(ButtonTitle, column, tbl, column2, tbl2)
	table.insert(Mint.motd.config.Options, {Type = "rules", Title = ButtonTitle, Column = column, Tbl = tbl, Column2 = column2, Tbl2 = tbl2})
end
local function AddWebsite(ButtonTitle, url)
	table.insert(Mint.motd.config.Options, {Type = "site", Title = ButtonTitle, URL = url})
end
local function AddServer(ip, name, gt)
	table.insert(Mint.motd.config.Servers, {IP = ip, Name = name, GameTracker = gt})
end
--------------------------------------------------------------------------------------------------------------
-------Touching anything above this line will most likely mess something up. Please do not touch above.-------
--------------------------------------------------------------------------------------------------------------
				    ////////////////////////////////////////////////////////////////
				   ////////------------------------------------------------////////
				  ////////----------DO NOT TOUCH ANYTHING ABOVE!----------////////
				 ////////------------------------------------------------////////
				////////////////////////////////////////////////////////////////
--------------------------------------------------------------------------------------------------------------
-------Touching anything above this line will most likely mess something up. Please do not touch above.-------
--------------------------------------------------------------------------------------------------------------

Mint.motd.config.OpenOnJoin = false --Whether or not to open the menu on first join. ATTENTION: IF YOU USE THE MATURITY, TURN THIS OFF AND TURN Mint.maturity.config.openMintMotd ON
Mint.motd.config.ServerList = false --Whether or not to enable the server list. 

Mint.motd.config.ChatCommandEnabled = true --Whether or not to enable the chat command.
Mint.motd.config.ChatCommand = "!motd" --If the above is true, the command for chat.

Mint.motd.config.ServerName = "Orion Networks SCP-RP" --The server name. The capitalization does not matter. It will display in all caps.
Mint.motd.config.Starter = "Rules" --The initial page to start on. The Title of the button to display.

Mint.motd.config.SpeedAnimations = 2 --Speed of the panel animations. 
Mint.motd.config.ButtonAnimations = 0.5 --The speed of the blue lines on the buttons. 

Mint.motd.config.Timer = true	--Whether or not to enable a timer when players first join the server.
Mint.motd.config.TimerAmount = 5 --If the above is true, how long the timer should last.
Mint.motd.config.Color.NCSupport = false --Whether or not you are using my Name Changing script with the first join option.

Mint.motd.config.Color.Text = Color(255, 255, 255, 255)
Mint.motd.config.Color.Background = Color(53,65,73, 255)
Mint.motd.config.Color.PrimaryColor = Color(69,128,196, 255)
Mint.motd.config.Color.SecondBackground = Color(43,52,59, 255)
Mint.motd.config.Color.Lightground = Color(58,73,80, 255)

Mint.motd.config.Color.Blur = 5
Mint.motd.config.Color.BlurBackground = Color(0,0,0, 100)

/*****************************************************************************************************************************************************************
**																Now here is the fun part.....																	**
**	Website:																																					**
**		To add a website you will use these arguments: Title and URL 																							**
**		Display it like this: AddWebsite(Title, URL)																											**
**		Example: BMAddWebsite("Website", "http://www.google.com/")																								**
**																																								**
**	Server:																																						**
**		To add a server you will use these arguments: IP, Name, GameTracker																						**
**		Display it like this: AddWebsite(IP, Name, GameTracker)																								**
**		To use GameTracker, you will put true if you want it and false if you don't want it.																	**
**		Example: BMAddServer("127.0.1.0.1:27015", "My Server", true)																							**
**																																								**
**	Rulles:																																						**
**		To add a server you will use these arguments: Title, CategoryOne, RuleTable, CategoryTwo, and RuleTableTwo												**
**		Display it like this: AddRules(Title, CategoryOne, RuleTable, CategoryTwo, and RuleTableTwo)															**
**		Example: BMAddRules("Rules", "General Rules", {																											**
**			"Rule One",																																			**
**			"Rule One"																																			**
**		}, 																																						**
**		"Gamemode Rules", {																																		**
**			"Rule One",																																			**
**			"Rule One"																																			**
**		})																																						**
*****************************************************************************************************************************************************************/

AddWebsite("Website", "https://google.com")
AddWebsite("Forums", "https://google.com")

AddServer("172.0.1.0:27015", "My Server", true)
AddServer("172.0.1.0:27015", "My Server", true)
AddServer("172.0.1.0:27015", "My Server", true)
AddServer("172.0.1.0:27015", "My Server", true)
AddServer("172.0.1.0:27015", "My Server", true)
AddServer("172.0.1.0:27015", "My Server", true)
AddServer("172.0.1.0:27015", "My Server", true)
AddServer("172.0.1.0:27015", "My Server", true)
AddServer("172.0.1.0:27015", "My Server", true)
AddServer("172.0.1.0:27015", "My Server", true)
AddServer("14.1.30.22:27015", "My Server", true)

AddRules("Rules", "General Rules", {
	"Rule One",
	"Rule One",
	"Rule One",
	"Rule One",
	"Rule One",
	"Rule One",
	"Rule One",
	"Rule One",
	"Rule One",
	"Rule One",
	"Rule One",
	"Rule One",
	"Rule One",
	"Rule One",
	"Rule One",
	"Rule One"
}, 
"Gamemode Rules", {
	"Rule One",
	"Rule One",
	"Rule One",
	"Rule One",
	"Rule One",
	"Rule One",
	"Rule One",
	"Rule One",
	"Rule One",
	"Rule One",
	"Rule One",
	"Rule One",
	"Rule One",
	"Rule One",
	"Rule One",
	"Rule One"
})

--Don't touch anything below...
local function CheckServers()
	if Mint.motd.config.ServerList then
		table.insert(Mint.motd.config.Options, {Type = "server", Title = "Servers"})
	end
end
CheckServers()
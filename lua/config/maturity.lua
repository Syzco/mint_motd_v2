Mint = Mint or {}
Mint.config = Mint.config or {}
Mint.config.maturity = Mint.config.maturity or {}

Mint.config.maturity.bgBlurLevel = 10                                           // Blur intensity.
Mint.config.maturity.bgBlurColor = Color(0, 0, 0, 255)                          // Color of the blur.
Mint.config.maturity.bgColor = Color(255, 255, 255, 255)                        // Color of the backrgound.

Mint.config.maturity.title = "This server requires 18+."                        // Text of the title.
Mint.config.maturity.titleColor = Color(20, 20, 20, 255)                        // Color of the title.

Mint.config.maturity.description = "This server has NSFW/18+ content displaying in the form of violence, drug abuse, sexuality, profanity, nudity, or other adult themes."         // Text of the description.
Mint.config.maturity.descriptionColor = Color(150, 150, 150, 255)               // Color of the description text.

Mint.config.maturity.question = "Are you sure you wish to continue?"            // Text of the question.
Mint.config.maturity.questionColor = Color(50, 50, 50, 255)                     // Color of the question text.

Mint.config.maturity.leaveText = "No, Leave the Server"                         // Text of the leave button.
Mint.config.maturity.leaveColor = Color(222, 141, 149, 255)                     // Color of the leave button.
Mint.config.maturity.leaveHoverColor = Color(218, 112, 114, 255)                // Color of the leave button when hovered.

Mint.config.maturity.enterText = "Yes, I am okay with seeing such content."     // Text of the agree button.
Mint.config.maturity.enterColor = Color(52, 170, 205, 255)                      // Color of the agree button.
Mint.config.maturity.enterHoverColor = Color(38, 140, 185, 255)                 // Color of the agree button when hovered.

Mint.config.maturity.buttonTextColor = Color(255, 255, 255, 255)                // Color of the text on the buttons.
Mint.config.maturity.buttonTextHoverColor = Color(255, 255, 255, 255)           // Color of the text on the buttons when hovered.

Mint.config.maturity.makeSure = "Are you sure?"                                 // Set this to false to disable it. If not set it to a string to change the text when a player hovers over a button.

Mint.config.maturity.openMintMotd = true                                        // Do you want to open MintMOTD when this closes?

///////////////////////////////////////////////////////////////
///////              Hold Awaiting Feature              ///////
//        This feature allows you to create a DarkRP         //
//        class for players to start in if they have         //
//        not accepted the maturity confirmation.            //
///////////////////////////////////////////////////////////////
Mint.config.maturity.holdAwaiting = true
Mint.config.maturity.holdDisableVoices = true
Mint.config.maturity.defaultTeam = TEAM_CLASSD




///////////////////////////////////////////////////////////////
if not GAMEMODE.DarkRP then Mint.config.maturity.holdAwaiting = false end
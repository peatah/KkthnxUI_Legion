local K, C, L = unpack(select(2, ...))

-- Localization for enUS & enGB

L.AFKScreen = {
	NoGuild = "No Guild",
	Sun = "Sunday",
	Mon = "Monday",
	Tue = "Tuesday",
	Wed = "Wednesday",
	Thu = "Thursday",
	Fri = "Friday",
	Sat = "Saturday",
	Jan = "January",
	Feb = "February",
	Mar = "March",
	Apr = "April",
	May = "May",
	Jun = "June",
	Jul = "July",
	Aug = "August",
	Sep = "September",
	Oct = "October",
	Nov = "November",
	Dec = "December"
}

L.Announce = {
	FPUse = "%s used %s.",
	Interrupted = INTERRUPTED.." %s's \124cff71d5ff\124Hspell:%d:0\124h[%s]\124h\124r!",
	PCAborted = "Pull ABORTED!",
	PCGo = "GO!",
	PCMessage = "Pulling %s in %s..",
	Recieved = " received from ",
	Sapped = "Sapped",
	SappedBy = "Sapped by: ",
	SSThanks = "Thanks for "
}

L.Auras = {
	MoveBuffs = "Move Buffs",
	MoveDebuffs = "Move Debuffs",
}

-- Merchant Localization
L.Merchant = {
	NotEnoughMoney = "You don't have enough money to repair!",
	RepairCost = "Your items have been repaired for",
	SoldTrash = "Your vendor trash has been sold and you earned"
}

-- Bindings Localization
L.Bind = {
	Binding = "Binding",
	Cleared = "All keybindings cleared for",
	Discard = "All newly set keybindings were discarded.",
	Instruct = "Hover, your mouse over any action button, to bind it. Press the escape key or right click to clear the current action button's keybinding.",
	Key = "Key",
	NoSet = "No bindings set",
	Saved = "All keybindings have been saved.",
	Trigger = "Trigger"
}

-- Chat Localization
L.Chat = {
	AFK = "|cffff0000[AFK]|r",
	DND = "|cffe7e716[DND]|r",
	Guild = "G",
	GuildRecruitment = "GuildRecruitment",
	Instance = "I",
	InstanceLeader = "IL",
	LocalDefense = "LocalDefense",
	LookingForGroup = "LookingForGroup",
	Officer = "O",
	Party = "P",
	PartyLeader = "P",
	Raid = "R",
	RaidLeader = "R",
	RaidWarning = "W",
}

-- Configbutton Localization
L.ConfigButton = {
	Config = "Show config GUI",
	Functions = "Button functions:",
	LeftClick = "Left click:",
	MiddleClick = "Middle click:",
	MoveUI = "Move UI elements",
	Recount = "Show/Hide Recount",
	RightClick = "Right click:",
	ShiftClick = "Shift + click:",
	ShiftPlusRightClick = "Shift + right-click:",
	Skada = "Show/Hide Skada",
	Spec = "Show specialization menu",
	SpecError = "You already have this specialization active!",
	SpecMenu = "Specialization selection"
}

-- Cooldowns
L.Cooldowns = {
	Cooldowns = "CD: ",
	CombatRes = "BattleRes",
	CombatResRemainder = "Battle Resurrection: ",
	NextTime = "Next time: "
}

-- DataBars Localization
L.DataBars = {
	ArtifactClick = "Click: Opens the artifact overview",
	ArtifactRemaining = "|cffe6cc80Remaining: %s|r",
	HonorLeftClick = "|cffccccccLeft Click: Opens the honor frame|r",
	HonorRightClick = "|cffccccccRight Click: Opens the honor talents frame|r"
}

-- DataText Localization
L.DataText = {
	ArmError = "Could not get Call To Arms information.",
	AvoidAnceShort = "Avd: ",
	Bags = "Bags",
	Bandwidth = "Bandwidth: ",
	BasesAssaulted = "Bases Assaulted:",
	BasesDefended = "Bases Defended:",
	CartsControlled = "Carts Controlled:",
	CombatTime = "Combat/Arena Time",
	Coords = "Coords",
	DemolishersDestroyed = "Demolishers Destroyed:",
	Download = "Download: ",
	FlagsCaptured = "Flags Captured:",
	FlagsReturned = "Flags Returned:",
	FPS = "FPS",
	GatesDestroyed = "Gates Destroyed:",
	GoldDeficit = "Deficit: ",
	GoldEarned = "Earned: ",
	GoldProfit = "Profit: ",
	GoldServer = "Server: ",
	GoldSpent = "Spent: ",
	GoldTotal = "Total: ",
	GraveyardsAssaulted = "Graveyards Assaulted:",
	GraveyardsDefended = "Graveyards Defended:",
	GuildNoGuild = "No Guild",
	LootSpecChange = "|cffFFFFFFRight Click:|r Change Loot Specialization|r",
	LootSpecShow = "|cffFFFFFFShift + Left Click:|r Show Talent Specialization UI|r",
	LootSpecSpec = "Spec",
	LootSpecTalent = "|cffFFFFFFLeft Click:|r Change Talent Specialization|r",
	Memory = "Memory",
	MicroMenu = "MicroMenu",
	MS = "MS",
	NoDungeonArm = "No dungeons are currently offering a Call To Arms.",
	NoOrderHallUnlock = "You have not unlocked your OrderHall",
	NoOrderHallWO = "Orderhall+",
	OrbPossessions = "Orb Possessions:",
	OrderHall = "OrderHall",
	OrderHallReport = "Click: Open the OrderHall report",
	SavedDungeons = "Saved Dungeon(s)",
	SavedRaids = "Saved Raid(s)",
	System = "System Stats: ",
	Time = "Time",
	TotalBagSlots = "Total Bag Slots",
	TotalFreeBagSlots = "Free Bag Slots",
	TotalMemory = "Total Memory Usage:",
	TotalMemoryUsage = "Total Memory Usage",
	TotalUsedBagSlots = "Used Bag Slots",
	TowersAssaulted = "Towers Assaulted:",
	TowersDefended = "Towers Defended:",
	VictoryPoints = "Victory Points:",
	Slots = {
		[1] = {1, INVTYPE_HEAD, 1000},
		[2] = {3, INVTYPE_SHOULDER, 1000},
		[3] = {5, INVTYPE_ROBE, 1000},
		[4] = {6, INVTYPE_WAIST, 1000},
		[5] = {9, INVTYPE_WRIST, 1000},
		[6] = {10, INVTYPE_HAND, 1000},
		[7] = {7, INVTYPE_LEGS, 1000},
		[8] = {8, INVTYPE_FEET, 1000},
		[9] = {16, INVTYPE_WEAPONMAINHAND, 1000},
		[10] = {17, INVTYPE_WEAPONOFFHAND, 1000},
		[11] = {18, INVTYPE_RANGED, 1000}
	},
}

-- headers
L.Install = {
	Header1 = "Welcome",
	Header2 = "1. Essentials",
	Header3 = "2. Unitframes",
	Header4 = "3. Features",
	Header5 = "4. Things you should know!",
	Header6 = "5. Commands",
	Header7 = "6. Finished",
	Header8 = "1. Essential Settings",
	Header9 = "2. Social",
	Header10 = "3. Frames",
	Header11 = "4. Success!",
	InitLine1 = "Thank you for choosing KkthnxUI!",
	InitLine2 = "You will be guided through the installation process in a few simple steps. At each step, you can decide whether or not you want to apply or skip the presented settings.",
	InitLine3 = "You are also given the possibility to be shown a brief tutorial on some of the features of KkthnxUI.",
	InitLine4 = "Press the 'Tutorial' button to be guided through this small introduction, or press 'Install' to skip this step.",
	Step1Line1 = "These steps will apply the correct CVar settings for KkthnxUI.",
	Step1Line2 = "The first step applies the essential settings.",
	Step1Line3 = "This is |cffff0000recommended|r for any user unless you want to apply only a specific part of the settings.",
	Step1Line4 = "Click 'Continue' to apply the settings, or click 'Skip' if you wish to skip this step.",
	Step2Line0 = "Another chat addon is found. We will ignore this step. Please press skip to continue installation.",
	Step2Line1 = "The second step applies the correct chat setup.",
	Step2Line2 = "If you are a new user, this step is recommended. If you are an existing user, you may want to skip this step.",
	Step2Line3 = "It is normal that your chat font will appear too big upon applying these settings. It will revert back to normal when you finish with the installation.",
	Step2Line4 = "Click 'Continue' to apply the settings, or click 'Skip' if you wish to skip this step.",
	Step3Line1 = "The third and final step applies for the default frame positions.",
	Step3Line2 = "This step is |cffff0000recommended|r for new users.",
	Step3Line3 = "",
	Step3Line4 = "Click 'Continue' to apply the settings, or click 'Skip' if you wish to skip this step.",
	Step4Line1 = "Installation is complete.",
	Step4Line2 = "Please click the 'Finish' button to reload the UI.",
	Step4Line3 = "",
	Step4Line4 = "Enjoy KkthnxUI! Visit us on Discord @ |cff748BD9discord.gg/Kjyebkf|r",
	ButtonTutorial = "Tutorial",
	ButtonInstall = "Install",
	ButtonNext = "Next",
	ButtonSkip = "Skip",
	ButtonContinue = "Continue",
	ButtonFinish = "Finish",
	ButtonClose = "Close",
	Complete = "Installation Complete"
}

-- tutorial 1
L.Tutorial = {
	Step1Line1 = "This quick tutorial will show you some of the features in KkthnxUI.",
	Step1Line2 = "First, the essentials that you should know before you can play with this UI.",
	Step1Line3 = "This installer is partially character-specific. While some of the settings that will be applied later on are account-wide, you need to run the install script for each new character running KkthnxUI. The script is auto shown on every new character you log in with KkthnxUI installed for the first time. Also, the options can be found in /KkthnxUI/Config/Settings.lua for `Power` users or by typing /KkthnxUI in the game for `Friendly` users.",
	Step1Line4 = "A power user is a user of a personal computer who has the ability to use advanced features (ex: Lua editing) which are beyond the abilities of normal users. A friendly user is a normal user and is not necessarily capable of programming. It's recommended for them to use our in-game configuration tool (/KkthnxUI) for settings they want to be changed in KkthnxUI.",
	Step2Line1 = "KkthnxUI includes an embedded version of oUF (oUFKkthnxUI) created by Haste. This handles all of the unit frames on the screen, the buffs and debuffs, and the class-specific elements.",
	Step2Line2 = "You can visit wowinterface.com and search for oUF for more information about this tool.",
	Step2Line3 = "To easily change the unit frames positions, just type /moveui.",
	Step2Line4 = "",
	Step3Line1 = "KkthnxUI is a redesigned Blizzard UI. Nothing less, nothing more. Approxmently all features you see with Default UI is available though KkthnxUI. The only features not available through default UI are some automated features not really visible on screen, for example, auto selling grays when visiting a vendor or, auto sorting bags.",
	Step3Line2 = "Not everyone enjoys things like DPS meters, Boss mods, Threat meters, etc, we judge that it's the best thing to do. KkthnxUI is made around the idea to work for all classes, roles, specs, type of gameplay, a taste of the users, etc. This why KkthnxUI is becoming a very popular UI at the currently. It fits everyone's play style and it is editable. It's also designed to be a good start for everyone that want to make their own custom UI without depending on add-ons.",
	Step3Line3 = "Users may want to visit our WowInterface to install additional mods like Skada, DBM and so on.",
	Step3Line4 = "",
	Step4Line1 = "To set how many bars you want, mouseover on left or right of bottom action bar background. Do the same on the right, via bottom. To copy text from the chat frame, click the button shown on mouseover in the right bottom corner of chat frames.",
	Step4Line2 = "You can left-click through 80% of data text to show various panels from Blizzard. Friend and Guild Datatext have right-clicked features as well.",
	Step4Line3 = "There are some drop-down menus available. Right-clicking on the [X] (Close) bag button will show bags. right-clicking the Minimap will show the micro menu.",
	Step4Line4 = "",
	Step5Line1 = "Lastly, KkthnxUI includes useful slash commands. Below is a list.",
	Step5Line2 = "/moveui allow you to move lots of the frames anywhere on the screen. /rl reloads the UI.",
	Step5Line3 = "/tt lets you whisper your target. /rc initiates a ready check. /rd disbands a party or raid. /ainv enable auto invite by whisper to you. (/ainv off) to turn it off",
	Step5Line4 = "/gm toggles the Help frame. /install or /tutorial loads this installer. ",
	Step6Line1 = "The tutorial is complete. You can choose to reconsult it at any time by typing /tutorial.",
	Step6Line2 = "I suggest you have a look through config/config.lua or type /KkthnxUI to customize the UI to your needs.",
	Step6Line3 = "You can now continue to install the UI if it's not done yet or if you want to reset to default!",
	Step6Line4 = "",
	Message1 = "For technical support visit https://github.com/Kkthnx or visit our Discord",
	Message2 = "You can toggle the micro bar by using your right mouse button on the minimap.",
	Message3 = "You can set your keybindings quickly by typing /kb.",
	Message4 = "The focus unit can be set by typing /focus when you are targeting the unit you want to focus. It is recommended you make a macro do this.",
	Message5 = "You can access copy chat and chat menu functions by mouse over the bottom right corner of chat panel and left click on the button that will appear.",
	Message6 = "If you are experiencing issues with KkthnxUI try disabling all your addons except KkthnxUI, remember KkthnxUI is a full UI replacement addon, you cannot run two addons that do the same thing.",
	Message7 = "To setup which channels appear in which chat frame, right click the chat tab and go to settings.",
	Message8 = "You can use the /resetui command to reset all of your movers. You can also type /moveui and just right click a mover to reset its position.",
	Message9 = "To move abilities on the action bars by default hold shift + drag. You can change the modifier key from the action bar options menu.",
	Message10 = "You can see someone's average item level of their gear by enabling the item level for tooltip option"
}

-- AutoInvite Localization
L.Invite = {
	Enable = "Autoinvite enabled: ",
	Disable = "AutoInvite disabled"
}

-- Info Localization
L.Info = {
	Disabnd = "Disbanding group...",
	Duel = "Declined duel request from ",
	Errors = "No error yet.",
	Invite = "Accepted invite from ",
	NotInstalled = " is not installed.",
	PetDuel = "Declined pet duel request from ",
	SettingsALL = "Type /settings all, to apply the settings for all modifications.",
	SettingsDBM = "Type /settings dbm, to apply the settings DBM.",
	SettingsMSBT = "Type /settings msbt, to apply the settings MSBT.",
	SettingsSKADA = "Type /settings skada, to apply the settings Skada.",
	SkinDisabled1 = "Skin for ",
	SkinDisabled2 = " is disabled."
}

-- Loot Localization
L.Loot = {
	Announce = "Announce to",
	Cannot = "Cannot roll",
	Chest = ">> Loot from chest",
	Fish = "Fishing loot",
	Monster = ">> Loot from ",
	Random = "Random Player",
	Self = "Self Loot",
	ToGuild = " Guild",
	ToInstance = " Instance",
	ToParty = " Party",
	ToRaid = " Raid",
	ToSay = " Say"
}

-- Mail Localization
L.Mail = {
	Complete = "All done.",
	Messages = "messages",
	Need = "Need a mailbox.",
	Stopped = "Stopped, inventory is full.",
	Unique = "Stopped. Found a unique duplicate item in a bag or the bank."
}

-- World Map Localization
L.Map = {
	Fog = "Fog of War"
}

-- FarmMode Minimap
L.Minimap = {
	FarmModeOn = "Farm mode enabled",
	FarmModeOff = "Farm mode disabled"
}

-- Misc Localization
L.Misc = {
	BuyStack = "Alt-Click to buy a stack",
	Collapse = "The Collapse",
	CopperShort = "|cffeda55fc|r",
	GoldShort = "|cffffd700g|r",
	SilverShort = "|cffc7c7cfs|r",
	UIOutdated = "Your version of KkthnxUI is out of date. You can download the newest version from Curse.com. Get the Curse app and have KkthnxUI automatically updated with the Client!",
	Undress = "Undress"
}

L.Popup = {
	Armory = "Armory",
	BlizzardAddOns = "It appears one of your AddOns have disabled the AddOn Blizzard_CompactRaidFrames. This can cause errors and other issues. The AddOn will now be re-enabled.",
	BoostUI = "|cffff0000WARNING|r |n|nThis will optimize your performance by turning down the graphics and tweaking them. Hit accept only if you are having |cffff0000FPS|r issues!|r",
	DisableUI = "KkthnxUI might not work for this resolution, do you want to disable KkthnxUI? (Cancel if you want to try another resolution)",
	DisbandRaid = "Are you sure you want to disband the group?",
	FixActionbars = "There is something wrong with your action bars. Do you want to reload the UI to fix it?",
	InstallUI = "Thank you for choosing |cff3c9bedKkthnxUI|r! |n|nAccept this installation dialog to apply settings.",
	ReloadUI = "Installation is complete. Please click the 'Accept' button to reload the UI. Enjoy |cff3c9bedKkthnxUI|r. |n|nVisit me at |cff3c9bedwww.github.com/kkthnx|r.",
	ResetDataText = "Are you sure you want to reset all datatexts to default?",
	ResetUI = "Are you sure you want to reset all settings for |cff3c9bedKkthnxUI|r?",
	ResolutionChanged = "We detected a resolution change on your World of Warcraft client. We HIGHLY RECOMMEND restarting your game. Do you want to proceed?",
	SettingsAll = "|cffff0000WARNING|r |n|nThis will apply all the supported addons settings and import them to go with |cff3c9bedKkthnxUI|r. This feature will not do anything if you do not have one of the supported add-ons.",
	SettingsBW = "Need to change the position of elements BigWigs.",
	SettingsDBM = "We need to change the bar positions of |cff3c9bedDBM|r.",
}

-- Raid Utility Localization
L.Raid = {
	UtilityDisband = "Disband Group",
	DisbandRaid = "Are you sure you want to disband the group?"
}

-- Tooltip Localization
L.Tooltip = {
	AchievementComplete = "Your Status: Completed on ",
	AchievementIncomplete = "Your Status: Incomplete",
	AchievementStatus = "Your Status:",
	InspectOpen = "Inspect Frame is open",
	ItemCount = "Item count:",
	ItemID = "Item ID:",
	Loading = "Loading...",
	NoTalents = "No Talents",
	SpellID = "Spell ID:"
}

L.WatchFrame = {
	WowheadLink = "Wowhead Link"
}

L.Welcome = {
	Line1 = "Welcome to |cff3c9bedKkthnxUI|r v",
	Line2 = "",
	Line3 = "Type /cfg to config interface, or visit www.github.com/kkthnx|r",
	Line4 = "",
	Line5 = "Some of your questions can be answered by typing /uihelp"
}

L.SlashCommand = {
	Help = {
		"",
		"|cff3c9bedAvailable slash commands:|r",
		"--------------------------",
		"/ainv - Enables automatic invitation.",
		"/boostui - If you have FPS issues try this command.",
		"/cfg - Opens interface settings.",
		"/datatext reset - Reset datatexts to default",
		"/datatext resetgold - Reset datatexts gold cached info",
		"/datatext toggle - Toggle the datatext anchors",
		"/farmmode - Increase the size of the minimap.",
		"/frame - Get the info on any frame that can return info.",
		"/getpoint - Get the point of a frame.",
		"/gm - Opens GM frame.",
		"/moveui - Allows the movement of interface elements.",
		"/patch - Display Wow patch info.",
		"/pulsecd - Self cooldown pulse test.",
		"/raidcd - Raid cooldown test.",
		"/rc - Activates a ready check.",
		"/rd - Disband party or raid.",
		"/resetconfig - Resets KkthnxUI_Config settings.",
		"/resetui - Resets general settings to default.",
		"/rl - Reload interface.",
		"/settings ADDON_NAME - Applies settings to msbt, dbm, skada, or all addons.",
		"/spec, /ss - Switches between talent spec's.",
		"/teleport - Teleportation from random dungeon.",
		"/testuf - Unit frame test.",
		"/toraid - Convert to party or raid.",
		"/tt - Whisper target.",
		"",
		"|cff3c9bedAvailable hidden features:|r",
		"--------------------------",
		"Right-click minimap for micromenu.",
		"Middle mouse click minimap for tracking.",
		"Left click experience bar opens rep frame.",
		"Left click artifact bar opens artifact frame.",
		"Hold shift to scroll instantly to end or start of chat.",
		"Copy button to the bottom right side of chat.",
		"Middle mouse click copy button to /roll.",
	}
}
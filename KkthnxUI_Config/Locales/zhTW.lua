-- Localization for zhCN clients
local Locale = GetLocale()

if (Locale ~= "zhTW") then
	return
end

-- Localization for enUS & enGB clients
local PerformanceSlight = "\n|cffFF0000Disabling this may slightly increase performance|r" -- For semi-high CPU options
local ToggleOffReminder = "\n|cffFF0000Turn this off to manually input your bar numbers|r"

-- Actionbar
L_GUI_ACTIONBAR_BOTTOMBARS = "Number of bars on the bottom (1, 2 or 3)"
L_GUI_ACTIONBAR_BUTTON_SIZE = "Buttons size"
L_GUI_ACTIONBAR_BUTTON_SPACE = "Buttons space"
L_GUI_ACTIONBAR_ENABLE = "Enable action bars"
L_GUI_ACTIONBAR_EQUIP_BORDER = "Display green border on equipped items"
L_GUI_ACTIONBAR_GRID = "Show empty action bar buttons"
L_GUI_ACTIONBAR_HIDE_HIGHLIGHT = "Hide proc highlight"
L_GUI_ACTIONBAR_HOTKEY = "Show hotkey on buttons"
L_GUI_ACTIONBAR_MACRO = "Show macro name on buttons"
L_GUI_ACTIONBAR_OUT_OF_MANA = "Out of mana color"
L_GUI_ACTIONBAR_OUT_OF_RANGE = "Out of range color"
L_GUI_ACTIONBAR_PETBAR_HIDE = "Hide pet bar"
L_GUI_ACTIONBAR_PETBAR_HORIZONTAL = "Enable horizontal pet bar"
L_GUI_ACTIONBAR_PETBAR_MOUSEOVER = "Petbar on mouseover (only for horizontal petbar)"
L_GUI_ACTIONBAR_RIGHTBARS = "Number of action bars on right (0, 1, 2 or 3)"
L_GUI_ACTIONBAR_RIGHTBARS_MOUSEOVER = "Right bars on mouseover"
L_GUI_ACTIONBAR_SELFCAST = "Always self-cast on right-click (regardless of current target)"
L_GUI_ACTIONBAR_SPLIT_BARS = "Split the fifth bar on two bars on 6 buttons"
L_GUI_ACTIONBAR_STANCEBAR_HIDE = "Hide stance bar"
L_GUI_ACTIONBAR_STANCEBAR_HORIZONTAL = "Enable horizontal stance bar"
L_GUI_ACTIONBAR_STANCEBAR_MOUSEOVER = "Stance bar on mouseover"
L_GUI_ACTIONBAR_TOGGLE_MODE = "Enable toggle mode"..ToggleOffReminder
-- Announcements
L_GUI_ANNOUNCEMENTS = "Announcements"
L_GUI_ANNOUNCEMENTS_BAD_GEAR = "Check for bad gear in instances"
L_GUI_ANNOUNCEMENTS_INTERRUPT = "Announce in party/raid when you interrupt others"
L_GUI_ANNOUNCEMENTS_PULL_COUNTDOWN = "Simple script to aid in creating a pull countdown announce. /pc"
L_GUI_ANNOUNCEMENTS_SAY_SAPPED = "Instantly says Sapped to alert those around you whenever |cFFFFF569Rogues|r sap you."
L_GUI_ANNOUNCEMENTS_SPELLS = "Announce in party/raid when you cast some spells"
L_GUI_ANNOUNCEMENTS_SPELLS_FROM_ALL = "Check spells cast from all members"
-- Automation
L_GUI_AUTOMATION = "Automation"
L_GUI_AUTOMATION_ACCEPTINVITE = "Auto accept invites (friends/guild) only"
L_GUI_AUTOMATION_AUTOCOLLAPSE = "Auto collapse watchframe in instances"
L_GUI_AUTOMATION_AUTO_COLLAPSE_RELOAD = "Auto collapse WatchFrame after a UI reload"
L_GUI_AUTOMATION_DECLINEDUEL = "Auto decline all duels"
L_GUI_AUTOMATION_LOGGING_COMBAT = "Auto enables combat log text file in raid instances"
L_GUI_AUTOMATION_NO_BANNER = "Auto hide the 'Boss Banner' loot frame"
L_GUI_AUTOMATION_RESURRECTION = "Auto resurrection in battlegrounds"
L_GUI_AUTOMATION_SCREENSHOT = "Take screenshot when player gets an achievement"
L_GUI_AUTOMATION_TAB_BINDER = "Auto change tab key to only target enemy players"
-- Bag
L_GUI_BAGS = "Bags"
L_GUI_BAGS_BAG_FILTER = "Automatically delete useless items from your bags when looted"
L_GUI_BAGS_BUTTON_SIZE = "Set a size for bag slots"
L_GUI_BAGS_ENABLE = "Enable Bags"
L_GUI_BAGS_ITEMS_PER_ROW = "Set how many slots are on each row of the bags"
L_GUI_BAGS_PULSE_NEW_ITEMS = "New items in your bags will have a flash animation"
L_GUI_BAGS_SPACING = "Set the spacing between bag slots"
-- Blizzard
L_GUI_BLIZZARD = "Blizzard"
L_GUI_BLIZZARD_CLASS_COLOR = "Colorize player names by their class in friend list, who list, guild list, etc.."
L_GUI_BLIZZARD_COLOR_TEXTURES = "Change most UI texture hue colors."
L_GUI_BLIZZARD_EASYDELETE = "Delete |CFF0080ffBlues|r/|CFFb048f8Epics|r without having to type delete"
L_GUI_BLIZZARD_REPLACE_BLIZZARD_FONTS = "Replaces the default |cff00B4FFBlizzard fonts|r on various panels and frames from |cff3c9bedKkthnxUI|r."
L_GUI_BLIZZARD_REPUTATIONGAIN = "Display a message which shows how much reputation you gained"
L_GUI_BLIZZARD_TEXTURES_COLOR = "UI texture hue color. (Default is Classcolor)"
L_GUI_BLIZZARD_VEHICLE_MOUSEOVER = "Vehicle frame on mouseover"
-- Plugins
L_GUI_DATABARS = "DataBars"
L_GUI_DATABARS_ARTIFACT_COLOR = "Artifact bar color"
L_GUI_DATABARS_ARTIFACT_ENABLE = "Enable Artifact bar"
L_GUI_DATABARS_ARTIFACT_FADE = "Fade Artifact bar"
L_GUI_DATABARS_ARTIFACT_HEIGHT = "Artifact bar height"
L_GUI_DATABARS_ARTIFACT_WIDTH = "Artifact bar width"
L_GUI_DATABARS_EXPERIENCE_COLOR = "Experience bar color"
L_GUI_DATABARS_EXPERIENCE_ENABLE = "Enable Experience bar"
L_GUI_DATABARS_EXPERIENCE_FADE = "Fade Experience bar"
L_GUI_DATABARS_EXPERIENCE_HEIGHT = "Experience bar height"
L_GUI_DATABARS_EXPERIENCE_REST_COLOR = "Experience bar rest color"
L_GUI_DATABARS_EXPERIENCE_WIDTH = "Experience bar width"
L_GUI_DATABARS_HONOR_COLOR = "Honor bar color"
L_GUI_DATABARS_HONOR_ENABLE = "Enable Honor bar"
L_GUI_DATABARS_HONOR_FADE = "Fade Honor bar"
L_GUI_DATABARS_HONOR_HEIGHT = "Honor bar height"
L_GUI_DATABARS_HONOR_WIDTH = "Honor bar width"
L_GUI_DATABARS_REPUTATION_ENABLE = "Enable Reputation bar"
L_GUI_DATABARS_REPUTATION_FADE = "Fade Reputation bar"
L_GUI_DATABARS_REPUTATION_HEIGHT = "Reputation bar height"
L_GUI_DATABARS_REPUTATION_WIDTH = "Reputation bar width"
-- Auras
L_GUI_AURAS = "Auras"
L_GUI_AURAS_ANIMATION = "Show a 'pop in' animation on auras"..PerformanceSlight
L_GUI_AURAS_BUFFS_PERROW = "Set the number of buffs to show before creating a new row"
L_GUI_AURAS_CASTBY = "Show who cast an aura in its tooltip"
L_GUI_AURAS_CONSOLIDATE = "Consolidate Auras"
L_GUI_AURAS_ENABLE = "Enable Auras"
L_GUI_AURAS_FLASH = "Flash auras when their duration is low"..PerformanceSlight
L_GUI_AURAS_HIDE_BUFFS = "Disable buff display"
L_GUI_AURAS_HIDE_DEBUFFS = "Disable debuff display"
-- GUI Buttons
L_GUI_BUTTON_RESET = "Total UI Reset"
-- Chat
L_GUI_CHAT_FADING = "Enable chat fading"
L_GUI_CHAT_DAMAGE_METER_SPAM = "Merge damage meter spam in one line-link"
L_GUI_CHAT_ENABLE = "Enable chat"
L_GUI_CHAT_GOLD = "Removing some players spam"
L_GUI_CHAT_HEIGHT = "Height of the Chatframe"
L_GUI_CHAT_LINKBRACKETS = "Display URL links wrapped in brackets"
L_GUI_CHAT_LINKCOLOR = "Set a color to display URL links in"
L_GUI_CHAT_OUTLINE = "Apply an outline to the chat font"
L_GUI_CHAT_SCROLLBYX = "Set the number of lines that the chat will jump when scrolling"
L_GUI_CHAT_SPAM = "Removing some systems spam('Player1' won duel 'Player2')"
L_GUI_CHAT_TABS_MOUSEOVER = "Chat tabs on mouseover"
L_GUI_CHAT_TABS_OUTLINE = "Apply an outline to the chat tabs font"
L_GUI_CHAT_WHISP = "Play sound when receiving whispers"
L_GUI_CHAT_WIDTH = "Width of the Chatframe"
-- DataText
L_GUI_DATATEXT = "DataText"
L_GUI_DATATEXT_BATTLEGROUND = "Enable data text displaying battleground information"
L_GUI_DATATEXT_LOCALTIME = "Use local time in the Time data text, rather than realm time"
L_GUI_DATATEXT_LOCATION = "Enable location data text on the minimap at the top"
L_GUI_DATATEXT_SYSTEM = "Enable system data text under the minimap displaying FPS & MS"
L_GUI_DATATEXT_TIME = "Enable clock data text displaying time information at the bottom of the minimap"
L_GUI_DATATEXT_TIME24HR = "Set the Time data text to 24 hour format"
L_GUI_DATATEXT_BOTTOMBAR = "Enable DataTextBar under your Actionbars"
-- Cooldown
L_GUI_COOLDOWN = "Cooldown"
L_GUI_COOLDOWN_ENABLE = "Enable UI cooldown module"
L_GUI_COOLDOWN_FONT_SIZE = "Cooldown font size"
L_GUI_COOLDOWN_THRESHOLD = "Cooldown threshold number"
-- Filger
L_GUI_FILGER = "Filger"
L_GUI_FILGER_BUFFS_SIZE = "Buffs size"
L_GUI_FILGER_COOLDOWN_SIZE = "Cooldowns size"
L_GUI_FILGER_DISABLE_CD = "Disable cooldowns"
L_GUI_FILGER_ENABLE = "Enable Filger"
L_GUI_FILGER_MAX_TEST_ICON = "The number of icons to the test"
L_GUI_FILGER_PVP_SIZE = "PvP debuffs size"
L_GUI_FILGER_SHOW_TOOLTIP = "Show tooltip"
L_GUI_FILGER_TEST_MODE = "Test icon mode"
-- General
L_GUI_GENERAL_AUTOSCALE = "Auto UI Scale"
L_GUI_GENERAL_CHATBUBBLE_FONTSIZE = "Chat bubble font size"
L_GUI_GENERAL_CHATBUBBLE_NOBACKDROP = "Remove the chat bubble backdrop."
L_GUI_GENERAL_LAG_TOLERANCE = "Automatically update the Blizzard Custom Lag Tolerance option to your latency"
L_GUI_GENERAL_SHOW_CONFIG_BUTTON = "Show configbutton on minimap"
L_GUI_GENERAL_TRANSLATE_MESSAGE = "Popup to gain help for GUI translation."
L_GUI_GENERAL_UISCALE = "UI Scale (if auto-scale is disabled)"
L_GUI_GENERAL_WELCOME_MESSAGE = "Welcome message in chat."
L_GUI_GENERAL_QUESTSOUNDS = "Enable/disable QuestSounds."
L_GUI_GENERAL_PATHFINDER = "Show the perfect way in your artifact frame."
-- Loot
L_GUI_LOOT_AUTODE = "Auto confirm disenchant"
L_GUI_LOOT_AUTOGREED = "Enable auto-greed & disenchant for green items at max level"
L_GUI_LOOT_BETTER_LOOTFILTER = "Filter party & raid members loot messages, based on item rarity"
L_GUI_LOOT_ENABLE = "Enable loot frame"
L_GUI_LOOT_ICON_SIZE = "Icon size"
L_GUI_LOOT_ROLL_ENABLE = "Enable group loot frame"
L_GUI_LOOT_WIDTH = "Loot frame width"
-- Minimap
L_GUI_MINIMAP = "Minimap"
L_GUI_MINIMAP_COLLECTBUTTONS = "Collect some minimap buttons in one line"
L_GUI_MINIMAP_ENABLEMINIMAP = "Enable minimap & make it square"
L_GUI_MINIMAP_FADEBUTTONS = "Fade addon button when collected next to minimap"
L_GUI_MINIMAP_MINIMAPSIZE = "Minimap size - Default is 150"
L_GUI_MINIMAP_GARRISON = "Garrison icon shown on minimap"
L_GUI_MINIMAP_PING = "Displays a message when someone pings the minimap. |cffff0000*|r |ccfabd473Kkthnx|r |cffff0000*|r"
-- Misc
L_GUI_MISC = "Miscellaneous"
L_GUI_MISC_ALREADY_KNOWN = "Colorizes recipes, mounts & pets that are already known"
L_GUI_MISC_ARMORY_LINK = "Add Armory link in UnitPopupMenus (It can break UnitPopupMenus)"
L_GUI_MISC_AUTOREPAIR = "When visiting a repair merchant, automatically repair our gear"
L_GUI_MISC_AUTOSELLGRAYS = "When visiting a vendor, automatically sell gray quality items"
L_GUI_MISC_COLOR_PICKER = "Improved colorpicker"
L_GUI_MISC_ENCHANCED_MAIL = "Adds a take all button to your mail frame."
L_GUI_MISC_ERRORS = "Filters out messages from the UIErrorsFrame."
L_GUI_MISC_HIDE_BG_SPAM = "Remove Boss Emote spam during BG"
L_GUI_MISC_INVKEYWORD = "Short keyword for invite (/ainv)"
L_GUI_MISC_ITEMLEVEL = "Item level on character slot buttons"
L_GUI_MISC_MOVE_BLIZZARD = "Move some Blizzard frames"
L_GUI_MISC_SELLMISC = "Automatically sells useless items that are not gray quality"
L_GUI_MISC_SLOT_DURABILITY = "Durability on character slot buttons"
L_GUI_MISC_SPIN_CAMERA = "Spin camera while AFK"
L_GUI_MISC_USEGUILDREPAIR = "When using 'Auto Repair', use funds from the guild bank"
L_GUI_MISC_QUESTLEVEL = "Add questlevel to objectivetracker"
-- Nameplates
L_GUI_NAMEPLATES_AD_HEIGHT = "Additional height for selected nameplate"
L_GUI_NAMEPLATES_AD_WIDTH = "Additional width for selected nameplate"
L_GUI_NAMEPLATES_BAD_COLOR = "Bad threat color, varies depending if your a tank or dps/heal"
L_GUI_NAMEPLATES_CASTBAR = "Show nameplate castbar"
L_GUI_NAMEPLATES_CASTBAR_NAME = "Show castbar name"
L_GUI_NAMEPLATES_CLASS_ICON = "Icons by class in PvP"
L_GUI_NAMEPLATES_COMBAT = "Automatically show nameplates in combat"
L_GUI_NAMEPLATES_DEBUFFS_SIZE = "Debuffs size"
L_GUI_NAMEPLATES_ENABLE = "Enable nameplates"
L_GUI_NAMEPLATES_GOOD_COLOR = "Good threat color, varies depending if your a tank or dps/heal"
L_GUI_NAMEPLATES_HEALER_ICON = "Show icon above enemy healers nameplate in battlegrounds"
L_GUI_NAMEPLATES_HEALTH = "Numeral health value"
L_GUI_NAMEPLATES_HEIGHT = "Nameplates height"
L_GUI_NAMEPLATES_NAME_ABBREV = "Abbreviate names longer than 18 characters"
L_GUI_NAMEPLATES_NEAR_COLOR = "Losing/Gaining threat color"
L_GUI_NAMEPLATES_SHOW_DEBUFFS = "Show debuffs (from the list)"
L_GUI_NAMEPLATES_THREAT = "Enable threat feature, automatically changes by your role"
L_GUI_NAMEPLATES_WIDTH = "Nameplates width"
-- PulseCD
L_GUI_PULSECD = "Pulse Cooldowns"
L_GUI_PULSECD_ENABLE = "Show cooldowns pulse"
L_GUI_PULSECD_SIZE = "Cooldowns pulse icon size"
L_GUI_PULSECD_SOUND = "Warning sound notification"
L_GUI_PULSECD_ANIM_SCALE = "Animation scaling"
L_GUI_PULSECD_HOLD_TIME = "Max opacity hold time"
L_GUI_PULSECD_THRESHOLD = "Minimal threshold time"
-- Static Popups
L_GUI_PER_CHAR = "Are you sure you want to change to or from 'Per Char Settings'?"
L_GUI_RESET_ALL = "Are you sure you want to reset all settings for |cff3c9bedKkthnxUI|r."
L_GUI_RESET_CHAR = "Are you sure you want to reset your character's settings for|r?"
L_GUI_SET_SAVED_SETTTINGS = "Set settings Per-Character"
-- Skins
L_GUI_SKINS = "AddOn Skins"
L_GUI_SKINS_CHAT_BUBBLE = "Blizzard chat bubbles"
L_GUI_SKINS_CLCR = "CLCRet"
L_GUI_SKINS_DBM = "DeadlyBossMods"
L_GUI_SKINS_DBM_MOVE = "Allow to move DBM bars"
L_GUI_SKINS_MINIMAP_BUTTONS = "Minimap buttons"
L_GUI_SKINS_RECOUNT = "Recount"
L_GUI_SKINS_SKADA = "Skada"
L_GUI_SKINS_SPY = "Spy"
L_GUI_SKINS_WEAKAURAS = "WeakAuras"
-- Tooltip
L_GUI_TOOLTIP = "Tooltip"
L_GUI_TOOLTIP_ACHIEVEMENTS = "Comparing achievements in tooltip"
L_GUI_TOOLTIP_CURSOR = "Tooltip above cursor"
L_GUI_TOOLTIP_ENABLE = "Enable tooltip"
L_GUI_TOOLTIP_HEALTH = "Numeral health value"
L_GUI_TOOLTIP_HYPERLINK = "Display the hyperlink tooltip while hovering over a hyperlink."
L_GUI_TOOLTIP_ICON = "Item icon in tooltip"
L_GUI_TOOLTIP_INSTANCE_LOCK = "Your instance lock status in tooltip"
L_GUI_TOOLTIP_ITEM_COUNT = "Item count"
L_GUI_TOOLTIP_SHOWSPEC = "Display player specialization tooltip"
L_GUI_TOOLTIP_SPELL_ID = "Spell ID"
-- Unitframe
L_GUI_UNITFRAME = "Unit Frames"
L_GUI_UNITFRAME_CASTBARS = "Enable uniframe castbars"
L_GUI_UNITFRAME_CASTBARSAFEZONECOLOR = "Player castbar safezone color"
L_GUI_UNITFRAME_CLASSCOLOR = "Classcolor the uniframe healthbars."
L_GUI_UNITFRAME_CLASSPORTRAITS = "Enable old class portraits"
L_GUI_UNITFRAME_COMBAT_TEXT = "Show Combat Feedback"
L_GUI_UNITFRAME_ENABLE = "Enable unit frames"
L_GUI_UNITFRAME_FLAT_CLASSPORTRAITS = "Enable new class portraits"
L_GUI_UNITFRAME_FOCUSCASTBAR_HEIGHT = "Focus castbar Height"
L_GUI_UNITFRAME_FOCUSCASTBAR_WIDTH = "Focus castbar width"
L_GUI_UNITFRAME_ICONPLAYER = "Set player castbar icon 'LEFT OR RIGHT'"
L_GUI_UNITFRAME_ICONTARGET = "Set target castbar icon 'LEFT OR RIGHT'"
L_GUI_UNITFRAME_PARTY = "Enable party frames."
L_GUI_UNITFRAME_PLAYERCASTBAR_HEIGHT = "Player castbar height"
L_GUI_UNITFRAME_PLAYERCASTBAR_WIDTH = "Player castbar width"
L_GUI_UNITFRAME_PLAYERDEBUFFS_ONLY = "Only color player debuffs"
L_GUI_UNITFRAME_PORTRAITTIMER = "Show Portrait Timers"
L_GUI_UNITFRAME_POWERPREDICTIONBAR = "Power prediction bar (Display estimated cost of spells when casting)"
L_GUI_UNITFRAME_SCALE = "Scale some of the uniframes."
L_GUI_UNITFRAME_SHOWARENA = "Enable arena frames"
L_GUI_UNITFRAME_SHOWBOSS = "Enable boss frames"
L_GUI_UNITFRAME_SHOWPLAYER = "Show yourself in the party"
L_GUI_UNITFRAME_STYLE = "Style the uniframes look 'fat or normal'"
L_GUI_UNITFRAME_TARGETCASTBAR_HEIGHT = "Target castbar height"
L_GUI_UNITFRAME_TARGETCASTBAR_WIDTH = "Target castbar width"
L_GUI_UNITFRAME_TEXTHEALTHCOLOR = "Health text color"
L_GUI_UNITFRAME_TEXTNAMECOLOR = "Name text color"
L_GUI_UNITFRAME_TEXTPOWERCOLOR = "Power text color"
L_GUI_UNITFRAME_THREATGLOW = "Threat glow around unitframes"
L_GUI_UNITFRAME_THREATVALUE = "Visual threat text on the player frame"
-- Raidframe
L_GUI_RAIDFRAME = "Raid Frames"
L_GUI_RAIDFRAME_AURAWATCH = "Display timers for class specific buffs in the corners of the raid frames"
L_GUI_RAIDFRAME_AURAWATCH_TIMERS = "Display a timer on debuff icons created by Debuff Watch"
L_GUI_RAIDFRAME_DEFICITTHRESHOLD = "Health deficit threshold"
L_GUI_RAIDFRAME_ENABLE = "Enable raid frames"
L_GUI_RAIDFRAME_HEIGHT = "Height of raid frames"
L_GUI_RAIDFRAME_HORIZONTAL_HEALTHBARS = "Display the healthbars horizontal"
L_GUI_RAIDFRAME_ICONSIZE = "Size of debuff icons diplayed on raid frames."
L_GUI_RAIDFRAME_INDICATORSIZE = "Size of indicators on raid frames"
L_GUI_RAIDFRAME_MAINTANKFRAMES = "Enable the use of main tank/assist frames in raid."
L_GUI_RAIDFRAME_MANABARSHOW = "Display Manabar"
L_GUI_RAIDFRAME_MANABAR_HORIZONTAL = "Display the manabar horizontal"
L_GUI_RAIDFRAME_MAXUNIT_PERCOLUMN = "How many units per raid column"
L_GUI_RAIDFRAME_SCALE = "Scale of raid frames"
L_GUI_RAIDFRAME_SHOWMOUSEOVER_HIGHLIGHT = "Show a highlight texture on mouseover"
L_GUI_RAIDFRAME_SHOWRESURRECT_TEXT = "Display resurrection text"
L_GUI_RAIDFRAME_SHOWROLE_PREFIX = "Display role prefixes"
L_GUI_RAIDFRAME_SHOWTHREATTEXT = "Show threat text"
L_GUI_RAIDFRAME_SHOW_NOTHERETIMER = "Show AFK/Offline timers"
L_GUI_RAIDFRAME_WIDTH = "Width of raid frames"
-- WorldMap
L_GUI_WORLDMAP = "World Map"
L_GUI_WORLDMAP_ALPHA_WHENMOVING = "Alpha of the world map when you are moving."
L_GUI_WORLDMAP_COORDS = "Put coordinates on the world map."
L_GUI_WORLDMAP_FADE_WHENMOVING = "Fade the world map when you are moving."
L_GUI_WORLDMAP_FOG_OF_WAR = "Remove fog of war on World Map"
L_GUI_WORLDMAP_SMALL_WORLDMAP = "Make the world map smaller."
-- Config Buttons
L_GUI_CLOSE = "CLOSE"
L_GUI_APPLY = "APPLY"

-- Localization for deDE
local Locale = GetLocale()

if (Locale ~= "deDE") then
	return
end

local PerformanceSlight = "\n|cffFF0000Eine Deaktivierung könnte die Spielperformance leicht erhöhen|r" -- For semi-high CPU options
local ToggleOffReminder = "\n|cffFF0000Schalte diesen Menüpunt aus, um Deine Aktionsleisten manuell zu steuern|r"

-- Actionbar Localization
L_GUI_ACTIONBAR_BOTTOMBARS = "Anzahl der Leisten am unteren Rand (1, 2 oder 3)"
L_GUI_ACTIONBAR_BUTTON_SIZE = "Buttongröße"
L_GUI_ACTIONBAR_BUTTON_SPACE = "Buttonabstand"
L_GUI_ACTIONBAR_ENABLE = "Aktivere Aktionsleisten"
L_GUI_ACTIONBAR_EQUIP_BORDER = "Zeige einen grünen Rand um angelegte Items"
L_GUI_ACTIONBAR_GRID = "Zeige leere Aktionleistenplätze an"
L_GUI_ACTIONBAR_HIDE_HIGHLIGHT = "Verstecke Proc Anzeigen"
L_GUI_ACTIONBAR_HOTKEY = "Zeige Hotkey auf den Buttons"
L_GUI_ACTIONBAR_MACRO = "Zeige Makronamen auf den Buttons"
L_GUI_ACTIONBAR_OUT_OF_MANA = "Farbe wenn Mana leer"
L_GUI_ACTIONBAR_OUT_OF_RANGE = "Farbe wenn ausser Reichweite"
L_GUI_ACTIONBAR_PETBAR_HIDE = "Verstecke die Begleiterleiste"
L_GUI_ACTIONBAR_PETBAR_HORIZONTAL = "Aktiviere horizontale Begleiterleiste"
L_GUI_ACTIONBAR_PETBAR_MOUSEOVER = "Begleiterleiste bei mouseover (nur für horizontale Begleiterleiste)"
L_GUI_ACTIONBAR_RIGHTBARS = "Anzahl der Aktionsleisten rechts (0, 1, 2 oder 3)"
L_GUI_ACTIONBAR_RIGHTBARS_MOUSEOVER = "Rechte Leisten bei mouseover"
L_GUI_ACTIONBAR_SELFCAST = "Immer Selbstzauber bei rechtsklick (ungeachtet des momentanten Ziels)"
L_GUI_ACTIONBAR_SPLIT_BARS = "Teile die fünfte Aktionsleiste auf zwei Leisten mit 6 Buttons auf"
L_GUI_ACTIONBAR_STANCEBAR_HIDE = "Verstecke die Haltungsleiste"
L_GUI_ACTIONBAR_STANCEBAR_HORIZONTAL = "Aktiviere horizontale Haltungsleiste"
L_GUI_ACTIONBAR_STANCEBAR_MOUSEOVER = "Haltungsleiste bei mouseover"
L_GUI_ACTIONBAR_TOGGLE_MODE = "Aktivere Umschaltmode"..ToggleOffReminder

-- Announcements Localization
L_GUI_ANNOUNCEMENTS = "Ankündigungen"
L_GUI_ANNOUNCEMENTS_BAD_GEAR = "Überprüfe kaputte Ausrüstung in Instanzen"
L_GUI_ANNOUNCEMENTS_INTERRUPT = "Ankündigungen im Gruppen-/Schlachtzugchat wenn Du jemanden unterbrochen hast."
L_GUI_ANNOUNCEMENTS_PULL_COUNTDOWN = "Simples Script um einen Pulltimer zu starten. Tippe /pc in den Chat."
L_GUI_ANNOUNCEMENTS_SAY_SAPPED = "Kopfnussansage wenn die ein |cFFFFF569Schurke|r aus dem Kampf genommen hat."
L_GUI_ANNOUNCEMENTS_SPELLS = "Ankündigungen im Gruppen-/Schlachtzugchat wenn Du bestimmte Zauber benutzt hast."
L_GUI_ANNOUNCEMENTS_SPELLS_FROM_ALL = "Überprüfe Zauber von allen Mitspielern."

-- Automation Localization
L_GUI_AUTOMATION = "Automatisierung"
L_GUI_AUTOMATION_ACCEPTINVITE = "Automatisches Akzeptieren von Einladungen (NUR Freunde/Gildenmitglieder)"
L_GUI_AUTOMATION_AUTOCOLLAPSE = "Automatisches Einklappen der Questanzeige in Instanzen"
L_GUI_AUTOMATION_AUTO_COLLAPSE_RELOAD = "Automatisches Einklappen der Questanzeige nach einem Neuladen der UI"
L_GUI_AUTOMATION_DECLINEDUEL = "Automatische Ablehnung von Duellen"
L_GUI_AUTOMATION_LOGGING_COMBAT = "Automatisches Aktivieren der Kampflogdatei in Schlachtzuginstanzen"
L_GUI_AUTOMATION_NO_BANNER = "Auto hide the 'Boss Banner' loot frame"
L_GUI_AUTOMATION_RESURRECTION = "Automatisches Wiederbeleben auf Schlachtfeldern"
L_GUI_AUTOMATION_SCREENSHOT = "Automatisches Bildschirmfoto bei erreichen eines Erfolges"
L_GUI_AUTOMATION_TAB_BINDER = "Automatischer Wechsel der Tab-Taste um nur feindliche Ziele anzuvisieren"

-- Bag Localization
L_GUI_BAGS = "Taschen"
L_GUI_BAGS_BAG_FILTER = "Lösche automatisch unbrauchbare Gegenstände aus Deinen Taschen nach dem aufheben"
L_GUI_BAGS_BUTTON_SIZE = "Größe der Taschenplätze"
L_GUI_BAGS_ENABLE = "Aktiviere die 'Alles in einer Tasche' Ansicht"
L_GUI_BAGS_ITEMS_PER_ROW = "Taschenplatzanzahl pro Reihe"
L_GUI_BAGS_PULSE_NEW_ITEMS = "Aktiviere Pulseanimation für neue Gegenstände"
L_GUI_BAGS_SPACING = "Zwischenraum zwischen den Taschenslots"

-- Blizzard Localization
L_GUI_BLIZZARD = "Blizzard"
L_GUI_BLIZZARD_CLASS_COLOR = "Zeige Spielernamen in deren Klassenfarbe an. (Freundesliste, Wer Liste, Gildenliste, etc.)"
L_GUI_BLIZZARD_COLOR_TEXTURES = "Passe von den meisten UI Texturen den Farbton an."
L_GUI_BLIZZARD_EASYDELETE = "Lösche |CFF0080ffBlaue|r/|CFFb048f8Epische|r Gegenstände ohne 'löschen' eintippen zu müssen"
L_GUI_BLIZZARD_REPLACE_BLIZZARD_FONTS = "Ersetze die Standard |cff00B4FFBlizzard Schriftarten|r auf vielen UI Elementen der |cff3c9bedKkthnxUI|r."
L_GUI_BLIZZARD_REPUTATIONGAIN = "Zeige eine Nachricht, wenn Du Rufpunkte gesammelt hast"
L_GUI_BLIZZARD_TEXTURES_COLOR = "UI Texturfarbton. (Standard ist Klassenfarbe)"
L_GUI_BLIZZARD_VEHICLE_MOUSEOVER = "Farhzeuganzeige bei 'mouseover'"

-- DataBars
L_GUI_DATABARS = "Datenleisten"
L_GUI_DATABARS_ARTIFACT_COLOR = "Farbe der Artefaktleiste"
L_GUI_DATABARS_ARTIFACT_ENABLE = "Aktiviere die Artefaktleiste"
L_GUI_DATABARS_ARTIFACT_FADE = "Verblassen der Artefaktleiste"
L_GUI_DATABARS_ARTIFACT_HEIGHT = "Höhe der Artefaktleiste"
L_GUI_DATABARS_ARTIFACT_WIDTH = "Breite der Artefaktleiste"
L_GUI_DATABARS_EXPERIENCE_COLOR = "Farbe der Erfahrungsleiste"
L_GUI_DATABARS_EXPERIENCE_ENABLE = "Aktiviere die Erfahrungsleiste"
L_GUI_DATABARS_EXPERIENCE_FADE = "Verblassen der Erfahrungsleiste"
L_GUI_DATABARS_EXPERIENCE_HEIGHT = "Höhe der Erfahrungsleiste"
L_GUI_DATABARS_EXPERIENCE_REST_COLOR = "Farbe der Erfahrungsleiste (Erholung)"
L_GUI_DATABARS_EXPERIENCE_WIDTH = "Breite der Erfahrungsleiste"
L_GUI_DATABARS_HONOR_COLOR = "Farbe der Ehreleiste"
L_GUI_DATABARS_HONOR_ENABLE = "Aktiviere die Ehreleiste"
L_GUI_DATABARS_HONOR_FADE = "Verblassen der Ehreleiste"
L_GUI_DATABARS_HONOR_HEIGHT = "Höhe der Ehreleiste"
L_GUI_DATABARS_HONOR_WIDTH = "Breite der Ehreleiste"
L_GUI_DATABARS_REPUTATION_ENABLE = "Aktiviere die Rufleiste"
L_GUI_DATABARS_REPUTATION_FADE = "Verblassen der Rufleiste"
L_GUI_DATABARS_REPUTATION_HEIGHT = "Höhe der Rufleiste"
L_GUI_DATABARS_REPUTATION_WIDTH = "Breite der Rufleiste"

-- Auras Localization
L_GUI_AURAS = "Auren"
L_GUI_AURAS_ANIMATION = "Zeige eine 'pop in' Animation der Auren"..PerformanceSlight
L_GUI_AURAS_BUFFS_PERROW = "Anzahl der Stärkungszauber bevor eine neue Zeile angefangen wird"
L_GUI_AURAS_CASTBY = "Zeige von wem eine Aura stammt im Tooltip an"
L_GUI_AURAS_CONSOLIDATE = "Auren einklappen"
L_GUI_AURAS_ENABLE = "Aktivere Auren"
L_GUI_AURAS_FLASH = "Aufblitzen der Auren, wenn die Zeit fast abgelaufen ist"..PerformanceSlight
L_GUI_AURAS_HIDE_BUFFS = "Deaktivere die Stärkungszauberanzeige"
L_GUI_AURAS_HIDE_DEBUFFS = "Deaktivere die Schwächungszauberanzeige"

-- GUI Buttons Localization
L_GUI_BUTTON_RESET = "UI zurücksetzen"

-- Chat Localization
L_GUI_CHAT_FADING = "Aktiviere das Verblassen des Chats"
L_GUI_CHAT_DAMAGE_METER_SPAM = "Zeige den 'damage meter spam' zusammengefasst in einem 'line-link' an"
L_GUI_CHAT_ENABLE = "Aktiviere Chat"
L_GUI_CHAT_GOLD = "Lösche einigen Spam von Spielern"
L_GUI_CHAT_HEIGHT = "Höhe des Chatfensters"
L_GUI_CHAT_LINKBRACKETS = "Zeige URL Links in Klammern"
L_GUI_CHAT_LINKCOLOR = "Farbe der Links im Chat"
L_GUI_CHAT_OUTLINE = "Verwende einen Umriss um die Schriftart im Chat"
L_GUI_CHAT_SCROLLBYX = "Setze die Anzahl der Zeile die im Chat gesprungen werden beim scrollen"
L_GUI_CHAT_SPAM = "Lösche Systemspam(z.B. 'Spieler1' gewinnt ein Duell gegen 'Spieler2')"
L_GUI_CHAT_TABS_MOUSEOVER = "Chattabs bei 'mouseover'"
L_GUI_CHAT_TABS_OUTLINE = "Verwende einen Umriss um die Schritart der Chattabs"
L_GUI_CHAT_WHISP = "Spiele einen Sound ab, wenn du eine Flüsternachricht bekommst"
L_GUI_CHAT_WIDTH = "Breite des Chatfensters"

-- DataText Localization
L_GUI_DATATEXT = "Datatexte"
L_GUI_DATATEXT_BATTLEGROUND = "Aktiviere die Datatextanzeige auf Schlachtfeldern"
L_GUI_DATATEXT_LOCALTIME = "Benutze die lokale Zeit bei der Zeitanzeige auf der Minimap, anstatt der Serverzeit"
L_GUI_DATATEXT_LOCATION = "Aktivere die Positionsanzeige oben auf der Minimap"
L_GUI_DATATEXT_SYSTEM = "Aktivere den Datatext unter der Minimap, der Dir Deine FPS & MS anzeigt"
L_GUI_DATATEXT_TIME = "Aktiviere den Datatext auf der Minimap, der Dir die Uhrzeit anzeigt"
L_GUI_DATATEXT_TIME24HR = "Stelle die Zeitanzeige in der MInimap auf das 24 Stunden Format um"
L_GUI_DATATEXT_BOTTOMBAR = "Aktiviere eine Datatextleiste unter den Aktionsleisten"

-- Cooldown Localization
L_GUI_COOLDOWN = "Abklingzeiten"
L_GUI_COOLDOWN_ENABLE = "Aktivere das UI Modul für die Abklingzeiten"
L_GUI_COOLDOWN_FONT_SIZE = "Schriftgröße der Abklingzeiten"
L_GUI_COOLDOWN_THRESHOLD = "Abklingzeiten Schwellenwert"

-- Filger Localization
L_GUI_FILGER = "Filger"
L_GUI_FILGER_BUFFS_SIZE = "Größe der Stärkungszauber"
L_GUI_FILGER_COOLDOWN_SIZE = "Größe Abklingzeiten"
L_GUI_FILGER_DISABLE_CD = "Deaktivere Abklingzeiten"
L_GUI_FILGER_ENABLE = "Aktiviere Filger"
L_GUI_FILGER_MAX_TEST_ICON = "Anzahl der Symbole beim Testen"
L_GUI_FILGER_PVP_SIZE = "Größe der PvP Schwächungszauber"
L_GUI_FILGER_SHOW_TOOLTIP = "Zeige Tooltip"
L_GUI_FILGER_TEST_MODE = "Testmodus der Symbole"

-- General Localization
L_GUI_GENERAL_AUTOSCALE = "Automatische UI Skalierung"
L_GUI_GENERAL_CHATBUBBLE_FONTSIZE = "Schriftgröße in den Sprachblasen"
L_GUI_GENERAL_CHATBUBBLE_NOBACKDROP = "Entferne den Hintergrund der Sprachblasen."
L_GUI_GENERAL_LAG_TOLERANCE = "Automatisches Update der 'Blizzard Custom Lag Tolerance' Option zu Deiner Latenz"
L_GUI_GENERAL_SHOW_CONFIG_BUTTON = "Zeigt den Konfigurationsbutton an der Minimap an"
L_GUI_GENERAL_TRANSLATE_MESSAGE = "Popup anzeigen für Hilfe bei der UI Übersetzung."
L_GUI_GENERAL_UISCALE = "UI Skalierung (Wenn automatische Skalierung deaktivert ist)"
L_GUI_GENERAL_WELCOME_MESSAGE = "Willkommensnachricht im Chat anzeigen."

-- Loot Localization
L_GUI_LOOT_AUTODE = "Auto confirm disenchant"
L_GUI_LOOT_AUTOGREED = "Aktiviere automatisch auf Gier & Entzaubern würfeln bei grünen Gegenständen auf Max Level"
L_GUI_LOOT_BETTER_LOOTFILTER = "Filter die Gruppen- & Schlachtzugmitglieder Nachrichten, basierend auf den Gegenstandsqualität"
L_GUI_LOOT_ENABLE = "Aktiviere das Beutefenster"
L_GUI_LOOT_ICON_SIZE = "Symbolgröße"
L_GUI_LOOT_ROLL_ENABLE = "Aktivere das Fenster für die Beute der Gruppen"
L_GUI_LOOT_WIDTH = "Größe des Beutefensters"

-- Minimap Localization
L_GUI_MINIMAP = "Minimap"
L_GUI_MINIMAP_COLLECTBUTTONS = "Sammel die Minimapbuttons und zeige sie in einer Leiste an"
L_GUI_MINIMAP_ENABLEMINIMAP = "Aktiviere die Minimap & zeige sie viereckig"
L_GUI_MINIMAP_FADEBUTTONS = "Fade addon button when collected next to minimap"
L_GUI_MINIMAP_MINIMAPSIZE = "Größe der Minimap - Standard ist 150"
L_GUI_MINIMAP_GARRISON = "Zeige das Garnisonssymbol an der Minimap"
L_GUI_MINIMAP_PING = "Zeige eine Nachricht, wenn jemand auf der Minimap 'pingt'. |cffff0000*|r |ccfabd473Kkthnx|r |cffff0000*|r"

-- Misc Localization
L_GUI_MISC = "Sonstiges"
L_GUI_MISC_ALREADY_KNOWN = "Färbe Rezepte, Reittiere & Haustiere die Du bereits kennst"
L_GUI_MISC_ARMORY_LINK = "Zeige einen Link zur Armory an, wenn Du die Einstellungen eines Einheitenfensters aufrufst"
L_GUI_MISC_AUTOREPAIR = "Repariere automatisch Deine Ausrüstung beim Händler"
L_GUI_MISC_AUTOSELLGRAYS = "Verkaufe automatisch graue Gegenstände beim Händler"
L_GUI_MISC_COLOR_PICKER = "Verbesserte Farbauswahl"
L_GUI_MISC_ENCHANCED_MAIL = "Fügt einen 'Öffne Alles' Button deinem Briefkasten hinzu."
L_GUI_MISC_ERRORS = "Filtert Nachrichten aus dem UIFehlerFenster raus."
L_GUI_MISC_HIDE_BG_SPAM = "Lösche 'Boss Emote spam' während du auf dem Schlachtfeld bist"
L_GUI_MISC_INVKEYWORD = "Schlüsselwort zum einladen (/ainv)"
L_GUI_MISC_ITEMLEVEL = "Zeige den Itemlevel auf Deinen Gegenständen in der Charakterübersicht an"
L_GUI_MISC_MOVE_BLIZZARD = "Verschiebe einige Blizzard Fenster"
L_GUI_MISC_SELLMISC = "Automatisches Verkaufen von unnützen Gegenständen die nicht grauer Qualität sind"
L_GUI_MISC_SLOT_DURABILITY = "Zeige die Haltbarkeit auf Deinen Gegenständen in der Charakterübersicht an"
L_GUI_MISC_SPIN_CAMERA = "Drehe die Kamera während Du AFK bist"
L_GUI_MISC_USEGUILDREPAIR = "Bei Benutzung von 'Automatisches Reparieren', benutzte die Gildenbank"

-- NamePlate Localization
L_GUI_NAMEPLATES = "Namensplaketten"
L_GUI_NAMEPLATES_AD_HEIGHT = "Zusätzliche Höhe für die ausgewählte Namenplakette"
L_GUI_NAMEPLATES_AD_WIDTH = "Zusätzliche Breite für die ausgewählte Namenplakette"
L_GUI_NAMEPLATES_BAD_COLOR = "Farbe wenn die Bedrohung NICHT ok ist, variert je nach Rolle die Du spielst ->dps/heal"
L_GUI_NAMEPLATES_CASTBAR = "Zeige Zauberleiste"
L_GUI_NAMEPLATES_CASTBAR_NAME = "Zeige namen des Zaubers"
L_GUI_NAMEPLATES_CLASS_ICON = "Symbole nach Klasse im PvP"
L_GUI_NAMEPLATES_COMBAT = "Automatisches Anzeigen der Namensplaketten im Kampf"
L_GUI_NAMEPLATES_DEBUFFS_SIZE = "Größe der Schwächungszauber"
L_GUI_NAMEPLATES_ENABLE = "Aktiviere die Namensplaketten"
L_GUI_NAMEPLATES_GOOD_COLOR = "Farbe wenn die Bedrohung ok ist, variert je nach Rolle die Du spielst ->dps/heal"
L_GUI_NAMEPLATES_HEALER_ICON = "Zeige Symbole über den Namensplaketten an, wenn der Spieler ein Heiler ist"
L_GUI_NAMEPLATES_HEALTH = "Zeige die Lebenswerte auf den Plaketten an"
L_GUI_NAMEPLATES_HEIGHT = "Höhe der Namensplaketten"
L_GUI_NAMEPLATES_NAME_ABBREV = "Kürze den Namen wenn er länger als 18 Zeichen ist"
L_GUI_NAMEPLATES_NEAR_COLOR = "Verliere/Gewinne Bedrohungsfarbe"
L_GUI_NAMEPLATES_SHOW_DEBUFFS = "Zeige Schwächungszauber"
L_GUI_NAMEPLATES_THREAT = "Aktiviere das Bedrohungsfeature. Wechselt automatisch je nach Deiner Rolle"
L_GUI_NAMEPLATES_WIDTH = "Breite der Namensplaketten"

-- PulseCD Localization
L_GUI_PULSECD = "Pulsieren"
L_GUI_PULSECD_ENABLE = "Zeige pulsierende Abklingzeiten"
L_GUI_PULSECD_SIZE = "Symbolgröße der pulsierende Abklingzeiten"
L_GUI_PULSECD_SOUND = "Soundwarnung"
L_GUI_PULSECD_ANIM_SCALE = "Animationsskalierung"
L_GUI_PULSECD_HOLD_TIME = "Maximal anhaltende Effektdauer"
L_GUI_PULSECD_THRESHOLD = "Minimaler Schwellwert"

-- Static Popup Localization
L_GUI_PER_CHAR = "Bist Du sicher, dass Du auf 'Einstellungen für jeden Charakter einzeln' wechseln willst?"
L_GUI_RESET_ALL = "Bist Du sicher, dass Du alle Einstellungen für das |cff3c9bedKkthnxUI|r zurücksetzen willst?"
L_GUI_RESET_CHAR = "Bist Du sicher, dass Du die Einstellungen für jeden Deiner Charaktere zurücksetzen willst|r?"
L_GUI_SET_SAVED_SETTTINGS = "Setze Einstellungen für jeden Charakter einzeln"

-- Skins Localization
L_GUI_SKINS = "AddOn Skins"
L_GUI_SKINS_CHAT_BUBBLE = "Blizzard Sprachblasen"
L_GUI_SKINS_DBM = "DeadlyBossMods"
L_GUI_SKINS_DBM_MOVE = "Erlaube das Bewegen der DBM Leisten"
L_GUI_SKINS_MINIMAP_BUTTONS = "Minimap buttons"
L_GUI_SKINS_RECOUNT = "Recount"
L_GUI_SKINS_SKADA = "Skada"
L_GUI_SKINS_SPY = "Spy"
L_GUI_SKINS_WEAKAURAS = "WeakAuras"

-- Tooltip Localization
L_GUI_TOOLTIP = "Tooltip"
L_GUI_TOOLTIP_ACHIEVEMENTS = "Vergleiche Erfolge per Tooltip"
L_GUI_TOOLTIP_CURSOR = "Tooltip über dem Cursor"
L_GUI_TOOLTIP_ENABLE = "Aktiviere Tooltip"
L_GUI_TOOLTIP_HEALTH = "Lebensanzeige über dem Tooltip"
L_GUI_TOOLTIP_HYPERLINK = "Zeige den Hyperlinktooltip während du it der Maus über einen Hyperlink gehst."
L_GUI_TOOLTIP_ICON = "Gegenstandsymbol im Tooltip anzeigen"
L_GUI_TOOLTIP_INSTANCE_LOCK = "Deine Instantensperrungen im Tooltip anzeigen"
L_GUI_TOOLTIP_ITEM_COUNT = "Gegenstandsmenge anzeigen"
L_GUI_TOOLTIP_SHOWSPEC = "Zeige die Spieler Spezialisierung und den Gegenstandlevel im Tooltip an"
L_GUI_TOOLTIP_SPELL_ID = "Zauber-ID anzeigen"

-- Unitframe Localization
L_GUI_UNITFRAME = "Einheitenfenster"
L_GUI_UNITFRAME_CASTBARS = "Aktiviere die Zauberleiste"
L_GUI_UNITFRAME_CASTBARSAFEZONECOLOR = "Farbe der Spielerzauberleiste Pufferzone"
L_GUI_UNITFRAME_CLASSCOLOR = "Lebensleisten in Klassenfarbe anzeigen."
L_GUI_UNITFRAME_CLASSPORTRAITS = "Aktiviere die alten Klassenportraits"
L_GUI_UNITFRAME_COMBAT_TEXT = "Zeige KampfFeedback auf den Einheitenfenstern an"
L_GUI_UNITFRAME_ENABLE = "Aktiviere die Einheitenfenster"
L_GUI_UNITFRAME_FLAT_CLASSPORTRAITS = "Aktiviere die neuen Klassenportraits"
L_GUI_UNITFRAME_FOCUSCASTBAR_HEIGHT = "Höhe der Fokus Zauberleiste"
L_GUI_UNITFRAME_FOCUSCASTBAR_WIDTH = "breite der Fokus Zauberleiste"
L_GUI_UNITFRAME_ICONPLAYER = "Set player castbar icon 'LEFT OR RIGHT'"
L_GUI_UNITFRAME_ICONTARGET = "Set target castbar icon 'LEFT OR RIGHT'"
L_GUI_UNITFRAME_PARTY = "Aktiviere die Gruppenfenster."
L_GUI_UNITFRAME_PLAYERCASTBAR_HEIGHT = "Höhe der Spielerzauberleiste"
L_GUI_UNITFRAME_PLAYERCASTBAR_WIDTH = "Breite der Spielerzauberleiste"
L_GUI_UNITFRAME_PLAYERDEBUFFS_ONLY = "Färbe nur Spieler Schwächungszauber"
L_GUI_UNITFRAME_PORTRAITTIMER = "Zeige Portrait Zeiten"
L_GUI_UNITFRAME_POWERPREDICTIONBAR = "Power prediction bar (Zeigt die wahrscheinlichen Kosten des Zaubers in der Leiste an)"
L_GUI_UNITFRAME_SCALE = "Skalierung einiger Einheitenfenster."
L_GUI_UNITFRAME_SHOWARENA = "Aktiviere die Arenafenster"
L_GUI_UNITFRAME_SHOWBOSS = "Aktiviere die Bossfenster"
L_GUI_UNITFRAME_SHOWPLAYER = "Zeige dich selbst in der Gruppe an"
L_GUI_UNITFRAME_STYLE = "Style den Look der Einheitenfenster 'fat oder normal'"
L_GUI_UNITFRAME_TARGETCASTBAR_HEIGHT = "Höhe der Zauberleiste des Ziels"
L_GUI_UNITFRAME_TARGETCASTBAR_WIDTH = "Breite der Zauberleiste des Ziels"
L_GUI_UNITFRAME_TEXTHEALTHCOLOR = "Farbe des Lebenstextes"
L_GUI_UNITFRAME_TEXTNAMECOLOR = "Farbe des Namenstextes"
L_GUI_UNITFRAME_TEXTPOWERCOLOR = "Farbe des Powertextes"
L_GUI_UNITFRAME_THREATGLOW = "Aktiviere das Bedrohungsleuchten um die Einheitenfenster"
L_GUI_UNITFRAME_THREATVALUE = "Visueller Bedrohungstext auf dem Spielerfenster"

-- Raidframe Localization
L_GUI_RAIDFRAME = "Schlachtzug"
L_GUI_RAIDFRAME_AURAWATCH = "Zeige die Timer für Klassenspezifische Buffs in den Ecken des Schlachtzugsfenster an"
L_GUI_RAIDFRAME_AURAWATCH_TIMERS = "Zeige die Timer an den Debuff Icons die erstellt werden mit Debuff beobachten"
L_GUI_RAIDFRAME_DEFICITTHRESHOLD = "Heilung Schwellenwert"
L_GUI_RAIDFRAME_HEIGHT = "Höhe der Schlachtzugsfenster"
L_GUI_RAIDFRAME_HORIZONTAL_HEALTHBARS = "Zeige die Lebensbalken horizontal an"
L_GUI_RAIDFRAME_ICONSIZE = "Größe der Schwächungszaubersymbole auf den Schlachtzugsfenstern."
L_GUI_RAIDFRAME_INDICATORSIZE = "Größe der Schlachtzugsfenster Indikatoren auf den Schlachtzugsfenstern."
L_GUI_RAIDFRAME_MANABAR_HORIZONTAL = "Zeige die Manaleiste horizontal an"
L_GUI_RAIDFRAME_MANABARSHOW = "Zeige die Manaleiste"
L_GUI_RAIDFRAME_MAXUNIT_PERCOLUMN = "Wieviele Einheitenfenster pro Schlachtzugsreihe"
L_GUI_RAIDFRAME_SCALE = "Skalierung der Schlachtzugsfenster"
L_GUI_RAIDFRAME_SHOW_NOTHERETIMER = "Zeige AFK/Offline Zeit an"
L_GUI_RAIDFRAME_SHOWMOUSEOVER_HIGHLIGHT = "Hebe die Einheitenfenster per 'mouseover' hevor"
L_GUI_RAIDFRAME_SHOWRESURRECT_TEXT = "Zeige Wiederbelebungstext an"
L_GUI_RAIDFRAME_SHOWROLE_PREFIX = "Zeige Rollenpräfixe '> + -'"
L_GUI_RAIDFRAME_SHOWTHREATTEXT = "Zeige Bedrohungstext 'AGGRO'"
L_GUI_RAIDFRAME_RAIDASPARTY = "Zeige die Schlachtzugsfenster, anstatt der Gruppenfenster."
L_GUI_RAIDFRAME_WIDTH = "Breite der Schlachtzugsfenster"
L_GUI_RAIDFRAME_ENABLE = "Aktiviere Schlachtzugsfenster"
L_GUI_RAIDFRAME_MAINTANKFRAMES = "Aktiviere die Anzeige von Haupttank/assist Fenstern im Schlachtzug."

-- WorldMap Localization
L_GUI_WORLDMAP = "Weltkarte"
L_GUI_WORLDMAP_ALPHA_WHENMOVING = "Alphawert der Weltkarte wenn Du Dich bewegst."
L_GUI_WORLDMAP_COORDS = "Zeige Koordinaten auf der Weltkarte an."
L_GUI_WORLDMAP_FADE_WHENMOVING = "Verblassen der Weltkarte wenn Du Dich bewegst."
L_GUI_WORLDMAP_FOG_OF_WAR = "Entferne den Nebel des Krieges auf der Weltkarte."
L_GUI_WORLDMAP_SMALL_WORLDMAP = "Kleine Weltkarte anzeigen."

-- Config Buttons
L_GUI_CLOSE = "SCHLIEßEN"
L_GUI_APPLY = "ÜBERNEHMEN"

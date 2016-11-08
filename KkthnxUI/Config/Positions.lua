local K, C, L = select(2, ...):unpack()

-- If you're saving frame positions, use "UIParent", not UIParent
C["Position"] = {
	["Alerts"] = {"TOP", "UIParent", "TOP", 0, -22},
	["AltPowerBar"] = {"TOP", "UIParent", "TOP", 0, -100},
	["Attempt"] = {"TOP", "UIParent", "TOP", -85, -25},
	["BGScore"] = {"TOPLEFT", "UIParent", "TOPLEFT", 0, -4},
	["Bag"] = {"BOTTOMRIGHT", "UIParent", "BOTTOMRIGHT", -4, 204},
	["Bank"] = {"BOTTOMLEFT", "UIParent", "BOTTOMLEFT", 4, 204},
	["BnetPopup"] = {"BOTTOMLEFT", "ChatFrame1", "TOPLEFT", -2, 62},
	["BottomBars"] = {"BOTTOM", "UIParent", "BOTTOM", 0, 5},
	["CaptureBar"] = {"TOP", "UIParent", "TOP", 0, -170},
	["Chat"] = {"BOTTOMLEFT", "UIParent", "BOTTOMLEFT", 3, 5},
	["ExtraButton"] = {"BOTTOMRIGHT", "ActionButton1", "BOTTOMLEFT", -3, 0},
	["GroupLoot"] = {"BOTTOM", "UIParent", "BOTTOM", -238, 700},
	["Loot"] = {"TOPLEFT", "UIParent", "TOPLEFT", 245, -220},
	["Minimap"] = {"TOPRIGHT", "UIParent", "TOPRIGHT", -4, -4},
	["MinimapButtons"] = {"TOPRIGHT", "Minimap", "TOPLEFT", -4, 1},
	["PetHorizontal"] = {"BOTTOMRIGHT", "UIParent", "BOTTOM", -175, 167},
	["PlayerBuffs"] = {"TOPRIGHT", "Minimap", "TOPLEFT", -26, 2},
	["PulseCD"] = {"CENTER", "UIParent", "CENTER", 0, 0},
	["RaidUtility"] = {"TOP", "UIParent", "TOP", -280, -4},	
	["RightBars"] = {"BOTTOMRIGHT", "UIParent", "BOTTOMRIGHT", -5, 330},
	["StanceBar"] = {"BOTTOMRIGHT", "UIParent", "BOTTOM", -202, 167},
	["SystemDT"] = {"CENTER", "KkthnxUIMinimapStats", "CENTER", 0, 0.5},
	["TalkingHead"] = {"TOP", "UIParent", "TOP", 0, -21},
	["Ticket"] = {"TOPLEFT", "UIParent", "TOPLEFT", 0, -1},
	["Tooltip"] = {"BOTTOMRIGHT", "UIParent", "BOTTOMRIGHT", -2, 2},
	["UIError"] = {"TOP", "UIParent", "TOP", 0, -80},
	["Vehicle"] = {"TOP", "Minimap", "BOTTOM", 0, -18},
	["VehicleBar"] = {"BOTTOMRIGHT", "ActionButton1", "BOTTOMLEFT", -3, 0},
	["WorldMap"] = {"CENTER", "UIParent", "CENTER", 0, 100},
	["ObjectiveTracker"] = {"TOPRIGHT", "UIParent", "TOPRIGHT", -160, -270},
	-- Unitframe positions
	UnitFrames = {
		["Arena"] = {"BOTTOMRIGHT", "UIParent", "RIGHT", -140, 140},
		["Boss"] = {"BOTTOMRIGHT", "UIParent", "RIGHT", -140, 140},
		["Focus"] = {"BOTTOMRIGHT", "oUF_KkthnxPlayer", "TOPLEFT", -60, 30},
		["FocusCastbar"] = {"BOTTOM", "oUF_KkthnxFocus", "TOP", 0, 50},
		["FocusTarget"] = {"TOPLEFT", "oUF_KkthnxFocus", "BOTTOMRIGHT", -38, -16},
		["Party"] = {"TOPLEFT", "UIParent", "TOPLEFT", 6, -175},
		["Pet"] = {"TOPLEFT", "oUF_KkthnxPlayer", "BOTTOMLEFT", 0, -12},
		["Player"] = {"BOTTOMRIGHT", "ActionBarAnchor", "TOPLEFT", -9, 175},
		["PlayerCastbar"] = {"BOTTOM", "ActionBarAnchor", "TOP", 0, 175},
		["Raid"] = {"TOPLEFT", "UIParent", "TOPLEFT", 6, -175},
		["Target"] = {"BOTTOMLEFT", "ActionBarAnchor", "TOPRIGHT", 9, 175},
		["TargetCastbar"] = {"BOTTOM", "oUF_KkthnxPlayerCastbar", "TOP", 0, 7},
		["TargetTarget"] = {"TOPLEFT", "oUF_KkthnxTarget", "BOTTOMRIGHT", -78, -16},
	},
	-- Filger positions
	Filger = {
		["Cooldown"] = {"BOTTOMRIGHT", "oUF_KkthnxPlayer", "TOPRIGHT", 63, 17},
		["PlayerBuffIcon"] = {"BOTTOMRIGHT", "oUF_KkthnxPlayer", "TOPRIGHT", 2, 173},
		["PlayerProcIcon"] = {"BOTTOMLEFT", "oUF_KkthnxTarget", "TOPLEFT", -2, 173},
		["PvECC"] = {"TOPLEFT", "oUF_KkthnxPlayer", "BOTTOMLEFT", -20, -44},
		["PvEDebuff"] = {"BOTTOMRIGHT", "oUF_KkthnxPlayer", "TOPRIGHT", 2, 253},
		["SpecialProcIcon"] = {"BOTTOMRIGHT", "oUF_KkthnxPlayer", "TOPRIGHT", 2, 213},
		["TargetBar"] = {"BOTTOMLEFT", "oUF_KkthnxTarget", "BOTTOMRIGHT", 22, -42},
		["TargetBuffIcon"] = {"BOTTOMLEFT", "oUF_KkthnxTarget", "TOPLEFT", -2, 253},
		["TargetDebuffIcon"] = {"BOTTOMLEFT", "oUF_KkthnxTarget", "TOPLEFT", -2, 213},
	},
}

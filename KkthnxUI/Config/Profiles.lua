local K, C, L = select(2, ...):unpack()

-----------------------------------------------------------------
-- CONFIG
-----------------------------------------------------------------

-- C["Tooltip"]["Cursor"] = true
C["ActionBar"]["BottomBars"] = 2
C["ActionBar"]["ButtonSize"] = 30
C["ActionBar"]["ButtonSpace"] = 2
C["ActionBar"]["EquipBorder"] = true
C["ActionBar"]["Grid"] = false
-- C["ActionBar"]["RightBarsMouseover"] = false
-- C["ActionBar"]["Macro"] = false 
-- C["ActionBar"]["Hotkey"] = false 
C["ActionBar"]["SplitBars"] = true
C["Announcements"]["SaySapped"] = true
-- C["Auras"]["Consolidate"] = true
C["Auras"]["Animation"] = true
C["Bags"]["Enable"] = false
C["Blizzard"]["EasyDelete"] = true
-- C["Blizzard"]["ColorTextures"] = true
-- C["Blizzard"]["TexturesColor"] = {0, 0, 0, 0} 
C["Chat"]["DamageMeterSpam"] = true
C["Chat"]["Spam"] = true
C["Chat"]["WhispSound"] = false
C["DataText"]["BottomBar"] = false
-- C["Experience"]["XPWidth"] =243 
-- C["Experience"]["ArtifactWidth"] =243 
-- C["Filger"]["Enable"] = false 
C["General"]["AutoScale"] = false 
C["General"]["CustomLagTolerance"] = true
C["General"]["UIScale"] = 0.70 
C["General"]["BubbleBackdrop"] = true
C["Loot"]["AutoGreed"] = true
C["Loot"]["ConfirmDisenchant"] = true
C["Misc"]["AFKCamera"] = true
C["Misc"]["AlreadyKnown"] = true
C["Misc"]["Armory"] = true
C["Misc"]["BGSpam"] = true
C["Misc"]["CombatText"] = true 
C["Misc"]["DurabilityWarning"] = true
C["Misc"]["ItemLevel"] = true
C["Misc"]["MoveBlizzard"] = true
-- C["Minimap"]["Size"] = 250 
-- C["Minimap"]["Invert"] = true
-- C["Nameplate"]["EnhanceThreat"] = false 
-- C["Nameplate"]["ClassColor"] = true
C["Nameplates"]["Height"] = 14
C["Nameplates"]["HealerIcon"] = true
-- C["Nameplates"]["TrackAuras"] = false
C["PulseCD"]["Enable"] = true
C["Skins"]["Skada"] = true
C["Skins"]["DBM"] = true
C["Skins"]["ChatBubble"] = true
-- C["Skins"]["WeakAuras"] = true
C["Unitframe"]["CombatText"] = false
-- C["Unitframe"]["Enable"] = false 
C["Unitframe"]["ShowArena"] = false 
-- C["Raidframe"]["Enable"] = false 

C["Raidframe"]["ShowRolePrefix"] = true 
C["Raidframe"]["Height"] = 30
C["Raidframe"]["Width"] = 32 
C["Raidframe"]["ManabarShow"] = false
C["Raidframe"]["IndicatorSize"] = 10
C["Raidframe"]["IconSize"] = 12
C["Raidframe"]["RaidAsParty"] = true
-- C["Unitframe"]["Scale"] = 1.2
-- C["Unitframe"]["Party"] = false
-- C["Unitframe"]["FlatClassPortraits"] = true
C["WorldMap"]["FogOfWar"] = true

-----------------------------------------------------------------
-- POSITIONS
-----------------------------------------------------------------

C["Position"]["PulseCD"] = {"CENTER", "UIParent", "CENTER", -200, 0}
-- C["Position"]["UnitFrames"]["TargetCastBar"] = {"BOTTOM", "CastingBarFrame", "TOP", 0, 101} 

-- C["Position"]["UnitFrames"]["Player"] = {"BOTTOMRIGHT", "ActionBarAnchor", "TOPLEFT", 150, 75}
-- C["Position"]["UnitFrames"]["Target"] = {"BOTTOMLEFT", "ActionBarAnchor", "TOPRIGHT", -150, 75}

if K.Role == "HEALER" then
	C["Raidframe"]["MaxUnitPerColumn"] = 5
	C["Position"]["UnitFrames"]["Raid"] = {"CENTER", "UIParent", "Center", 200, -30}
	C["Position"]["UnitFrames"]["Focus"] = {"CENTER", "UIParent", "Center", 320, 0}
end

-- if K.Role == "MELEE" then
-- 	C["Position"]["UnitFrames"]["Player"] = {"CENTER", "UIParent", "CENTER", -320, 0}
-- 	C["Position"]["UnitFrames"]["Target"] = {"CENTER", "UIParent", "CENTER", 320, 0}
-- end

C["Position"]["RaidCD"] = {"TOPLEFT", "UIParent", "TOPLEFT", -200, 0}
-- C["Position"]["ObjectiveTracker"] = {"TOPLEFT", "UIParent", "TOPLEFT", 130, -100}
-- C["Position"]["Filger"]["Cooldown"] = {"BOTTOMRIGHT", "PlayerFrame", "TOPLEFT", 0, 100}
-- C["Position"]["Filger"]["PlayerProcIcon"] = {"TOPRIGHT", "TargetFrame", "TOPRIGHT", -150, 173}
-- C["Position"]["Filger"]["PlayerBuffIcon"] = {"TOPRIGHT", "PlayerFrame", "TOPRIGHT", -50, 173}
-- C["Position"]["Filger"]["TargetBuffIcon"] = {"TOPRIGHT", "TargetFrame", "TOPRIGHT", -80, 353}
-- C["Position"]["Filger"]["TargetDebuffIcon"] = {"TOPRIGHT", "TargetFrame", "TOPRIGHT", -80, 303}

-- INVERT MINIMAP

C["Minimap"]["InvertDataBars"] = true
C["Position"]["Minimap"] = {"BOTTOMRIGHT", "UIParent", "BOTTOMRIGHT", -2, 2}
C["Position"]["PlayerBuffs"] = {"TOPRIGHT", "UIParent", "TOPRIGHT", -5, -5}
C["Position"]["Tooltip"] = {"BOTTOMRIGHT", "UIParent", "BOTTOMRIGHT", -((150 + 2) + 2), 2}

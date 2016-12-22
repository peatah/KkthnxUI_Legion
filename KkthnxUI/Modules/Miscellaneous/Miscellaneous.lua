local K, C, L = unpack(select(2, ...))

-- WoW Lua
local select = select
local tostring = tostring
local unpack = unpack

-- Wow API
local GetBattlefieldStatus = GetBattlefieldStatus
local GetCVar = GetCVar
local GetCVarBool = GetCVarBool
local GetLFGDungeonInfo = GetLFGDungeonInfo
local GetLFGDungeonRewards = GetLFGDungeonRewards
local GetLFGRandomDungeonInfo = GetLFGRandomDungeonInfo
local GetMaxBattlefieldID = GetMaxBattlefieldID
local GetNumRandomDungeons = GetNumRandomDungeons
local GetZoneText = GetZoneText
local hooksecurefunc = hooksecurefunc
local PlaySound = PlaySound
local PlaySoundFile = PlaySoundFile
local SetCVar = SetCVar

-- GLOBALS: TicketStatusFrame, HelpOpenTicketButton, HelpOpenWebTicketButton, Minimap, GMMover, UIParent
-- GLOBALS: TalkingHeadFrame, LFDQueueFrame_SetType, L_ZONE_ARATHIBASIN, L_ZONE_GILNEAS, AuctionFrame
-- GLOBALS: SideDressUpModel, SideDressUpModelResetButton, DressUpModel, DressUpFrameResetButton

local Movers = K.Movers

-- Fix frame level for UIErrorsFrame
UIErrorsFrame:SetFrameLevel(0)

-- Move some frames (Shestak)
local HeadFrame = CreateFrame("Frame")
HeadFrame:RegisterEvent("ADDON_LOADED")
HeadFrame:SetScript("OnEvent", function(self, event, addon)
	if (addon == "Blizzard_TalkingHeadUI") then
		TalkingHeadFrame.ignoreFramePositionManager = true
		TalkingHeadFrame:ClearAllPoints()
		TalkingHeadFrame:SetPoint(unpack(C.Position.TalkingHead))
	end
end)

-- Move some frames (Elvui)
local TicketStatusMover = CreateFrame("Frame", "TicketStatusMoverAnchor", UIParent)
TicketStatusMover:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 250, -6)
TicketStatusMover:SetSize(200, 40)
Movers:RegisterFrame(TicketStatusMover)

local TicketFrame = CreateFrame("Frame")
TicketFrame:RegisterEvent("PLAYER_LOGIN")
TicketFrame:SetScript("OnEvent", function(self, event)
	TicketStatusFrame:ClearAllPoints()
	TicketStatusFrame:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 250, -5)
	-- Blizzard repositions this frame now in UIParent_UpdateTopFramePositions
	hooksecurefunc(TicketStatusFrame, "SetPoint", function(self, _, anchor)
		if anchor == UIParent then
			TicketStatusFrame:ClearAllPoints()
			TicketStatusFrame:SetPoint("TOPLEFT", TicketStatusMover, 0, 0)
		end
	end)
end)

-- LevelUp + BossBanner Mover
local LBBMover = CreateFrame("Frame", "LevelUpBossBannerHolder", UIParent)
LBBMover:SetSize(200, 20)
LBBMover:SetPoint("TOP", UIParent, "TOP", 0, -120)

local LevelUpBossBanner = CreateFrame("Frame")
LevelUpBossBanner:RegisterEvent("PLAYER_LOGIN")
LevelUpBossBanner:SetScript("OnEvent", function(self, event)
	Movers:RegisterFrame(LBBMover)

	local function Reanchor(frame, _, anchor)
		if anchor ~= LBBMover then
			frame:ClearAllPoints()
			frame:SetPoint("TOP", LBBMover)
		end
	end

	-- Level Up Display
	LevelUpDisplay:ClearAllPoints()
	LevelUpDisplay:SetPoint("TOP", LBBMover)
	hooksecurefunc(LevelUpDisplay, "SetPoint", Reanchor)

	-- Boss Banner
	BossBanner:ClearAllPoints()
	BossBanner:SetPoint("TOP", LBBMover)
	hooksecurefunc(BossBanner, "SetPoint", Reanchor)
end)

-- Force readycheck warning
local ShowReadyCheckHook = function(self, initiator)
	if initiator ~= "player" then
		PlaySound("ReadyCheck", "Master")
	end
end
hooksecurefunc("ShowReadyCheck", ShowReadyCheckHook)

-- Force lockActionBars CVar
local ForceCVar = CreateFrame("Frame")
ForceCVar:RegisterEvent("PLAYER_LOGIN")
ForceCVar:RegisterEvent("CVAR_UPDATE")
ForceCVar:SetScript("OnEvent", function(self, event)
	if not GetCVarBool("lockActionBars") and C.ActionBar.Enable then
		SetCVar("lockActionBars", 1)
	end
end)

-- Force other warning
local ForceWarning = CreateFrame("Frame")
ForceWarning:RegisterEvent("UPDATE_BATTLEFIELD_STATUS")
ForceWarning:RegisterEvent("PET_BATTLE_QUEUE_PROPOSE_MATCH")
ForceWarning:RegisterEvent("LFG_PROPOSAL_SHOW")
ForceWarning:RegisterEvent("RESURRECT_REQUEST")
ForceWarning:SetScript("OnEvent", function(self, event)
	if event == "UPDATE_BATTLEFIELD_STATUS" then
		for i = 1, GetMaxBattlefieldID() do
			local status = GetBattlefieldStatus(i)
			if status == "confirm" then
				PlaySound("PVPTHROUGHQUEUE", "Master")
				break
			end
		end
	elseif event == "PET_BATTLE_QUEUE_PROPOSE_MATCH" then
		PlaySound("PVPTHROUGHQUEUE", "Master")
	elseif event == "LFG_PROPOSAL_SHOW" then
		PlaySound("ReadyCheck", "Master")
	elseif event == "RESURRECT_REQUEST" then
		PlaySoundFile([[Sound\Spells\Resurrection.wav]], "Master")
	end
end)

-- Auto select current event boss from LFD tool(EventBossAutoSelect by Nathanyel)
local firstLFD
LFDParentFrame:HookScript("OnShow", function()
	if not firstLFD then
		firstLFD = 1
		for i = 1, GetNumRandomDungeons() do
			local id = GetLFGRandomDungeonInfo(i)
			local isHoliday = select(15, GetLFGDungeonInfo(id))
			if isHoliday and not GetLFGDungeonRewards(id) then
				LFDQueueFrame_SetType(id)
			end
		end
	end
end)

-- Custom lag tolerance
if C.General.CustomLagTolerance == true then
	local customlag = CreateFrame("Frame")
	local int = 5
	local _, _, _, lag = GetNetStats()
	local LatencyUpdate = function(self, elapsed)
		int = int - elapsed
		if int < 0 then
			if GetCVar("reducedLagTolerance") ~= tostring(1) then SetCVar("reducedLagTolerance", tostring(1)) end
			if lag ~= 0 and lag <= 400 then
				SetCVar("maxSpellStartRecoveryOffset", tostring(lag))
			end
			int = 5
		end
	end
	customlag:SetScript("OnUpdate", LatencyUpdate)
	LatencyUpdate(customlag, 10)
end

-- Remove boss emote spam during bg(ArathiBasin SpamFix by Partha)
if C.Misc.BGSpam == true then
	local Fixer = CreateFrame("Frame")
	local RaidBossEmoteFrame, spamDisabled = RaidBossEmoteFrame

	local function DisableSpam()
		if GetZoneText() == L_ZONE_ARATHIBASIN or GetZoneText() == L_ZONE_GILNEAS then
			RaidBossEmoteFrame:UnregisterEvent("RAID_BOSS_EMOTE")
			spamDisabled = true
		elseif spamDisabled then
			RaidBossEmoteFrame:RegisterEvent("RAID_BOSS_EMOTE")
			spamDisabled = false
		end
	end

	Fixer:RegisterEvent("PLAYER_ENTERING_WORLD")
	Fixer:RegisterEvent("ZONE_CHANGED_NEW_AREA")
	Fixer:SetScript("OnEvent", DisableSpam)
end

-- Boss Banner Hider
if C.Misc.NoBanner == true then
	BossBanner.PlayBanner = function() end
end

--	Hide TalkingHeadFrame
if C.Misc.HideTalkingHead == true then
	local HideTalkingHead = CreateFrame("Frame")
	HideTalkingHead:RegisterEvent("ADDON_LOADED")
	HideTalkingHead:SetScript("OnEvent", function(self, event, addon)
		if addon == "Blizzard_TalkingHeadUI" then
			hooksecurefunc("TalkingHeadFrame_PlayCurrent", function()
				TalkingHeadFrame:Hide()
			end)
			self:UnregisterEvent(event)
		end
	end)
end

-- Disable QuestTrackingTooltips while in raid and in combat
-- This can become a spam fest when you have 20+ people on the same quest!
local QuestTracking = CreateFrame("Frame")
QuestTracking:RegisterEvent("GROUP_ROSTER_UPDATE")
QuestTracking:SetScript("OnEvent", function(self, event)
	SetCVar("showQuestTrackingTooltips", IsInRaid() and 0 or 1)
end)

-- Undress button in auction dress-up frame(by Nefarion)
local strip = CreateFrame("Button", "DressUpFrameUndressButton", DressUpFrame, "UIPanelButtonTemplate")
strip:SetText(L.Misc.Undress)
strip:SetHeight(22)
strip:SetWidth(strip:GetTextWidth() + 40)
strip:SetPoint("RIGHT", DressUpFrameResetButton, "LEFT", -2, 0)
strip:RegisterForClicks("AnyUp")
strip:SetScript("OnClick", function(self, button)
	if button == "RightButton" then
		self.model:UndressSlot(19)
	else
		self.model:Undress()
	end
	PlaySound("gsTitleOptionOK")
end)
strip.model = DressUpModel

strip:RegisterEvent("AUCTION_HOUSE_SHOW")
strip:RegisterEvent("AUCTION_HOUSE_CLOSED")
strip:SetScript("OnEvent", function(self)
	if AuctionFrame:IsVisible() and self.model ~= SideDressUpModel then
		self:SetParent(SideDressUpModel)
		self:ClearAllPoints()
		self:SetPoint("TOP", SideDressUpModelResetButton, "BOTTOM", 0, -3)
		self.model = SideDressUpModel
	elseif self.model ~= DressUpModel then
		self:SetParent(DressUpModel)
		self:ClearAllPoints()
		self:SetPoint("RIGHT", DressUpFrameResetButton, "LEFT", -2, 0)
		self.model = DressUpModel
	end
end)

-- Wardrobes

local TestCode = CreateFrame("Frame")

function TestCode:Blizzard_Collections(event, addon)
    if event == "PLAYER_ENTERING_WORLD" and IsAddOnLoaded("Blizzard_Collections") or addon == "Blizzard_Collections" then
        WardrobeFrame:SetWidth(1200)
        WardrobeTransmogFrame:SetWidth(535)
        WardrobeTransmogFrame.Model:ClearAllPoints()
        WardrobeTransmogFrame.Model:SetPoint("TOP", WardrobeTransmogFrame, "TOP", 0, -4)
        WardrobeTransmogFrame.Model:SetWidth(420)
        WardrobeTransmogFrame.Model:SetHeight(420)
        WardrobeTransmogFrame.Inset.BG:SetWidth(529)
        WardrobeTransmogFrame.Model.HeadButton:ClearAllPoints()
        WardrobeTransmogFrame.Model.HeadButton:SetPoint("TOP", WardrobeTransmogFrame.Model, "TOP", -238, -41)
        WardrobeTransmogFrame.Model.HandsButton:ClearAllPoints()
        WardrobeTransmogFrame.Model.HandsButton:SetPoint("TOP", WardrobeTransmogFrame.Model, "TOP", 235, -118);
        WardrobeTransmogFrame.Model.MainHandButton:ClearAllPoints()
        WardrobeTransmogFrame.Model.MainHandButton:SetPoint("TOP", WardrobeTransmogFrame.Model, "BOTTOM", -26, -5)
        WardrobeTransmogFrame.Model.SecondaryHandButton:ClearAllPoints()
        WardrobeTransmogFrame.Model.SecondaryHandButton:SetPoint("TOP", WardrobeTransmogFrame.Model, "BOTTOM", 27, -5)
        WardrobeTransmogFrame.Model.MainHandEnchantButton:ClearAllPoints()
        WardrobeTransmogFrame.Model.MainHandEnchantButton:SetPoint("BOTTOM", WardrobeTransmogFrame.Model.MainHandButton, "BOTTOM", 0, -20)
        WardrobeTransmogFrame.Model.SecondaryHandEnchantButton:ClearAllPoints()
        WardrobeTransmogFrame.Model.SecondaryHandEnchantButton:SetPoint("BOTTOM", WardrobeTransmogFrame.Model.SecondaryHandButton, "BOTTOM", 0, -20)
    end
end

TestCode:RegisterEvent("PLAYER_LOGIN")
TestCode:SetScript("OnEvent", TestCode.Blizzard_Collections)

-- local wdFrame = CreateFrame("Frame")
-- wdFrame:RegisterEvent("ADDON_LOADED")
-- wdFrame:SetScript("OnEvent", function(self, event)
--     WardrobeFrame:SetWidth(1200)
--     -- WardrobeFrame:SetScale(0.82)
--     WardrobeTransmogFrame:SetWidth(535) 
--     WardrobeTransmogFrame.Model:ClearAllPoints()
--     WardrobeTransmogFrame.Model:SetPoint("TOP", WardrobeTransmogFrame, "TOP", 0, -4)
--     WardrobeTransmogFrame.Model:SetWidth(420)
--     WardrobeTransmogFrame.Model:SetHeight(420)
--     WardrobeTransmogFrame.Inset.BG:SetWidth(529)
--     WardrobeTransmogFrame.Model.HeadButton:ClearAllPoints()
--     WardrobeTransmogFrame.Model.HeadButton:SetPoint("TOP", WardrobeTransmogFrame.Model, "TOP", -238, -41)
--     WardrobeTransmogFrame.Model.HandsButton:ClearAllPoints()
--     WardrobeTransmogFrame.Model.HandsButton:SetPoint("TOP", WardrobeTransmogFrame.Model, "TOP", 235, -118);
--     WardrobeTransmogFrame.Model.MainHandButton:ClearAllPoints()
--     WardrobeTransmogFrame.Model.MainHandButton:SetPoint("TOP", WardrobeTransmogFrame.Model, "BOTTOM", -26, -5)
--     WardrobeTransmogFrame.Model.SecondaryHandButton:ClearAllPoints()
--     WardrobeTransmogFrame.Model.SecondaryHandButton:SetPoint("TOP", WardrobeTransmogFrame.Model, "BOTTOM", 27, -5)
--     WardrobeTransmogFrame.Model.MainHandEnchantButton:ClearAllPoints()
--     WardrobeTransmogFrame.Model.MainHandEnchantButton:SetPoint("BOTTOM", WardrobeTransmogFrame.Model.MainHandButton, "BOTTOM", 0, -20)
--     WardrobeTransmogFrame.Model.SecondaryHandEnchantButton:ClearAllPoints()
--     WardrobeTransmogFrame.Model.SecondaryHandEnchantButton:SetPoint("BOTTOM", WardrobeTransmogFrame.Model.SecondaryHandButton, "BOTTOM", 0, -20)
-- end)


-- Hide blizzard combat text
	SetCVar("floatingCombatTextCombatHealing", 0)
	SetCVar("floatingCombatTextCombatDamage", 0)
local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LOGOUT")
frame:SetScript("OnEvent", function(self, event)
	if event == "PLAYER_LOGOUT" then
		SetCVar("floatingCombatTextCombatHealing", 0)
		SetCVar("floatingCombatTextCombatDamage", 0)
	end
end)

-- Camera zoom

local f = CreateFrame ("frame")
local once = ...
f:RegisterEvent ("ADDON_LOADED")

local AdjustCamera = function()
	if (not InCombatLockdown()) then
		SetCVar ("cameraDistanceMaxZoomFactor", 2.6)
		MoveViewOutStart (50000)
		f.Ticker:Cancel()
		f = nil
	end
end

f:SetScript ("OnEvent", function (self, event, ...)
	if (once == ...) then
		f.Ticker = C_Timer.NewTicker (.3, AdjustCamera)
		f:UnregisterEvent ("ADDON_LOADED")
		once = nil
	end
end)

-- Old achievements filter
function AchievementFrame_GetCategoryNumAchievements_OldIncomplete(categoryID)
	local numAchievements, numCompleted = GetCategoryNumAchievements(categoryID)
	return numAchievements - numCompleted, 0, numCompleted
end

function old_nocomplete_filter_init()
	AchievementFrameFilters = {
		{text = ACHIEVEMENTFRAME_FILTER_ALL, func = AchievementFrame_GetCategoryNumAchievements_All},
		{text = ACHIEVEMENTFRAME_FILTER_COMPLETED, func = AchievementFrame_GetCategoryNumAchievements_Complete},
		{text = ACHIEVEMENTFRAME_FILTER_INCOMPLETE, func = AchievementFrame_GetCategoryNumAchievements_Incomplete},
		{text = ACHIEVEMENTFRAME_FILTER_INCOMPLETE.." ("..ALL.." )", func = AchievementFrame_GetCategoryNumAchievements_OldIncomplete}
	}
end

local OldAchievementFilter = CreateFrame("Frame")
OldAchievementFilter:RegisterEvent("ADDON_LOADED")
OldAchievementFilter:SetScript("OnEvent", function(self, event, addon, ...)
	if addon == "Blizzard_AchievementUI" then
		if AchievementFrame then
			old_nocomplete_filter_init()
			OldAchievementFilter:UnregisterEvent("ADDON_LOADED")
		end
	end
end)

local K, C, L = unpack(select(2, ...))
if C.DataBars.HonorEnable ~= true or K.Level ~= MAX_PLAYER_LEVEL then return end

-- WoW Lua
local _G = _G
local format = string.format

-- Wow API
local GetMaxPlayerHonorLevel = GetMaxPlayerHonorLevel
local HideUIPanel = HideUIPanel

local LoadAddOn = LoadAddOn
local PlayerTalentTab_OnClick = PlayerTalentTab_OnClick
local PVP_HONOR_PRESTIGE_AVAILABLE = PVP_HONOR_PRESTIGE_AVAILABLE
local PVP_HONOR_XP_BAR_CANNOT_PRESTIGE_HERE = PVP_HONOR_XP_BAR_CANNOT_PRESTIGE_HERE
local PVP_PRESTIGE_RANK_UP_TITLE = PVP_PRESTIGE_RANK_UP_TITLE
local ShowUIPanel = ShowUIPanel
local TogglePVPUI = TogglePVPUI
local UnitHonor = UnitHonor
local UnitHonorLevel = UnitHonorLevel
local UnitHonorMax = UnitHonorMax
local UnitPrestige = UnitPrestige

-- Global variables that we don't cache, list them here for mikk's FindGlobals script
-- GLOBALS: PVPFrame, PlayerTalentFrame, PVP_TALENTS_TAB, GameTooltip, HONOR, RANK

local Bars = 20
local Movers = K.Movers

local Anchor = CreateFrame("Frame", "HonorAnchor", UIParent)
Anchor:SetSize(C.DataBars.HonorWidth, C.DataBars.HonorHeight)
if C.Minimap.InvertDataBars then
	Anchor:SetPoint("TOP", Minimap, "TOP", 0, 48 + 8)
else
	Anchor:SetPoint("TOP", Minimap, "BOTTOM", 0, -48)
end
Movers:RegisterFrame(Anchor)

local HonorBar = CreateFrame("StatusBar", nil, UIParent)
HonorBar:SetOrientation("HORIZONTAL")
HonorBar:SetSize(C.DataBars.HonorWidth, C.DataBars.HonorHeight)
HonorBar:SetPoint("CENTER", HonorAnchor, "CENTER", 0, 0)
HonorBar:SetStatusBarTexture(C.Media.Texture)
HonorBar:SetStatusBarColor(unpack(C.DataBars.HonorColor))

K.CreateBorder(HonorBar, -1)
HonorBar:SetBackdrop({bgFile = C.Media.Blank,insets = {left = -1, right = -1, top = -1, bottom = -1}})
HonorBar:SetBackdropColor(unpack(C.Media.Backdrop_Color))

if C.Blizzard.ColorTextures == true then
	HonorBar:SetBackdropBorderColor(unpack(C.Blizzard.TexturesColor))
end

HonorBar:SetScript("OnMouseUp", function(self)
	if GetMouseFocus() == self then
		local isInstance, instanceType = IsInInstance()

		if isInstance and (instanceType == "pvp") then
			LoadAddOn("Blizzard_TalentUI")

			if PlayerTalentFrame:IsShown() then
				HideUIPanel(PlayerTalentFrame)

			else
				PlayerTalentFrame:Show()
				PlayerTalentTab_OnClick(_G["PlayerTalentFrameTab"..PVP_TALENTS_TAB])
			end

		else
			TogglePVPUI()
		end
	end
end)

local function UpdateHonorBar()
	local Current, Max = UnitHonor("player"), UnitHonorMax("player")
	HonorBar:SetMinMaxValues(0, Max)
	HonorBar:SetValue(Current)
end

HonorBar:SetScript("OnEnter", function(self)
	local Current, Max = UnitHonor("player"), UnitHonorMax("player")
	local Level = UnitHonorLevel("player")
	local LevelMax = GetMaxPlayerHonorLevel()
	local Prestige = UnitPrestige("player")

	GameTooltip:ClearLines()
	GameTooltip:SetOwner(self, "ANCHOR_CURSOR", 0, -4)

	if Max == 0 then
		GameTooltip:AddLine(PVP_HONOR_PRESTIGE_AVAILABLE)
		GameTooltip:AddLine(PVP_HONOR_XP_BAR_CANNOT_PRESTIGE_HERE)
	else
		GameTooltip:AddLine(format("|cffee2222"..HONOR..": %d / %d (%d%% - %d/%d)|r", Current, Max, Current / Max * 100, Bars - (Bars * (Max - Current) / Max), Bars))
		GameTooltip:AddLine(format("|cffcccccc"..RANK..": %d / %d|r", Level, LevelMax))
		GameTooltip:AddLine(format("|cffcccccc"..PVP_PRESTIGE_RANK_UP_TITLE..": %d|r", Prestige))
	end
	GameTooltip:AddLine(" ")
	GameTooltip:AddLine(L.DataBars.HonorLeftClick)
	GameTooltip:AddLine(L.DataBars.HonorRightClick)

	GameTooltip:Show()
end)

HonorBar:SetScript("OnLeave", function() GameTooltip:Hide() end)

if C.DataBars.HonorFade then
	HonorBar:SetAlpha(0)
	HonorBar:HookScript("OnEnter", function(self) self:SetAlpha(1) end)
	HonorBar:HookScript("OnLeave", function(self) self:SetAlpha(0) end)
	HonorBar.Tooltip = true
end

HonorBar:RegisterEvent("PLAYER_ENTERING_WORLD")
HonorBar:RegisterEvent("HONOR_XP_UPDATE")
HonorBar:RegisterEvent("HONOR_LEVEL_UPDATE")
HonorBar:RegisterEvent("HONOR_PRESTIGE_UPDATE")

HonorBar:SetScript("OnEvent", UpdateHonorBar)
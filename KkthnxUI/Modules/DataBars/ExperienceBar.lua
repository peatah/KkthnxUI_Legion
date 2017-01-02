local K, C, L = unpack(select(2, ...))
if C.DataBars.ExperienceEnable ~= true or K.Level == MAX_PLAYER_LEVEL then return end

-- WoW Lua
local format = string.format
local unpack = unpack

-- Wow API
local GetRestState = GetRestState
local GetXPExhaustion = GetXPExhaustion
local UnitXP = UnitXP
local UnitXPMax = UnitXPMax

-- Global variables that we don't cache, list them here for mikk's FindGlobals script
-- GLOBALS: CreateFrame, XP, TUTORIAL_TITLE26, GameTooltip

local Bars = 20
local Movers = K.Movers

-- Temp fix for a backdrop atm.
local function XPBackdrop(f)
	if f.backdrop then return end

	local b = CreateFrame("Frame", nil, f)
	b:SetPoint("TOPLEFT", -1, 1)
	b:SetPoint("BOTTOMRIGHT", 1, -1)
	b:SetBackdrop({bgFile = C.Media.Blank})
	b:SetBackdropColor(unpack(C.Media.Backdrop_Color))

	if f:GetFrameLevel() - 1 >= 0 then
		b:SetFrameLevel(f:GetFrameLevel() - 1)
	else
		b:SetFrameLevel(0)
	end

	f.backdrop = b
end

local Anchor = CreateFrame("Frame", "ExperienceAnchor", UIParent)
Anchor:SetSize(C.DataBars.ExperienceWidth, C.DataBars.ExperienceHeight)
if C.Minimap.InvertDataBars then
	Anchor:SetPoint("TOP", Minimap, "TOP", 0, 33 + 8)
else
	Anchor:SetPoint("TOP", Minimap, "BOTTOM", 0, -33)
end
K.Movers:RegisterFrame(Anchor)

local ExperienceBar = CreateFrame("StatusBar", nil, UIParent)

K.CreateBorder(ExperienceBar, -1)
XPBackdrop(ExperienceBar)
ExperienceBar:SetOrientation("HORIZONTAL")
ExperienceBar:SetSize(C.DataBars.ExperienceWidth, C.DataBars.ExperienceHeight)
ExperienceBar:SetParent(UIParent)
ExperienceBar:ClearAllPoints()
ExperienceBar:SetPoint("CENTER", Anchor, "CENTER", 0, 0)
ExperienceBar:SetStatusBarTexture(C.Media.Texture)
ExperienceBar:SetStatusBarColor(unpack(C.DataBars.ExperienceColor))

local ExperienceBarRested = CreateFrame("StatusBar", nil, ExperienceBar)
ExperienceBarRested:SetOrientation("HORIZONTAL")
ExperienceBarRested:SetSize(C.DataBars.ExperienceWidth, C.DataBars.ExperienceHeight)
ExperienceBarRested:SetParent(ExperienceBar)
ExperienceBarRested:SetAllPoints()
ExperienceBarRested:SetStatusBarTexture(C.Media.Texture)
ExperienceBarRested:SetStatusBarColor(unpack(C.DataBars.ExperienceRestedColor))
ExperienceBarRested:SetAlpha(.5)

if C.Blizzard.ColorTextures == true then
	ExperienceBar:SetBackdropBorderColor(unpack(C.Blizzard.TexturesColor))
end

local function UpdateExperienceBar()
	local Current, Max = UnitXP("player"), UnitXPMax("player")
	local Rested = GetXPExhaustion()
	local IsRested = GetRestState()

	ExperienceBar:SetMinMaxValues(0, Max)
	ExperienceBar:SetValue(Current)

	if (IsRested == 1 and Rested) then
		ExperienceBar:RegisterEvent("UPDATE_EXHAUSTION")
		ExperienceBarRested:SetFrameLevel(ExperienceBar:GetFrameLevel() - 1)
		ExperienceBarRested:SetMinMaxValues(0, Max)
		ExperienceBarRested:SetValue(Rested + Current)
	else
		ExperienceBar:UnregisterEvent("UPDATE_EXHAUSTION")
		ExperienceBarRested:Hide()
	end
end

ExperienceBar:SetScript("OnEnter", function(self)
	local Current, Max = UnitXP("player"), UnitXPMax("player")
	local Rested = GetXPExhaustion()
	local IsRested = GetRestState()

	if Max == 0 then
		return
	end

	GameTooltip:ClearLines()
	GameTooltip:SetOwner(self, "ANCHOR_CURSOR", 0, -4)

	GameTooltip:AddLine(format("|cff0090FF"..XP..": %d / %d (%d%% - %d/%d)|r", Current, Max, Current / Max * 100, Bars - (Bars * (Max - Current) / Max), Bars))

	if (IsRested == 1 and Rested) then
		GameTooltip:AddLine(format("|cff4BAF4C"..TUTORIAL_TITLE26..": +%d (%d%%)|r", Rested, Rested / Max * 100))
	end

	GameTooltip:Show()
end)

ExperienceBar:SetScript("OnLeave", function() GameTooltip:Hide() end)

if C.DataBars.ExperienceFade then
	ExperienceBar:SetAlpha(0)
	ExperienceBar:HookScript("OnEnter", function(self) self:SetAlpha(1) end)
	ExperienceBar:HookScript("OnLeave", function(self) self:SetAlpha(0) end)
	ExperienceBar.Tooltip = true
end

ExperienceBar:RegisterEvent("DISABLE_XP_GAIN", true)
ExperienceBar:RegisterEvent("ENABLE_XP_GAIN", true)
ExperienceBar:RegisterEvent("PLAYER_ENTERING_WORLD")
ExperienceBar:RegisterEvent("PLAYER_LEVEL_UP")
ExperienceBar:RegisterEvent("PLAYER_XP_UPDATE")

if event == "PLAYER_ENTERING_WORLD" then
	ExperienceBar:UnregisterEvent("PLAYER_ENTERING_WORLD")
end

ExperienceBar:SetScript("OnEvent", UpdateExperienceBar)
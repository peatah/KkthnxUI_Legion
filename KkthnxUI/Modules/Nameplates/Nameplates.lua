local K, C, L = select(2, ...):unpack()
if C.Nameplates.Enable ~= true then return end

-- Lua API
local floor = math.floor -- ??
local format = string.format -- ??
local huge = math.huge
local tinsert = table.insert
local unpack = unpack

-- Wow API
local CLASS_ICON_TCOORDS = CLASS_ICON_TCOORDS
local CreateFrame = CreateFrame
local GetArenaOpponentSpec = GetArenaOpponentSpec
local GetBattlefieldScore = GetBattlefieldScore
local GetNumBattlefieldScores = GetNumBattlefieldScores
local GetSpecializationInfoByID = GetSpecializationInfoByID
local GetTime = GetTime
local InCombatLockdown = InCombatLockdown
local IsInGroup = IsInGroup
local IsInInstance = IsInInstance
local IsInRaid = IsInRaid
local SetCVar = SetCVar
local UnitAffectingCombat = UnitAffectingCombat
local UnitClass = UnitClass
local UnitDetailedThreatSituation = UnitDetailedThreatSituation
local UnitExists = UnitExists
local UnitFactionGroup = UnitFactionGroup
local UnitIsPlayer = UnitIsPlayer
local UnitIsTapDenied = UnitIsTapDenied
local UnitIsUnit = UnitIsUnit
local UnitName = UnitName
local UnitReaction = UnitReaction
local UnitSelectionColor = UnitSelectionColor
local GetNumGroupMembers = GetNumGroupMembers
local UnitGroupRolesAssigned = UnitGroupRolesAssigned

-- Global variables that we don't cache, list them here for mikk's FindGlobals script
-- GLOBALS: C_NamePlate, ShowUIPanel, GameTooltip, UnitAura, SetVirtualBorder

-- oUF nameplates
local _, ns = ...
local oUF = ns.oUF

-- Only show nameplates when in combat
local KkthnxUIPlates = CreateFrame("Frame", nil, UIParent)
KkthnxUIPlates:SetScript("OnEvent", function(self, event, ...) self[event](self, ...) end)
if C.Nameplates.Combat == true then
	KkthnxUIPlates:RegisterEvent("PLAYER_REGEN_ENABLED")
	KkthnxUIPlates:RegisterEvent("PLAYER_REGEN_DISABLED")

	function KkthnxUIPlates:PLAYER_REGEN_ENABLED()
		SetCVar("nameplateShowEnemies", 0)
	end

	function KkthnxUIPlates:PLAYER_REGEN_DISABLED()
		SetCVar("nameplateShowEnemies", 1)
	end
end

KkthnxUIPlates:RegisterEvent("PLAYER_ENTERING_WORLD")
function KkthnxUIPlates:PLAYER_ENTERING_WORLD()
	if C.Nameplates.Combat == true then
		if InCombatLockdown() then
			SetCVar("nameplateShowEnemies", 1)
		else
			SetCVar("nameplateShowEnemies", 0)
		end
	end
	if C.Nameplates.EnhancedThreat == true then
		SetCVar("threatWarning", 3)
	end
	SetCVar("namePlateMinScale", 1)
	SetCVar("namePlateMaxScale", 1)
	SetCVar("nameplateLargerScale", 1)
	SetCVar("nameplateMinAlpha", 1)
	SetCVar("nameplateMaxAlpha", 1)

	SetCVar("nameplateOtherTopInset", C.Nameplates.Clamp and 0.08 or -1)
	SetCVar("nameplateOtherBottomInset", C.Nameplates.Clamp and 0.1 or -1)
	SetCVar("nameplateMaxDistance", C.Nameplates.Distance or 40)
end

local healList, exClass, healerSpecs = {}, {}, {}
local testing = false

exClass.DEATHKNIGHT = true
exClass.MAGE = true
exClass.ROGUE = true
exClass.WARLOCK = true
exClass.WARRIOR = true
if C.Nameplates.HealerIcon == true then
	local t = CreateFrame("Frame")
	t.factions = {
		["Horde"] = 1,
		["Alliance"] = 0,
	}
	local healerSpecIDs = {
		105,	-- Druid Restoration
		270,	-- Monk Mistweaver
		65,		-- Paladin Holy
		256,	-- Priest Discipline
		257,	-- Priest Holy
		264,	-- Shaman Restoration
	}
	for _, specID in pairs(healerSpecIDs) do
		local _, name = GetSpecializationInfoByID(specID)
		if name and not healerSpecs[name] then
			healerSpecs[name] = true
		end
	end

	local lastCheck = 20
	local function CheckHealers(self, elapsed)
		lastCheck = lastCheck + elapsed
		if lastCheck > 25 then
			lastCheck = 0
			healList = {}
			for i = 1, GetNumBattlefieldScores() do
				local name, _, _, _, _, faction, _, _, _, _, _, _, _, _, _, talentSpec = GetBattlefieldScore(i)

				if name and healerSpecs[talentSpec] and t.factions[UnitFactionGroup("player")] == faction then
					name = name:match("(.+)%-.+") or name
					healList[name] = talentSpec
				end
			end
		end
	end

	local function CheckArenaHealers(self, elapsed)
		lastCheck = lastCheck + elapsed
		if lastCheck > 25 then
			lastCheck = 0
			healList = {}
			for i = 1, 5 do
				local specID = GetArenaOpponentSpec(i)
				if specID and specID > 0 then
					local name = UnitName(format("arena%d", i))
					local _, talentSpec = GetSpecializationInfoByID(specID)
					if name and healerSpecs[talentSpec] then
						healList[name] = talentSpec
					end
				end
			end
		end
	end

	local function CheckLoc(self, event)
		if event == "PLAYER_ENTERING_WORLD" or event == "PLAYER_ENTERING_BATTLEGROUND" then
			local _, instanceType = IsInInstance()
			if instanceType == "pvp" then
				t:SetScript("OnUpdate", CheckHealers)
			elseif instanceType == "arena" then
				t:SetScript("OnUpdate", CheckArenaHealers)
			else
				healList = {}
				t:SetScript("OnUpdate", nil)
			end
		end
	end

	t:RegisterEvent("PLAYER_ENTERING_WORLD")
	t:RegisterEvent("PLAYER_ENTERING_BATTLEGROUND")
	t:SetScript("OnEvent", CheckLoc)
end

local totemData = {
	[GetSpellInfo(192058)] = "Interface\\Icons\\spell_nature_brilliance", -- Lightning Surge Totem
	[GetSpellInfo(98008)] = "Interface\\Icons\\spell_shaman_spiritlink", -- Spirit Link Totem
	[GetSpellInfo(192077)] = "Interface\\Icons\\ability_shaman_windwalktotem", -- Wind Rush Totem
	[GetSpellInfo(204331)] = "Interface\\Icons\\spell_nature_wrathofair_totem", -- Counterstrike Totem
	[GetSpellInfo(204332)] = "Interface\\Icons\\spell_nature_windfury", -- Windfury Totem
	[GetSpellInfo(204336)] = "Interface\\Icons\\spell_nature_groundingtotem", -- Grounding Totem
	-- Water
	[GetSpellInfo(157153)] = "Interface\\Icons\\ability_shaman_condensationtotem", -- Cloudburst Totem
	[GetSpellInfo(5394)] = "Interface\\Icons\\INV_Spear_04", -- Healing Stream Totem
	[GetSpellInfo(108280)] = "Interface\\Icons\\ability_shaman_healingtide", -- Healing Tide Totem
	-- Earth
	[GetSpellInfo(207399)] = "Interface\\Icons\\spell_nature_reincarnation", -- Ancestral Protection Totem
	[GetSpellInfo(198838)] = "Interface\\Icons\\spell_nature_stoneskintotem", -- Earthen Shield Totem
	[GetSpellInfo(51485)] = "Interface\\Icons\\spell_nature_stranglevines", -- Earthgrab Totem
	[GetSpellInfo(61882)] = "Interface\\Icons\\spell_shaman_earthquake", -- Earthquake Totem
	[GetSpellInfo(196932)] = "Interface\\Icons\\spell_totem_wardofdraining", -- Voodoo Totem
	-- Fire
	[GetSpellInfo(192222)] = "Interface\\Icons\\spell_shaman_spewlava", -- Liquid Magma Totem
	[GetSpellInfo(204330)] = "Interface\\Icons\\spell_fire_totemofwrath", -- Skyfury Totem
	-- Totem Mastery
	[GetSpellInfo(202188)] = "Interface\\Icons\\spell_nature_stoneskintotem", -- Resonance Totem
	[GetSpellInfo(210651)] = "Interface\\Icons\\spell_shaman_stormtotem", -- Storm Totem
	[GetSpellInfo(210657)] = "Interface\\Icons\\spell_fire_searingtotem", -- Ember Totem
	[GetSpellInfo(210660)] = "Interface\\Icons\\spell_nature_invisibilitytotem", -- Tailwind Totem
}


local FormatTime = function(s)
	local day, hour, minute = 86400, 3600, 60
	if s >= day then
		return format("%dd", floor(s / day + 0.5)), s % day
	elseif s >= hour then
		return format("%dh", floor(s / hour + 0.5)), s % hour
	elseif s >= minute then
		return format("%dm", floor(s / minute + 0.5)), s % minute
	elseif s >= minute / 12 then
		return floor(s + 0.5), (s * 100 - floor(s * 100)) / 100
	end
	return format("%.1f", s), (s * 100 - floor(s * 100)) / 100
end

local CreateAuraTimer = function(self, elapsed)
	if self.timeLeft then
		self.elapsed = (self.elapsed or 0) + elapsed
		if self.elapsed >= 0.1 then
			if not self.first then
				self.timeLeft = self.timeLeft - self.elapsed
			else
				self.timeLeft = self.timeLeft - GetTime()
				self.first = false
			end
			if self.timeLeft > 0 then
				local time = FormatTime(self.timeLeft)
				self.remaining:SetText(time)
				self.remaining:SetTextColor(1, 1, 1)
			else
				self.remaining:Hide()
				self:SetScript("OnUpdate", nil)
			end
			self.elapsed = 0
		end
	end
end

local function threatColor(self, forced)
	if UnitIsPlayer(self.unit) then return end
	local combat = UnitAffectingCombat("player")
	local _, threatStatus = UnitDetailedThreatSituation("player", self.unit)

	if C.Nameplates.EnhancedThreat ~= true then
		K.SetShadowBorder(self.Health, unpack(C.Media.Nameplate_BorderColor))
	end

	if UnitIsTapDenied(self.unit) then
		self.Health:SetStatusBarColor(0.6, 0.6, 0.6)
	elseif combat then
		if threatStatus == 3 then -- securely tanking, highest threat
			if K.Role == "TANK" then
				if C.Nameplates.EnhancedThreat == true then
					self.Health:SetStatusBarColor(unpack(C.Nameplates.GoodColor))
				else
					K.SetShadowBorder(self.Health, unpack(C.Nameplates.BadColor))
				end
			else
				if C.Nameplates.EnhancedThreat == true then
					self.Health:SetStatusBarColor(unpack(C.Nameplates.BadColor))
				else
					K.SetShadowBorder(self.Health, unpack(C.Nameplates.BadColor))
				end
			end
		elseif threatStatus == 2 then -- insecurely tanking, another unit have higher threat but not tanking
			if C.Nameplates.EnhancedThreat == true then
				self.Health:SetStatusBarColor(unpack(C.Nameplates.NearColor))
			else
				K.SetShadowBorder(self.Health, unpack(C.Nameplates.NearColor))
			end
		elseif threatStatus == 1 then -- not tanking, higher threat than tank
			if C.Nameplates.EnhancedThreat == true then
				self.Health:SetStatusBarColor(unpack(C.Nameplates.NearColor))
			else
				K.SetShadowBorder(self.Health, unpack(C.Nameplates.NearColor))
			end
		elseif threatStatus == 0 then -- not tanking, lower threat than tank
			if C.Nameplates.EnhancedThreat == true then
				if K.Role == "TANK" then
					self.Health:SetStatusBarColor(unpack(C.Nameplates.BadColor))
					if IsInGroup() or IsInRaid() then
						for i = 1, GetNumGroupMembers() do
							if UnitExists("raid"..i) and not UnitIsUnit("raid"..i, "player") then
								local isTanking = UnitDetailedThreatSituation("raid"..i, self.unit)
								if isTanking and UnitGroupRolesAssigned("raid"..i) == "TANK" then
									self.Health:SetStatusBarColor(unpack(C.Nameplates.OffTankColor))
								end
							end
						end
					end
				else
					self.Health:SetStatusBarColor(unpack(C.Nameplates.GoodColor))
				end
			end
		end
	elseif not forced then
		self.Health:ForceUpdate()
	end
end

local function UpdateTarget(self)
	if UnitIsUnit(self.unit, "target") and not UnitIsUnit(self.unit, "player") then
		self:SetSize((C.Nameplates.Width + C.Nameplates.AdditionalWidth) * K.NoScaleMult, (C.Nameplates.Height + C.Nameplates.AdditionalHeight) * K.NoScaleMult)
		self.Castbar:SetPoint("BOTTOMLEFT", self.Health, "BOTTOMLEFT", 0, -8-((C.Nameplates.Height + C.Nameplates.AdditionalHeight) * K.NoScaleMult))
		self.Castbar.Icon:SetSize(((C.Nameplates.Height + C.Nameplates.AdditionalHeight) * 2 * K.NoScaleMult) + 8, ((C.Nameplates.Height + C.Nameplates.AdditionalHeight) * 2 * K.NoScaleMult) + 8)
		if C.Nameplates.ClassIcons == true then
			self.Class.Icon:SetSize(((C.Nameplates.Height + C.Nameplates.AdditionalHeight) * 2 * K.NoScaleMult) + 8, ((C.Nameplates.Height + C.Nameplates.AdditionalHeight) * 2 * K.NoScaleMult) + 8)
		end
		self:SetAlpha(1)
	else
		self:SetSize(C.Nameplates.Width * K.NoScaleMult, C.Nameplates.Height * K.NoScaleMult)
		self.Castbar:SetPoint("BOTTOMLEFT", self.Health, "BOTTOMLEFT", 0, -8-(C.Nameplates.Height * K.NoScaleMult))
		self.Castbar.Icon:SetSize((C.Nameplates.Height * 2 * K.NoScaleMult) + 8, (C.Nameplates.Height * 2 * K.NoScaleMult) + 8)
		if C.Nameplates.ClassIcons == true then
			self.Class.Icon:SetSize((C.Nameplates.Height * 2 * K.NoScaleMult) + 8, (C.Nameplates.Height * 2 * K.NoScaleMult) + 8)
		end
		if UnitExists("target") and not UnitIsUnit(self.unit, "player") then
			self:SetAlpha(0.5)
		else
			self:SetAlpha(1)
		end
	end
end

local function UpdateName(self)
	if C.Nameplates.HealerIcon == true then
		local name = UnitName(self.unit)
		if name then
			if testing then
				self.HPHeal:Show()
			else
				if healList[name] then
					if exClass[healList[name]] then
						self.HPHeal:Hide()
					else
						self.HPHeal:Show()
					end
				else
					self.HPHeal:Hide()
				end
			end
		end
	end

	if C.Nameplates.ClassIcons == true then
		if UnitIsPlayer(self.unit) and UnitReaction(self.unit, "player") <= 4 then
			local _, class = UnitClass(self.unit)
			local texcoord = CLASS_ICON_TCOORDS[class]
			self.Class.Icon:SetTexCoord(texcoord[1] + 0.015, texcoord[2] - 0.02, texcoord[3] + 0.018, texcoord[4] - 0.02)
			self.Class:Show()
			self.Level:SetPoint("RIGHT", self.Name, "LEFT", -2, 0)
		else
			self.Class.Icon:SetTexCoord(0, 0, 0, 0)
			self.Class:Hide()
			self.Level:SetPoint("RIGHT", self.Health, "LEFT", -2, 0)
		end
	end
	if C.Nameplates.TotemIcons == true then
		local name = UnitName(self.unit)
		if name then
			if totemData[name] then
				self.Totem.Icon:SetTexture(totemData[name])
				self.Totem.Icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
				self.Totem:Show()
			else
				self.Totem:Hide()
			end
		end
	end
end

local function castColor(self, unit, name, castid)
	if self.interrupt then
		self:SetStatusBarColor(1.0 * 0.8, 0.7 * 0.8, 0 * 0.8)
		self.bg:SetColorTexture(1.0 * 0.8, 0.7 * 0.8, 0 * 0.8, 0.2)
	else
		self:SetStatusBarColor(0.87, 0.37, 0.37)
		self.bg:SetColorTexture(0.87, 0.37, 0.37, 0.2)
	end
end

local function callback(event, nameplate, unit)
	local unit = unit or "target"
	local nameplate = C_NamePlate.GetNamePlateForUnit(unit)
	if not nameplate then return end
	local self = nameplate.ouf

	local name = UnitName(unit)
	if name and K.PlateBlacklist[name] then
		self:Hide()
	else
		self:Show()
	end

	if UnitIsUnit(unit, "player") then
		self.Power:Show()
		self.Name:Hide()
		self.Castbar:SetAlpha(0)
		self.RaidIcon:SetAlpha(0)
	else
		self.Power:Hide()
		self.Name:Show()
		self.Castbar:SetAlpha(1)
		self.RaidIcon:SetAlpha(1)
	end
end

local function style(self, unit)
	local nameplate = C_NamePlate.GetNamePlateForUnit(unit)
	local main = self
	nameplate.ouf = self
	self.unit = unit
	self:SetScript("OnEnter", function()
		ShowUIPanel(GameTooltip)
		GameTooltip:SetOwner(self, "ANCHOR_NONE")
		GameTooltip:SetUnit(self.unit)
		GameTooltip:Show()
	end)
	self:SetScript("OnLeave", function()
		GameTooltip:Hide()
	end)

	self:SetPoint("CENTER", nameplate, "CENTER")
	self:SetSize(C.Nameplates.Width * K.NoScaleMult, C.Nameplates.Height * K.NoScaleMult)

	-- Health Bar
	self.Health = CreateFrame("StatusBar", nil, self)
	self.Health:SetAllPoints(self)
	self.Health:SetStatusBarTexture(C.Media.Texture)
	self.Health.frequentUpdates = true
	self.Health.colorTapping = true
	self.Health.colorDisconnected = true
	self.Health.colorClass = true
	self.Health.colorReaction = true
	self.Health.colorHealth = true
	K.CreateShadowFrame(self.Health)

	self.Health.bg = self.Health:CreateTexture(nil, "BORDER")
	self.Health.bg:SetAllPoints()
	self.Health.bg:SetTexture(C.Media.Texture)
	self.Health.bg.multiplier = 0.2

	-- Create Health Text
	if C.Nameplates.HealthValue == true then
		self.Health.value = self.Health:CreateFontString(nil, "OVERLAY")
		self.Health.value:SetFont(C.Media.Font, C.Media.Font_Size * K.NoScaleMult, C.Media.Font_Style)
		-- 	self.Health.value:SetShadowOffset(C.Media.Font_shadow and 1 or 0, C.Media.Font_shadow and -1 or 0)
		self.Health.value:SetPoint("RIGHT", self.Health, "RIGHT", 0, 0)
		self:Tag(self.Health.value, "[NameplateHealth]")
	end

	-- Create Player Power bar
	self.Power = CreateFrame("StatusBar", nil, self)
	self.Power:SetStatusBarTexture(C.Media.Texture)
	self.Power:ClearAllPoints()
	self.Power:SetPoint("TOPLEFT", self.Health, "BOTTOMLEFT", 0, -3)
	self.Power:SetPoint("BOTTOMRIGHT", self.Health, "BOTTOMRIGHT", 0, -3-(C.Nameplates.Height * K.NoScaleMult / 2))
	self.Power.frequentUpdates = true
	self.Power.colorPower = true
	K.CreateShadowFrame(self.Power)

	self.Power.bg = self.Power:CreateTexture(nil, "BORDER")
	self.Power.bg:SetAllPoints()
	self.Power.bg:SetTexture(C.Media.Texture)
	self.Power.bg.multiplier = 0.2

	-- Create Name Text
	self.Name = self:CreateFontString(nil, "OVERLAY")
	self.Name:SetFont(C.Media.Font, C.Media.Font_Size * K.NoScaleMult, C.Media.Font_Style)
	-- self.Name:SetShadowOffset(C.Media.Font_shadow and 1 or 0, C.Media.Font_shadow and -1 or 0)
	self.Name:SetPoint("BOTTOMLEFT", self, "TOPLEFT", -3, 4)
	self.Name:SetPoint("BOTTOMRIGHT", self, "TOPRIGHT", 3, 4)

	if C.Nameplates.NameAbbreviate == true then
		self:Tag(self.Name, "[NameplateNameColor][NameplateNameLongAbbrev]")
	else
		self:Tag(self.Name, "[NameplateNameColor][NameLong]")
	end

	-- Create Level
	self.Level = self:CreateFontString(nil, "OVERLAY")
	self.Level:SetFont(C.Media.Font, C.Media.Font_Size * K.NoScaleMult, C.Media.Font_Style)
	-- self.Level:SetShadowOffset(C.Media.Font_shadow and 1 or 0, C.Media.Font_shadow and -1 or 0)
	self.Level:SetPoint("RIGHT", self.Health, "LEFT", -2, 0)
	self:Tag(self.Level, "[NameplateDiffColor][NameplateLevel][shortclassification]")

	-- Create Cast Bar
	self.Castbar = CreateFrame("StatusBar", nil, self)
	self.Castbar:SetFrameLevel(3)
	self.Castbar:SetStatusBarTexture(C.Media.Texture)
	self.Castbar:SetStatusBarColor(0.87, 0.37, 0.37)
	self.Castbar:SetPoint("TOPLEFT", self.Health, "BOTTOMLEFT", 0, -3)
	self.Castbar:SetPoint("BOTTOMRIGHT", self.Health, "BOTTOMRIGHT", 0, -3-(C.Nameplates.Height * K.NoScaleMult))
	K.CreateShadowFrame(self.Castbar)

	self.Castbar.bg = self.Castbar:CreateTexture(nil, "BORDER")
	self.Castbar.bg:SetAllPoints()
	self.Castbar.bg:SetTexture(C.Media.Texture)
	self.Castbar.bg:SetColorTexture(0.87, 0.37, 0.37, 0.2)

	self.Castbar.PostCastStart = castColor
	self.Castbar.PostChannelStart = castColor
	self.Castbar.PostCastNotInterruptible = castColor
	self.Castbar.PostCastInterruptible = castColor

	-- Create Cast Time Text
	self.Castbar.Time = self.Castbar:CreateFontString(nil, "ARTWORK")
	self.Castbar.Time:SetPoint("RIGHT", self.Castbar, "RIGHT", 0, 0)
	self.Castbar.Time:SetFont(C.Media.Font, C.Media.Font_Size * K.NoScaleMult, C.Media.Font_Style)
	-- self.Castbar.Time:SetShadowOffset(C.Media.Font_shadow and 1 or 0, C.Media.Font_shadow and -1 or 0)

	self.Castbar.CustomTimeText = function(self, duration)
		self.Time:SetText(("%.1f"):format(self.channeling and duration or self.max - duration))
	end

	-- Create Cast Name Text
	if C.Nameplates.CastbarName == true then
		self.Castbar.Text = self.Castbar:CreateFontString(nil, "OVERLAY")
		self.Castbar.Text:SetPoint("LEFT", self.Castbar, "LEFT", 3, 0)
		self.Castbar.Text:SetPoint("RIGHT", self.Castbar.Time, "LEFT", -1, 0)
		self.Castbar.Text:SetFont(C.Media.Font, C.Media.Font_Size * K.NoScaleMult, C.Media.Font_Style)
		-- self.Castbar.Text:SetShadowOffset(C.Media.Font_shadow and 1 or 0, C.Media.Font_shadow and -1 or 0)
		self.Castbar.Text:SetHeight(C.Media.Font_Size)
		self.Castbar.Text:SetJustifyH("LEFT")
	end

	-- Create CastBar Icon
	self.Castbar.Icon = self.Castbar:CreateTexture(nil, "OVERLAY")
	self.Castbar.Icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
	self.Castbar.Icon:SetDrawLayer("ARTWORK")
	self.Castbar.Icon:SetSize((C.Nameplates.Height * 2 * K.NoScaleMult) + 8, (C.Nameplates.Height * 2 * K.NoScaleMult) + 8)
	self.Castbar.Icon:SetPoint("TOPLEFT", self.Health, "TOPRIGHT", 4, 0)
	K.CreateShadowFrame(self.Castbar, self.Castbar.Icon)

	-- Raid Icon
	self.RaidIcon = self:CreateTexture(nil, "OVERLAY", nil, 7)
	self.RaidIcon:SetSize((C.Nameplates.Height * 2 * K.NoScaleMult) + 8, (C.Nameplates.Height * 2 * K.NoScaleMult) + 8)
	self.RaidIcon:SetPoint("BOTTOM", self.Health, "TOP", 0, C.Nameplates.TrackAuras == true and 38 or 16)

	-- Create Class Icon
	if C.Nameplates.ClassIcons == true then
		self.Class = CreateFrame("Frame", nil, self)
		self.Class.Icon = self.Class:CreateTexture(nil, "OVERLAY")
		self.Class.Icon:SetSize((C.Nameplates.Height * 2 * K.NoScaleMult) + 8, (C.Nameplates.Height * 2 * K.NoScaleMult) + 8)
		self.Class.Icon:SetPoint("TOPRIGHT", self.Health, "TOPLEFT", -8, 0)
		self.Class.Icon:SetTexture("Interface\\WorldStateFrame\\Icons-Classes")
		self.Class.Icon:SetTexCoord(0, 0, 0, 0)
		K.CreateShadowFrame(self.Class, self.Class.Icon)
	end

	-- Create Totem Icon
	if C.Nameplates.TotemIcons == true then
		self.Totem = CreateFrame("Frame", nil, self)
		self.Totem.Icon = self.Totem:CreateTexture(nil, "OVERLAY")
		self.Totem.Icon:SetSize((C.Nameplates.Height * 2 * K.NoScaleMult) + 8, (C.Nameplates.Height * 2 * K.NoScaleMult) + 8)
		self.Totem.Icon:SetPoint("BOTTOM", self.Health, "TOP", 0, 16)
		K.CreateShadowFrame(self.Totem, self.Totem.Icon)
	end

	local mhpb = self.Health:CreateTexture(nil, "ARTWORK")
	mhpb:SetTexture(C.Media.Texture)
	mhpb:SetVertexColor(0, 1, 0.5, 0.6)
	mhpb:SetWidth(self.Health:GetWidth())

	local ohpb = self.Health:CreateTexture(nil, "ARTWORK")
	ohpb:SetTexture(C.Media.Texture)
	ohpb:SetVertexColor(0, 1, 0, 0.6)
	ohpb:SetWidth(self.Health:GetWidth())

	local ahpb = self.Health:CreateTexture(nil, "ARTWORK")
	ahpb:SetTexture(C.Media.Texture)
	ahpb:SetVertexColor(1, 1, 0, 0.6)

	self.HealPrediction = {
		myBar = mhpb,
		otherBar = ohpb,
		absorbBar = ahpb,
		maxOverflow = 1,
		frequentUpdates = true
	}

	-- Create Healer Icon
	if C.Nameplates.HealerIcon == true then
		self.HPHeal = self.Health:CreateFontString(nil, "OVERLAY")
		self.HPHeal:SetFont(C.Media.Font, 32, C.Media.Font_Style)
		self.HPHeal:SetText("|cFFD53333+|r")
		self.HPHeal:SetPoint("BOTTOM", self.Name, "TOP", 0, C.Nameplates.TrackAuras == true and 13 or 0)
	end

	-- Aura tracking
	if C.Nameplates.TrackAuras == true then
		self.Auras = CreateFrame("Frame", nil, self)
		self.Auras:SetPoint("BOTTOMRIGHT", self.Health, "TOPRIGHT", 2 * K.NoScaleMult, C.Media.Font_Size + 7)
		self.Auras.initialAnchor = "BOTTOMRIGHT"
		self.Auras["growth-y"] = "UP"
		self.Auras["growth-x"] = "LEFT"
		self.Auras.numDebuffs = 6
		self.Auras.numBuffs = 0
		self.Auras:SetSize(20 + C.Nameplates.Width, C.Nameplates.AurasSize)
		self.Auras.spacing = 2
		self.Auras.size = C.Nameplates.AurasSize

		self.Auras.CustomFilter = function(icons, unit, icon, name, rank, texture, count, dispelType, duration, expiration, caster, isStealable, nameplateShowSelf, spellID, canApply, isBossDebuff, casterIsPlayer, nameplateShowAll)
			local allow = false

			if caster == "player" then
				if ((nameplateShowAll or nameplateShowSelf) and not K.DebuffBlackList[name]) then
					allow = true
				elseif K.DebuffWhiteList[name] then
					allow = true
				end
			end

			return allow
		end

		self.Auras.PostCreateIcon = function(element, button)
			button:SetScale(K.NoScaleMult)
			button:CreateShadow(1)
			button:EnableMouse(false)

			button.remaining = K.SetFontString(button, C.Media.Font, C.Media.Font_Size, C.Media.Font_Style, "CENTER")
			-- button.remaining:SetShadowOffset(C.font.auras_font_shadow and 1 or 0, C.font.auras_font_shadow and -1 or 0)
			button.remaining:SetPoint("CENTER", button, "CENTER", 1, 1)
			button.remaining:SetJustifyH("CENTER")

			button.cd.noOCC = true
			button.cd.noCooldownCount = true

			button.icon:SetPoint("TOPLEFT", 2, -2)
			button.icon:SetPoint("BOTTOMRIGHT", -2, 2)
			button.icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)

			button.count:SetPoint("BOTTOMRIGHT", button, "BOTTOMRIGHT", 1, 0)
			button.count:SetJustifyH("RIGHT")
			button.count:SetFont(C.Media.Font, C.Media.Font_Size, C.Media.Font_Style)
			-- button.count:SetShadowOffset(C.font.auras_font_shadow and 1 or 0, C.font.auras_font_shadow and -1 or 0)

			if C.Nameplates.Spiral == true then
				element.disableCooldown = false
				button.cd:SetReverse(true)
				button.cd:SetPoint("TOPLEFT", button, "TOPLEFT", 2, -2)
				button.cd:SetPoint("BOTTOMRIGHT", button, "BOTTOMRIGHT", -2, 2)
				button.parent = CreateFrame("Frame", nil, button)
				button.parent:SetFrameLevel(button.cd:GetFrameLevel() + 1)
				button.count:SetParent(button.parent)
				button.remaining:SetParent(button.parent)
			else
				element.disableCooldown = true
			end
		end

		self.Auras.PostUpdateIcon = function(icons, unit, icon, index, offset, filter, isDebuff, duration, timeLeft)
			local _, _, _, _, dtype, duration, expirationTime, _, isStealable = UnitAura(unit, index, icon.filter)

			if duration and duration > 0 and C.Nameplates.Timer == true then
				icon.remaining:Show()
				icon.timeLeft = expirationTime
				icon:SetScript("OnUpdate", CreateAuraTimer)
			else
				icon.remaining:Hide()
				icon.timeLeft = huge
				icon:SetScript("OnUpdate", nil)
			end
			icon.first = true
		end
	end

	self.Health:RegisterEvent("PLAYER_REGEN_DISABLED")
	self.Health:RegisterEvent("PLAYER_REGEN_ENABLED")
	self.Health:RegisterEvent("UNIT_THREAT_SITUATION_UPDATE")
	self.Health:RegisterEvent("UNIT_THREAT_LIST_UPDATE")

	self.Health:SetScript("OnEvent", function(self, event)
		threatColor(main)
	end)

	self.Health.PostUpdate = function(self, unit, min, max)
		local perc = 0
		if max and max > 0 then
			perc = min / max
		end

		local r, g, b
		local mu = self.bg.multiplier
		if not UnitIsUnit("player", unit) and UnitIsPlayer(unit) and UnitReaction(unit, "player") >= 5 then
			r, g, b = unpack(K.Colors.power["MANA"])
			self:SetStatusBarColor(r, g, b)
			self.bg:SetVertexColor(r * mu, g * mu, b * mu)
		elseif not UnitIsTapDenied(unit) and not UnitIsPlayer(unit) then
			local reaction = K.Colors.reaction[UnitReaction(unit, "player")]
			if reaction then
				r, g, b = reaction[1], reaction[2], reaction[3]
			else
				r, g, b = UnitSelectionColor(unit, true)
			end

			self:SetStatusBarColor(r, g, b)
			self.bg:SetVertexColor(r * mu, g * mu, b * mu)
		end

		if UnitIsPlayer(unit) then
			if perc <= 0.5 and perc >= 0.2 then
				K.SetShadowBorder(self, 1, 1, 0)
			elseif perc < 0.2 then
				K.SetShadowBorder(self, 1, 0, 0)
			else
				K.SetShadowBorder(self, unpack(C.Media.Nameplate_BorderColor))
			end
		elseif not UnitIsPlayer(unit) and C.Nameplates.EnhancedThreat == true then
			K.SetShadowBorder(self, unpack(C.Media.Nameplate_BorderColor))
		end

		threatColor(main, true)
	end

	-- Every event should be register with this
	tinsert(self.__elements, UpdateName)
	self:RegisterEvent("UNIT_NAME_UPDATE", UpdateName)

	tinsert(self.__elements, UpdateTarget)
	self:RegisterEvent("PLAYER_TARGET_CHANGED", UpdateTarget)
end

oUF:RegisterStyle("KkthnxUINameplate", style)
oUF:SpawnNamePlates("KkthnxUINameplate", "KkthnxUI", callback)
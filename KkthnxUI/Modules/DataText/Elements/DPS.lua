local K, C, L = select(2, ...):unpack()

local select = select
local format = string.format
local UnitAffectingCombat = UnitAffectingCombat
local UnitGUID = UnitGUID

local DataText = K.DataTexts
local NameColor = DataText.NameColor
local ValueColor = DataText.ValueColor

local PetGUID = UnitGUID("pet")
local PlayerGUID = UnitGUID("player")
local Events = {
	SWING_DAMAGE = true,
	RANGE_DAMAGE = true,
	SPELL_DAMAGE = true,
	SPELL_PERIODIC_DAMAGE = true,
	DAMAGE_SHIELD = true,
	DAMAGE_SPLIT = true,
	SPELL_EXTRA_ATTACKS = true,
}

local tslu = 1
local TotalDamage = 0
local LastDamage = 0
local CombatTime = 0

local GetDPS = function()
	if (TotalDamage == 0) then
		return (ValueColor .. "0.0 |r" .. NameColor .. STAT_DPS_SHORT .. "|r")
	else
		return format(ValueColor .. "%.1fk |r" .. NameColor .. STAT_DPS_SHORT .. "|r", ((TotalDamage or 0) / (CombatTime or 1)) / 1000)
	end
end

local CreateFunctions = function(self)
	function self:UNIT_PET(unit)
		if (unit == "player") then
			PetGUID = UnitGUID("pet")
		end
	end

	function self:COMBAT_LOG_EVENT_UNFILTERED(...)
		if (not Events[select(2, ...)]) then
			return
		end

		local ID = select(4, ...)

		if (ID == PlayerGUID or ID == PetGUID) then
			if (select(2, ...) == "SWING_DAMAGE") then
				LastDamage = select(12, ...)
			else
				LastDamage = select(15, ...)
			end

			TotalDamage = TotalDamage + LastDamage
		end
	end

	function self:PLAYER_REGEN_ENABLED()
		self.Text:SetText(GetDPS())
	end

	function self:PLAYER_REGEN_DISABLED()
		CombatTime = 0
		TotalDamage = 0
		LastDamage = 0
	end

	self.Functions = true
end

local OnUpdate = function(self, t)
	if (UnitAffectingCombat("player")) then
		CombatTime = CombatTime + t
	end

	tslu = tslu + t

	if (tslu >= 1) then
		tslu = 0

		self.Text:SetText(GetDPS())
	end
end

local OnMouseDown = function(self, btn)
	CombatTime = 0
	TotalDamage = 0
	LastDamage = 0
end

local OnEvent = function(self, event, ...)
	if (not event) then
		self.Text:SetText(GetDPS())
	else
		self[event](self, ...)
	end
end

local Enable = function(self)
	if (not self.Text) then
		local Text = self:CreateFontString(nil, "OVERLAY")
		Text:SetFont(DataText.Font, DataText.Size, DataText.Flags)

		self.Text = Text
	end

	if (not self.Functions) then
		CreateFunctions(self)
	end

	self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	self:RegisterEvent("PLAYER_REGEN_ENABLED")
	self:RegisterEvent("PLAYER_REGEN_DISABLED")
	self:RegisterEvent("UNIT_PET")
	self:SetScript("OnEvent", OnEvent)
	self:SetScript("OnUpdate", OnUpdate)
	self:SetScript("OnMouseDown", OnMouseDown)
	self:Update()
end

local Disable = function(self)
	self.Text:SetText("")
	self:UnregisterAllEvents()
	self:SetScript("OnEvent", nil)
	self:SetScript("OnUpdate", nil)
	self:SetScript("OnMouseDown", nil)
end

DataText:Register(STAT_DPS_SHORT, Enable, Disable, OnEvent)
local K, C, L = unpack(select(2, ...))
if C.RaidCD.Enable ~= true then return end

local Movers = K.Movers

-- Raid cooldowns(alRaidCD by Allez, msylgj0@NGACN)
local show = {
	raid = C.RaidCD.ShowInRaid,
	party = C.RaidCD.ShowInParty,
	arena = C.RaidCD.ShowInArena,
}

local filter = COMBATLOG_OBJECT_AFFILIATION_RAID + COMBATLOG_OBJECT_AFFILIATION_PARTY + COMBATLOG_OBJECT_AFFILIATION_MINE
local band = bit.band
local sformat = string.format
local floor = math.floor
local currentNumResses = 0
local charges = nil
local inBossCombat = nil
local timer = 0
local Ressesbars = {}
local bars = {}

local RaidCDAnchor = CreateFrame("Frame", "RaidCDAnchor", UIParent)
RaidCDAnchor:SetPoint(unpack(C.Position.RaidCD))
if C.RaidCD.ShowIcon == true then
	RaidCDAnchor:SetSize(C.RaidCD.Width + 32, C.RaidCD.Height + 10)
else
	RaidCDAnchor:SetSize(C.RaidCD.Width + 32, C.RaidCD.Height + 4)
end
Movers:RegisterFrame(RaidCDAnchor)

local function sortByExpiration(a, b)
	return a.endTime > b.endTime
end

local UpdatePositions = function()
	if charges and Ressesbars[1] then
		Ressesbars[1]:SetPoint("TOPRIGHT", RaidCDAnchor, "TOPRIGHT", 0, 0)
		Ressesbars[1].id = 1
		for i = 1, #bars do
			bars[i]:ClearAllPoints()
			if i == 1 then
				if C.RaidCD.UpWards == true then
					bars[i]:SetPoint("BOTTOMRIGHT", Ressesbars[1], "TOPRIGHT", 0, 13)
				else
					bars[i]:SetPoint("TOPRIGHT", Ressesbars[1], "BOTTOMRIGHT", 0, -13)
				end
			else
				if C.RaidCD.UpWards == true then
					bars[i]:SetPoint("BOTTOMRIGHT", bars[i-1], "TOPRIGHT", 0, 13)
				else
					bars[i]:SetPoint("TOPRIGHT", bars[i-1], "BOTTOMRIGHT", 0, -13)
				end
			end
			bars[i].id = i
		end
	else
		for i = 1, #bars do
			bars[i]:ClearAllPoints()
			if i == 1 then
				bars[i]:SetPoint("TOPRIGHT", RaidCDAnchor, "TOPRIGHT", 0, 0)
			else
				if C.RaidCD.UpWards == true then
					bars[i]:SetPoint("BOTTOMRIGHT", bars[i-1], "TOPRIGHT", 0, 13)
				else
					bars[i]:SetPoint("TOPRIGHT", bars[i-1], "BOTTOMRIGHT", 0, -13)
				end
			end
			bars[i].id = i
		end
	end
end

local StopTimer = function(bar)
	bar:SetScript("OnUpdate", nil)
	bar:Hide()
	if bar.isResses then
		tremove(Ressesbars, bar.id)
	else
		tremove(bars, bar.id)
	end
	UpdatePositions()
end

local UpdateCharges = function(bar)
	local curCharges, maxCharges, start, duration = GetSpellCharges(20484)
	if curCharges == maxCharges then
		bar.startTime = 0
		bar.endTime = GetTime()
	else
		bar.startTime = start
		bar.endTime = start + duration
	end
	if curCharges ~= currentNumResses then
		currentNumResses = curCharges
		bar.left:SetText(bar.name.." : "..currentNumResses)
	end
end

local BarUpdate = function(self, elapsed)
	local curTime = GetTime()
	if self.endTime < curTime then
		if self.isResses then
			UpdateCharges(self)
		else
			StopTimer(self)
			return
		end
	end
	self:SetValue(100 - (curTime - self.startTime) / (self.endTime - self.startTime) * 100)
	self.right:SetText(K.FormatTime(self.endTime - curTime))
end

local OnEnter = function(self)
	GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
	GameTooltip:SetSpellByID(self.spellId)
	GameTooltip:AddLine(" ")
	GameTooltip:AddDoubleLine(self.left:GetText(), self.right:GetText())
	GameTooltip:SetClampedToScreen(true)
	GameTooltip:Show()
end

local OnLeave = function(self)
	GameTooltip:Hide()
end

local OnMouseDown = function(self, button)
	if button == "LeftButton" then
		if self.isResses then
			SendChatMessage(sformat(L.Cooldowns.CombatResRemainder.."%d, "..L.Cooldowns.NextTime.."%s.", currentNumResses, self.right:GetText()), K.CheckChat())
		else
			SendChatMessage(sformat(L.Cooldowns.Cooldowns.."%s - %s: %s", self.name, GetSpellLink(self.spellId), self.right:GetText()), K.CheckChat())
		end
	elseif button == "RightButton" then
		StopTimer(self)
	end
end

local CreateBar = function()
	local bar = CreateFrame("Statusbar", nil, UIParent)
	bar:SetFrameStrata("MEDIUM")
	if C.RaidCD.ShowIcon == true then
		bar:SetSize(C.RaidCD.Width, C.RaidCD.Height)
	else
		bar:SetSize(C.RaidCD.Width + 28, C.RaidCD.Height)
	end
	bar:SetStatusBarTexture(C.Media.Texture)
	bar:SetMinMaxValues(0, 100)
	bar:CreateShadow()

	bar.bg = bar:CreateTexture(nil, "BACKGROUND")
	bar.bg:SetAllPoints(bar)
	bar.bg:SetTexture(C.Media.Texture)

	bar.left = K.SetFontString(bar, C.Media.Font, C.Media.Font_Size, C.Media.Font_Style, LEFT)
	bar.left:SetPoint("LEFT", 2, 0)
	bar.left:SetJustifyH("LEFT")
	bar.left:SetSize(C.RaidCD.Width - 30, C.Media.Font_Size)

	bar.right = K.SetFontString(bar, C.Media.Font, C.Media.Font_Size, C.Media.Font_Style, RIGHT)
	bar.right:SetPoint("RIGHT", 1, 0)
	bar.right:SetJustifyH("RIGHT")

	if C.RaidCD.ShowIcon == true then
		bar.icon = CreateFrame("Button", nil, bar)
		bar.icon:SetWidth(bar:GetHeight() + 6)
		bar.icon:SetHeight(bar.icon:GetWidth())
		bar.icon:SetPoint("BOTTOMRIGHT", bar, "BOTTOMLEFT", -4, 0)
		bar.icon:CreateShadow()
	end
	return bar
end

local StartTimer = function(name, spellId)
	local spell, _, icon = GetSpellInfo(spellId)
	if charges and spellId == 20484 then
		for _, v in pairs(Ressesbars) do
			UpdateCharges(v)
			return
		end
	end
	for _, v in pairs(bars) do
		if v.name == name and v.spell == spell then
			StopTimer(v)
		end
	end
	local bar = CreateBar()
	local color = (CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS)[select(2, UnitClass(name))]
	if charges and spellId == 20484 then
		local curCharges, _, start, duration = GetSpellCharges(20484)
		currentNumResses = curCharges
		bar.startTime = start
		bar.endTime = start + duration
		bar.left:SetText(name.." : "..curCharges)
		bar.right:SetText(K.FormatTime(duration))
		bar.isResses = true
		bar.name = name
		bar.spell = spell
		bar.spellId = spellId
		if C.RaidCD.ShowIcon == true then
			bar.icon:SetNormalTexture(icon)
			bar.icon:GetNormalTexture():SetTexCoord(0.1, 0.9, 0.1, 0.9)
		end
		bar:Show()
		if color then
			bar:SetStatusBarColor(color.r, color.g, color.b)
			bar.bg:SetVertexColor(color.r, color.g, color.b, 0.2)
		else
			bar:SetStatusBarColor(0.3, 0.7, 0.3)
			bar.bg:SetVertexColor(0.3, 0.7, 0.3, 0.2)
		end

		bar:SetScript("OnUpdate", BarUpdate)
		bar:EnableMouse(true)
		bar:SetScript("OnEnter", OnEnter)
		bar:SetScript("OnLeave", OnLeave)
		bar:SetScript("OnMouseDown", OnMouseDown)
		tinsert(Ressesbars, bar)
		if C.RaidCD.Expiration == true then
			table.sort(Ressesbars, sortByExpiration)
		end
	else
		bar.startTime = GetTime()
		bar.endTime = GetTime() + K.RaidSpells[spellId]
		bar.left:SetText(format("%s - %s", name:gsub("%-[^|]+", ""), spell))
		bar.right:SetText(K.FormatTime(K.RaidSpells[spellId]))
		bar.isResses = false
		bar.name = name
		bar.spell = spell
		bar.spellId = spellId
		if C.RaidCD.ShowIcon == true then
			bar.icon:SetNormalTexture(icon)
			bar.icon:GetNormalTexture():SetTexCoord(0.1, 0.9, 0.1, 0.9)
		end
		bar:Show()
		if color then
			bar:SetStatusBarColor(color.r, color.g, color.b)
			bar.bg:SetVertexColor(color.r, color.g, color.b, 0.2)
		else
			bar:SetStatusBarColor(0.3, 0.7, 0.3)
			bar.bg:SetVertexColor(0.3, 0.7, 0.3, 0.2)
		end

		bar:SetScript("OnUpdate", BarUpdate)
		bar:EnableMouse(true)
		bar:SetScript("OnEnter", OnEnter)
		bar:SetScript("OnLeave", OnLeave)
		bar:SetScript("OnMouseDown", OnMouseDown)
		tinsert(bars, bar)
		if C.RaidCD.Expiration == true then
			table.sort(bars, sortByExpiration)
		end
	end
	UpdatePositions()
end

local OnEvent = function(self, event, ...)
	if event == "PLAYER_ENTERING_WORLD" or event == "ZONE_CHANGED_NEW_AREA" then
		if select(2, IsInInstance()) == "raid" and IsInGroup() then
			self:RegisterEvent("SPELL_UPDATE_CHARGES")
		else
			self:UnregisterEvent("SPELL_UPDATE_CHARGES")
			charges = nil
			inBossCombat = nil
			currentNumResses = 0
			Ressesbars = {}
		end
	end
	if event == "SPELL_UPDATE_CHARGES" then
		charges = GetSpellCharges(20484)
		if charges then
			if not inBossCombat then
				inBossCombat = true
			end
			StartTimer(L.Cooldowns.CombatRes, 20484)
		elseif not charges and inBossCombat then
			inBossCombat = nil
			currentNumResses = 0
			for _, v in pairs(Ressesbars) do
				StopTimer(v)
			end
		end
	end
	if event == "COMBAT_LOG_EVENT_UNFILTERED" then
		local _, eventType, _, _, sourceName, sourceFlags = ...
		if band(sourceFlags, filter) == 0 then return end
		if eventType == "SPELL_RESURRECT" or eventType == "SPELL_CAST_SUCCESS" or eventType == "SPELL_AURA_APPLIED" then
			local spellId = select(12, ...)
			if sourceName then
				sourceName = sourceName:gsub("-.+", "")
			else
				return
			end
			if K.RaidSpells[spellId] and show[select(2, IsInInstance())] and IsInGroup() then
				if (sourceName == K.Name and C.RaidCD.ShowSelf == true) or sourceName ~= K.Name then
					StartTimer(sourceName, spellId)
				end
			end
		end
	elseif event == "ZONE_CHANGED_NEW_AREA" and select(2, IsInInstance()) == "arena" or not IsInGroup() then
		for _, v in pairs(Ressesbars) do
			StopTimer(v)
		end
		for _, v in pairs(bars) do
			v.endTime = 0
		end
	elseif event == "ENCOUNTER_END" and select(2, IsInInstance()) == "raid" then
		for _, v in pairs(bars) do
			v.endTime = 0
		end
	end
end

for spell in pairs(K.RaidSpells) do
	local name = GetSpellInfo(spell)
	if not name then
		print("|cffff0000WARNING: spell ID ["..tostring(spell).."] no longer exists! Report this to Kkthnx.|r")
	end
end

local f = CreateFrame("Frame")
f:SetScript("OnEvent", OnEvent)
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
f:RegisterEvent("ZONE_CHANGED_NEW_AREA")
f:RegisterEvent("ENCOUNTER_END")

SlashCmdList.RaidCD = function()
	StartTimer(UnitName("player"), 20484)	-- Rebirth
	StartTimer(UnitName("player"), 20707)	-- Soulstone
	StartTimer(UnitName("player"), 108280)	-- Healing Tide Totem
end
SLASH_RaidCD1 = "/raidcd"
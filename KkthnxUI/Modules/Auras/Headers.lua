local K, C, L = unpack(select(2, ...))
if C.Auras.Enable ~= true then return end

local KkthnxUIAuras = K.Auras

KkthnxUIAuras.HeaderNames = {
	"KkthnxUIBuffHeader",
	"KkthnxUIDebuffHeader",
	"KkthnxUIConsolidatedHeader",
}

function KkthnxUIAuras:CreateHeaders()
	if (not C.Auras.Enable) then
		return
	end

	local Movers = K.Movers
	local Headers = KkthnxUIAuras.Headers
	local Parent = oUF_PetBattleFrameHider

	for i = 1, 3 do
		local Header

		if (i == 3) then
			Header = CreateFrame("Frame", KkthnxUIAuras.HeaderNames[i], Parent, "SecureFrameTemplate")
			Header:SetAttribute("wrapAfter", 1)
			Header:SetAttribute("wrapYOffset", -35)
		else
			Header = CreateFrame("Frame", KkthnxUIAuras.HeaderNames[i], Parent, "SecureAuraHeaderTemplate")
			Header:SetClampedToScreen(true)
			Header:SetMovable(true)
			Header:SetAttribute("minHeight", 30)
			Header:SetAttribute("wrapAfter", C.Auras.BuffsPerRow)
			Header:SetAttribute("wrapYOffset", -73.5)
			Header:SetAttribute("xOffset", -37)
			Header:CreateBackdrop()
			Header.backdrop:SetBackdropBorderColor(1, 0, 0)
			Header.backdrop:Hide()

			Header.backdrop:FontString("Text", C.Media.Font, 12)
			Header.backdrop.Text:SetPoint("CENTER")

			if (i == 1) then
				Header.backdrop.Text:SetText(L.Auras.MoveBuffs)
			else
				Header.backdrop.Text:SetText(L.Auras.MoveDebuffs)
			end
		end

		Header:SetAttribute("minWidth", C.Auras.BuffsPerRow * 35)
		Header:SetAttribute("template", "KkthnxUIAurasTemplate")
		Header:SetAttribute("weaponTemplate", "KkthnxUIAurasTemplate")
		Header:SetSize(32, 32)
		Header:SetFrameStrata("BACKGROUND")

		RegisterAttributeDriver(Header, "unit", "[vehicleui] vehicle; player")

		table.insert(Headers, Header)
	end

	local Buffs = Headers[1]
	local Debuffs = Headers[2]
	local Consolidate = Headers[3]
	local Filter = (C.Auras.Consolidate and 1) or 0
	local Proxy = CreateFrame("Frame", nil, Buffs, "KkthnxUIAurasProxyTemplate")
	local DropDown = CreateFrame("BUTTON", nil, Proxy, "SecureHandlerClickTemplate")

	if (not C.Auras.HideBuffs) then
		Buffs:SetPoint(unpack(C.Position.PlayerBuffs))
		Buffs:SetAttribute("filter", "HELPFUL")
		Buffs:SetAttribute("consolidateProxy", Proxy)
		Buffs:SetAttribute("consolidateHeader", Consolidate)
		Buffs:SetAttribute("consolidateTo", Filter)
		Buffs:SetAttribute("includeWeapons", 1)
		Buffs:SetAttribute("consolidateDuration", -1)
		Buffs:Show()

		Movers:RegisterFrame(Buffs)

		Proxy = Buffs:GetAttribute("consolidateProxy")
		Proxy:HookScript("OnShow", function(self)
			if Consolidate:IsShown() then
				Consolidate:Hide()
			end
		end)

		DropDown:SetAllPoints()
		DropDown:RegisterForClicks("AnyUp")
		DropDown:SetAttribute("_onclick", [=[
			local Header = self:GetParent():GetFrameRef("header")
			local NumChild = 0

			repeat
				NumChild = NumChild + 1
				local child = Header:GetFrameRef("child" .. NumChild)
				until not child or not child:IsShown()

			NumChild = NumChild - 1

			local x, y = self:GetWidth(), self:GetHeight()
			Header:SetWidth(x)
			Header:SetHeight(y)

			if Header:IsShown() then
				Header:Hide()
			else
				Header:Show()
			end
		]=])

		Consolidate:SetAttribute("point", "RIGHT")
		Consolidate:SetAttribute("minHeight", nil)
		Consolidate:SetAttribute("minWidth", nil)
		Consolidate:SetParent(Proxy)
		Consolidate:ClearAllPoints()
		Consolidate:SetPoint("CENTER", Proxy, "CENTER", 0, -35)
		Consolidate:Hide()
		SecureHandlerSetFrameRef(Proxy, "header", Consolidate)

		Buffs.Proxy = Proxy
		Buffs.DropDown = DropDown
	end

	if (not C.Auras.HideDebuffs) then
		if (C.Auras.HideBuffs) then
			Debuffs:SetPoint("TOPRIGHT", UIParent, -184, -28)
		else
			Debuffs:SetPoint("TOP", Buffs, "BOTTOM", 0, -96)
		end

		Debuffs:SetAttribute("filter", "HARMFUL")
		Debuffs:Show()

		Movers:RegisterFrame(Debuffs)
	end
end

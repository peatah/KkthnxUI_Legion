local K, C, L = select(2, ...):unpack()

-- Wow API
local hooksecurefunc = hooksecurefunc

-- Global variables that we don't cache, list them here for mikk's FindGlobals script
-- GLOBALS: LossOfControlFrame

local LossControl = CreateFrame("Frame", nil, UIParent)

function LossControl:Update()
	self.Icon:ClearAllPoints()
	self.Icon:SetPoint("CENTER", self, "CENTER", 0, 0)

	self.AbilityName:ClearAllPoints()
	self.AbilityName:SetPoint("BOTTOM", self, 0, -28)
	self.AbilityName.scrollTime = nil
	self.AbilityName:SetFont(C.Media.Font, 18, "OUTLINE")

	self.TimeLeft.NumberText:ClearAllPoints()
	self.TimeLeft.NumberText:SetPoint("BOTTOM", self, 4, -58)
	self.TimeLeft.NumberText.scrollTime = nil
	self.TimeLeft.NumberText:SetFont(C.Media.Font, 18, "OUTLINE")

	self.TimeLeft.SecondsText:ClearAllPoints()
	self.TimeLeft.SecondsText:SetPoint("BOTTOM", self, 0, -80)
	self.TimeLeft.SecondsText.scrollTime = nil
	self.TimeLeft.SecondsText:SetFont(C.Media.Font, 18, "OUTLINE")

	if self.Anim:IsPlaying() then
		self.Anim:Stop()
	end
end

function LossControl:AddHooks()
	hooksecurefunc("LossOfControlFrame_SetUpDisplay", self.Update)
end

function LossControl:Enable()
	LossOfControlFrame:StripTextures()
	LossOfControlFrame:CreateBackdrop()
	LossOfControlFrame.Icon:SetTexCoord(.1, .9, .1, .9)
	LossOfControlFrame.AbilityName:ClearAllPoints()
	LossOfControlFrame.backdrop:SetOutside(LossOfControlFrame.Icon, 4, 4)
	LossOfControlFrame.Cooldown:SetDrawSwipe(false)
	LossOfControlFrame.Cooldown:SetDrawEdge(false)
	LossOfControlFrame.Cooldown:SetAlpha(0)

	self:AddHooks()
end

LossControl:RegisterEvent("PLAYER_LOGIN")
LossControl:SetScript("OnEvent", LossControl.Enable)
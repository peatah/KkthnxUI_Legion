local K, C, L = select(2, ...):unpack()
--if C.Blizzard.RaidTools ~= true then return end

local unpack = unpack
local Movers = K.Movers

StaticPopupDialogs["WARNING_BLIZZARD_ADDONS"] = {
	text =  L.Popup.BlizzardAddOns,
	button1 = OKAY,
	OnAccept = function() EnableAddOn("Blizzard_CompactRaidFrames") ReloadUI() end,
	timeout = 0,
	showAlert = true,
	timeout = 0,
	whileDead = 1,
	hideOnEscape = false,
	preferredIndex = 3
}

-- Create main frame
local RaidUtilityPanel = CreateFrame("Frame", "RaidUtilityPanel", oUF_PetBattleFrameHider)
RaidUtilityPanel:CreatePanel("Transparent", 170, 144, unpack(C.Position.RaidUtility))
if GetCVarBool("watchFrameWidth") then
	RaidUtilityPanel:SetPoint(C.Position.RaidUtility[1], C.Position.RaidUtility[2], C.Position.RaidUtility[3], C.Position.RaidUtility[4] + 100, C.Position.RaidUtility[5])
end
Movers:RegisterFrame(RaidUtilityPanel)
RaidUtilityPanel.toggled = false

-- Check if We are Raid Leader or Raid Officer
local function CheckRaidStatus()
	local _, instanceType = IsInInstance()
	if ((GetNumGroupMembers() > 0 and UnitIsGroupLeader("player") and not UnitInRaid("player")) or UnitIsGroupLeader("player") or UnitIsGroupAssistant("player")) and (instanceType ~= "pvp" or instanceType ~= "arena") then
		return true
	else
		return false
	end
end

-- Function to create buttons in this module
local function CreateButton(name, parent, template, width, height, point, relativeto, point2, xOfs, yOfs, text)
	local b = CreateFrame("Button", name, parent, template)
	b:SkinButton(true)
	b:SetWidth(width)
	b:SetHeight(height + 2)
	b:SetPoint(point, relativeto, point2, xOfs, yOfs)
	b:EnableMouse(true)
	if text then
		b.t = b:CreateFontString(nil, "OVERLAY")
		b.t:SetFont(C.Media.Font, C.Media.Font_Size, "")
		b.t:SetShadowOffset(K.Mult,-K.Mult)
		b.t:SetPoint("CENTER")
		b.t:SetJustifyH("CENTER")
		b.t:SetText(text)
	end
end

-- Show button
CreateButton("RaidUtilityShowButton", oUF_PetBattleFrameHider, "UIPanelButtonTemplate, SecureHandlerClickTemplate", RaidUtilityPanel:GetWidth() / 1.4, 18, "TOP", RaidUtilityPanel, "TOP", 0, 0, RAID_CONTROL)
RaidUtilityShowButton:SetFrameRef("RaidUtilityPanel", RaidUtilityPanel)
RaidUtilityShowButton:SetAttribute("_onclick", [=[self:Hide(); self:GetFrameRef("RaidUtilityPanel"):Show();]=])
RaidUtilityShowButton:SetScript("OnMouseUp", function(self, button)
	if button == "RightButton" then
		if CheckRaidStatus() then
			DoReadyCheck()
		end
	elseif button == "MiddleButton" then
		if CheckRaidStatus() then
			InitiateRolePoll()
		end
	elseif button == "LeftButton" then
		RaidUtilityPanel.toggled = true
	end
end)

-- Close button
CreateButton("RaidUtilityCloseButton", RaidUtilityPanel, "UIPanelButtonTemplate, SecureHandlerClickTemplate", RaidUtilityPanel:GetWidth() * 0.6, 18, "TOP", RaidUtilityPanel, "BOTTOM", 0, -32, CLOSE)
RaidUtilityCloseButton:SetFrameRef("RaidUtilityShowButton", RaidUtilityShowButton)
RaidUtilityCloseButton:SetAttribute("_onclick", [=[self:GetParent():Hide(); self:GetFrameRef("RaidUtilityShowButton"):Show();]=])
RaidUtilityCloseButton:SetScript("OnMouseUp", function(self) RaidUtilityPanel.toggled = false end)

-- Disband Group button
CreateButton("RaidUtilityDisbandButton", RaidUtilityPanel, "UIPanelButtonTemplate", RaidUtilityPanel:GetWidth() * 0.8, 18, "TOP", RaidUtilityPanel, "TOP", 0, -8, L.Raid.UtilityDisband)
RaidUtilityDisbandButton:SetScript("OnMouseUp", function(self) StaticPopup_Show("DISBAND_RAID") RaidUtilityPanel.toggled = false end)

-- Convert Group button
CreateButton("RaidUtilityConvertButton", RaidUtilityPanel, "UIPanelButtonTemplate", RaidUtilityPanel:GetWidth() * 0.8, 18, "TOP", RaidUtilityDisbandButton, "BOTTOM", 0, -8, UnitInRaid("player") and CONVERT_TO_PARTY or CONVERT_TO_RAID)
RaidUtilityConvertButton:SetScript("OnMouseUp", function(self)
	if UnitInRaid("player") then
		ConvertToParty()
		RaidUtilityConvertButton.t:SetText(CONVERT_TO_RAID)
	elseif UnitInParty("player") then
		ConvertToRaid()
		RaidUtilityConvertButton.t:SetText(CONVERT_TO_PARTY)
	end
end)

-- Role Check button
CreateButton("RaidUtilityRoleButton", RaidUtilityPanel, "UIPanelButtonTemplate", RaidUtilityPanel:GetWidth() * 0.8, 18, "TOP", RaidUtilityConvertButton, "BOTTOM", 0, -8, ROLE_POLL)
RaidUtilityRoleButton:SetScript("OnMouseUp", function(self) InitiateRolePoll() end)

-- MainTank button
CreateButton("RaidUtilityMainTankButton", RaidUtilityPanel, "UIPanelButtonTemplate, SecureActionButtonTemplate", (RaidUtilityDisbandButton:GetWidth() / 2) - 4, 18, "TOPLEFT", RaidUtilityRoleButton, "BOTTOMLEFT", 0, -8, TANK)
RaidUtilityMainTankButton:SetAttribute("type", "maintank")
RaidUtilityMainTankButton:SetAttribute("unit", "target")
RaidUtilityMainTankButton:SetAttribute("action", "toggle")

-- MainAssist button
CreateButton("RaidUtilityMainAssistButton", RaidUtilityPanel, "UIPanelButtonTemplate, SecureActionButtonTemplate", (RaidUtilityDisbandButton:GetWidth() / 2) - 4, 18, "TOPRIGHT", RaidUtilityRoleButton, "BOTTOMRIGHT", 0, -8, MAINASSIST)
RaidUtilityMainAssistButton:SetAttribute("type", "mainassist")
RaidUtilityMainAssistButton:SetAttribute("unit", "target")
RaidUtilityMainAssistButton:SetAttribute("action", "toggle")

-- Ready Check button
CreateButton("RaidUtilityReadyCheckButton", RaidUtilityPanel, "UIPanelButtonTemplate", RaidUtilityRoleButton:GetWidth() * 0.75, 18, "TOPLEFT", RaidUtilityMainTankButton, "BOTTOMLEFT", 0, -8, READY_CHECK)
RaidUtilityReadyCheckButton:SetScript("OnMouseUp", function(self) DoReadyCheck() end)

-- World Marker button
if CompactRaidFrameManager then
	CompactRaidFrameManagerDisplayFrameLeaderOptionsRaidWorldMarkerButton:ClearAllPoints()
	CompactRaidFrameManagerDisplayFrameLeaderOptionsRaidWorldMarkerButton:SetPoint("TOPRIGHT", RaidUtilityMainAssistButton, "BOTTOMRIGHT", 0, -8)
	CompactRaidFrameManagerDisplayFrameLeaderOptionsRaidWorldMarkerButton:SetParent("RaidUtilityPanel")
	CompactRaidFrameManagerDisplayFrameLeaderOptionsRaidWorldMarkerButton:SetHeight(20)
	CompactRaidFrameManagerDisplayFrameLeaderOptionsRaidWorldMarkerButton:SetWidth(RaidUtilityRoleButton:GetWidth() * 0.19)
	CompactRaidFrameManagerDisplayFrameLeaderOptionsRaidWorldMarkerButton:StripTextures(true)
	CompactRaidFrameManagerDisplayFrameLeaderOptionsRaidWorldMarkerButton:SkinButton()

	-- Put other stuff back
	CompactRaidFrameManagerDisplayFrameLeaderOptionsInitiateReadyCheck:ClearAllPoints()
	CompactRaidFrameManagerDisplayFrameLeaderOptionsInitiateReadyCheck:SetPoint("BOTTOMLEFT", CompactRaidFrameManagerDisplayFrameLockedModeToggle, "TOPLEFT", 0, 1)
	CompactRaidFrameManagerDisplayFrameLeaderOptionsInitiateReadyCheck:SetPoint("BOTTOMRIGHT", CompactRaidFrameManagerDisplayFrameHiddenModeToggle, "TOPRIGHT", 0, 1)

	CompactRaidFrameManagerDisplayFrameLeaderOptionsInitiateRolePoll:ClearAllPoints()
	CompactRaidFrameManagerDisplayFrameLeaderOptionsInitiateRolePoll:SetPoint("BOTTOMLEFT", CompactRaidFrameManagerDisplayFrameLeaderOptionsInitiateReadyCheck, "TOPLEFT", 0, 1)
	CompactRaidFrameManagerDisplayFrameLeaderOptionsInitiateRolePoll:SetPoint("BOTTOMRIGHT", CompactRaidFrameManagerDisplayFrameLeaderOptionsInitiateReadyCheck, "TOPRIGHT", 0, 1)

	local MarkTexture = CompactRaidFrameManagerDisplayFrameLeaderOptionsRaidWorldMarkerButton:CreateTexture(nil, "OVERLAY")
	MarkTexture:SetTexture("Interface\\RaidFrame\\Raid-WorldPing")
	MarkTexture:SetPoint("CENTER", 0, -1)
else
	StaticPopup_Show("WARNING_BLIZZARD_ADDONS")
end

-- Raid Control Panel
CreateButton("RaidUtilityRaidControlButton", RaidUtilityPanel, "UIPanelButtonTemplate", RaidUtilityRoleButton:GetWidth(), 18, "TOPLEFT", RaidUtilityReadyCheckButton, "BOTTOMLEFT", 0, -8, RAID_CONTROL)
RaidUtilityRaidControlButton:SetScript("OnMouseUp", function(self)
	ToggleFriendsFrame(4)
end)

local function ToggleRaidUtil(self, event)
	if InCombatLockdown() then
		self:RegisterEvent("PLAYER_REGEN_ENABLED")
		return
	end

	if CheckRaidStatus() then
		if RaidUtilityPanel.toggled == true then
			RaidUtilityShowButton:Hide()
			RaidUtilityPanel:Show()
		else
			RaidUtilityShowButton:Show()
			RaidUtilityPanel:Hide()
		end
	else
		RaidUtilityShowButton:Hide()
		RaidUtilityPanel:Hide()
	end

	if event == "PLAYER_REGEN_ENABLED" then
		self:UnregisterEvent("PLAYER_REGEN_ENABLED")
	end
end

-- Automatically show/hide the frame if we have Raid Leader or Raid Officer
local LeadershipCheck = CreateFrame("Frame")
LeadershipCheck:RegisterEvent("PLAYER_ENTERING_WORLD")
LeadershipCheck:RegisterEvent("GROUP_ROSTER_UPDATE")
LeadershipCheck:SetScript("OnEvent", ToggleRaidUtil)

-- Support Aurora
if IsAddOnLoaded("Aurora") then
	local F = unpack(Aurora)
	RaidUtilityPanel:SetBackdropColor(0, 0, 0, 0)
	RaidUtilityPanel:SetBackdropBorderColor(0, 0, 0, 0)
	RaidUtilityPanelInnerBorder:SetBackdropBorderColor(0, 0, 0, 0)
	RaidUtilityPanelOuterBorder:SetBackdropBorderColor(0, 0, 0, 0)
	F.CreateBD(RaidUtilityPanel)
end
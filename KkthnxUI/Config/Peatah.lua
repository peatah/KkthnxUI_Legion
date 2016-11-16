
-- Hide blizzard combat text
if C.CombatText.BlizzardHeadNumbers ~= true then
	SetCVar("floatingCombatTextCombatHealing", 0)
	SetCVar("floatingCombatTextCombatDamage", 0)
else
	SetCVar("floatingCombatTextCombatHealing", 1)
	SetCVar("floatingCombatTextCombatDamage", 1)
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LOGOUT")
frame:SetScript("OnEvent", function(self, event)
	if event == "PLAYER_LOGOUT" then
		SetCVar("floatingCombatTextCombatHealing", 1)
		SetCVar("floatingCombatTextCombatDamage", 1)
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

-- Hide obj
for _, headerName in pairs({"QuestHeader", "AchievementHeader", "ScenarioHeader"}) do
	ObjectiveTrackerFrame.BlocksFrame[headerName].Background:Hide()
end
BONUS_OBJECTIVE_TRACKER_MODULE.Header.Background:Hide()

ObjectiveTrackerFrame.HeaderMenu.Title:SetAlpha(0)

--Create the frame
local f = CreateFrame("Frame")

--Main function
function f:OnEvent(event, addon)
	--Check if the talkinghead addon is being loaded
	if addon == "Blizzard_TalkingHeadUI" then
		hooksecurefunc("TalkingHeadFrame_PlayCurrent", function()
			--Query subzone text when the talkinghead plays
			zoneName = GetSubZoneText();
			--If we are not doing withered training, suppress the talkinghead
			if zoneName ~= "Temple of Fal'adora" and
			   zoneName ~= "Falanaar Tunnels" and
			   zoneName ~= "Shattered Locus" then
				TalkingHeadFrame_CloseImmediately()
			end
		end)
	self:UnregisterEvent(event)
	end
end

f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", f.OnEvent)
-- Hide blizzard combat text
	SetCVar("floatingCombatTextCombatHealing", 1)
	SetCVar("floatingCombatTextCombatDamage", 1)
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
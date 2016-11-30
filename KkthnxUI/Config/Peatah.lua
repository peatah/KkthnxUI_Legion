
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

------
SilentWorldQuestMute = true
SilentWorldQuestSaidHello = false
local holdFunc = nil
local funcHeld = false

local SilentWorldQuestFirstLogin = CreateFrame("Frame", "SilentWorldQuestLogin")	
SilentWorldQuestFirstLogin:RegisterEvent("PLAYER_LOGIN")
SilentWorldQuestFirstLogin:SetScript("OnEvent",
	function(self, event, ...)
		if SilentWorldQuestSaidHello == false then
			SilentWorldQuestMessage("Silent World Quest loaded. Type /swq t to toggle.")
			SilentWorldQuestSaidHello = true
		end
		SilentWorldQuestFirstLogin:UnregisterEvent("PLAYER_LOGIN")
	end)


-- Clears the popup text frame --
-- If we try to close it before the UI has created it, it will crash the client.
local SilentWorldQuestTextHide = CreateFrame("Frame", "SilentWorldQuestText")
function SilentWorldQuestTextHide:onUpdate(sinceLastCheck)
	self.sinceLastCheck = (self.sinceLastCheck or 0) + sinceLastCheck;
	if ( self.sinceLastCheck >= 0 ) then
		local shown = TalkingHeadFrame:IsVisible()
		if shown == true then
			-- Done this way to allow toggling without requiring a UI reload.
			-- Disable this frames onUpdate script 
			SilentWorldQuestTextHide:SetScript("OnUpdate",nil);
			-- Save the center text frames onEvent function 
			holdFunc = TalkingHeadFrame:GetScript("onEvent");
			funcHeld = true
			-- Set the center texts frames new onEvent to nothing 
			TalkingHeadFrame:SetScript("OnEvent", function(self, event, ...) end)
			-- Close the current frame 
			TalkingHeadFrame.MainFrame.CloseButton:Click();
			-- Unregister AddOn Events 
			SilentWorldQuestSound:UnregisterAllEvents();
		end
	self.sinceLastCheck = 0;	
	end
end

local SilentWorldQuestSoundMute = CreateFrame("Frame", "SilentWorldQuestSound")	
SilentWorldQuestSoundMute:RegisterEvent("TALKINGHEAD_REQUESTED")
SilentWorldQuestSoundMute:SetScript("OnEvent",
function(self, event, ...)
	if SilentWorldQuestMute == true then
		-- Mute the Sound
		-- Play a dummy sound to get the clients current soundHandle count.
		local willPlay, soundHandle = PlaySoundKitID(2304, "Master", false);
		-- Nil error fix.
		if soundHandle then
			-- Mute the dummy sound
			StopSound(soundHandle, 1);
			-- Mute the previous sound (hopefully the initial voice acting) 
			soundHandle = soundHandle -1;
			StopSound(soundHandle, 1);
		end
		-- Close the text frame.
		SilentWorldQuestTextHide:SetScript("OnUpdate",SilentWorldQuestTextHide.onUpdate);
	end
end)

function SilentWorldQuestMessage(text, prefix)
	local tag = "SilentWorldQuest"
	local frame = DEFAULT_CHAT_FRAME
	if prefix ~= false then
		frame:AddMessage(("|cffffd480<|r|cffaaff80%s|r|cffffd480>|r %s"):format(tostring(tag), tostring(text)), 1, 0.46, 0.2)
	else
		frame:AddMessage(text, 1, 0.46, 0.2);
	end
end

-- SLASH COMMANDS REGISTER --
local SilentWorldQuestSlashCmds = {}
SilentWorldQuestSlashCmds = { ["t"]=true}

SLASH_K_SWQ_MAIN1 = "/swq"
function SlashCmdList.K_SWQ_MAIN(cmd)
	local s1, s2, s3 = strsplit(" ", cmd, 3)
		if s1 then
			s1 = string.lower(s1)
		end
		if s2 then
			s2 = string.lower(s2)
		end
		if s3 then
			s3 = string.lower(s3)
		end
		if not SilentWorldQuestSlashCmds[s1] == true then
			SilentWorldQuestMessage("Commands:")
			SilentWorldQuestMessage("/swq t : Enables/disables silent world quests.")
		elseif s1 == "t" then
			if SilentWorldQuestMute == true then
				-- To disable --
				-- If we have the function saved (and thus have already created the frame).
				if funcHeld == true then
					TalkingHeadFrame:SetScript("OnEvent", holdFunc);
				end
				SilentWorldQuestMute = false
				SilentWorldQuestMessage("World Quest Popups Enabled.")
			else
				-- To enable --
				SilentWorldQuestMute = true
				-- Register AddOn Event.
				SilentWorldQuestSoundMute:RegisterEvent("TALKINGHEAD_REQUESTED")
				if funcHeld == true then
					-- If we already have the frames onEvent function saved 
					TalkingHeadFrame:SetScript("OnEvent", function(self, event, ...) end);
					-- Unregister AddOn event as it's not required if the above is true 
					SilentWorldQuestSound:UnregisterAllEvents();	
				end
				SilentWorldQuestMessage("World Quest Popups Disabled.")
			end
		end
end

/console TargetNearestUseOld 0

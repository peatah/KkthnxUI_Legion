local K, C, L = select(2, ...):unpack()

local DataText = K.DataTexts
local NameColor = DataText.NameColor
local ValueColor = DataText.ValueColor

local format = string.format
local match = string.match
local CreateFrame, UIParent = CreateFrame, UIParent
local ToggleFrame = ToggleFrame
local ToggleDropDownMenu = ToggleDropDownMenu

local MicroMenu = CreateFrame("Frame", "KkthnxUIMicroButtonsDropDown", UIParent, "UIDropDownMenuTemplate")
MicroMenu.Buttons = {
	{text = CHARACTER_BUTTON,
		func = function()
			ToggleCharacter("PaperDollFrame")
		end,
	notCheckable = true},
	{text = SPELLBOOK_ABILITIES_BUTTON,
		func = function()
			ToggleFrame(SpellBookFrame)
		end,
	notCheckable = true},
	{text = TALENTS_BUTTON,
		func = function()
			if (not PlayerTalentFrame) then
				TalentFrame_LoadUI()
			end
			ShowUIPanel(PlayerTalentFrame)
		end,
	notCheckable = true},
	{text = ACHIEVEMENT_BUTTON,
		func = function()
			ToggleAchievementFrame()
		end,
	notCheckable = true},
	{text = WORLD_MAP.." / "..QUESTLOG_BUTTON,
		func = function()
			ShowUIPanel(WorldMapFrame)
		end,
	notCheckable = true},
	{text = MOUNTS,
		func = function()
			ToggleCollectionsJournal(1)
		end,
	notCheckable = true},
	{text = PETS,
		func = function()
			ToggleCollectionsJournal(2)
		end,
	notCheckable = true},
	{text = TOY_BOX,
		func = function() ToggleCollectionsJournal(3) end,
	notCheckable = true},
	{text = HEIRLOOMS,
		func = function()
			ToggleCollectionsJournal(4)
		end,
	notCheckable = true},
	{text = SOCIAL_BUTTON,
		func = function()
			ToggleFriendsFrame(1)
		end,
	notCheckable = true},
	{text = COMPACT_UNIT_FRAME_PROFILE_AUTOACTIVATEPVE.." / "..COMPACT_UNIT_FRAME_PROFILE_AUTOACTIVATEPVP,
		func = function()
			PVEFrame_ToggleFrame()
		end,
	notCheckable = true},
	{text = ACHIEVEMENTS_GUILD_TAB,
		func = function()
			if IsInGuild() then
				if (not GuildFrame) then
					GuildFrame_LoadUI()
				end
				GuildFrame_Toggle()
			else
				if (not LookingForGuildFrame) then
					LookingForGuildFrame_LoadUI()
				end
				LookingForGuildFrame_Toggle()
			end
		end,
	notCheckable = true},
	{text = RAID,
		func = function()
			ToggleFriendsFrame(4)
		end,
	notCheckable = true},
	{text = HELP_BUTTON,
		func = function()
			ToggleHelpFrame()
		end,
	notCheckable = true},
	{text = CALENDAR_VIEW_EVENT,
		func = function()
			if (not CalendarFrame) then
				LoadAddOn("Blizzard_Calendar")
			end
			Calendar_Toggle()
		end,
	notCheckable = true},
	{text = ENCOUNTER_JOURNAL,
		func = function()
			ToggleEncounterJournal()
		end,
	notCheckable = true},
	{text = ORDER_HALL_LANDING_PAGE_TITLE,
		func = function()
			GarrisonLandingPageMinimapButton_OnClick()
		end,
	notCheckable = true},
	{text = SOCIAL_TWITTER_COMPOSE_NEW_TWEET,
		func = function()
			if not SocialPostFrame then
				LoadAddOn("Blizzard_SocialUI")
			end
			local IsTwitterEnabled = C_Social.IsSocialEnabled()
			if IsTwitterEnabled then
				Social_SetShown(true)
			else
				K.Print(SOCIAL_TWITTER_TWEET_NOT_LINKED)
			end
		end,
	notCheckable = true},
}

local function OnMouseDown()
	Lib_EasyMenu(MicroMenu.Buttons, MicroMenu, "cursor", 0, 0, "MENU")
end

local function Update(self)
	self.Text:SetText(NameColor .. L.DataText.MicroMenu .. "|r")
end

local function Enable(self)
	if(not self.Text) then
		local Text = self:CreateFontString(nil, "OVERLAY")
		Text:SetFont(DataText.Font, DataText.Size, DataText.Flags)

		self.Text = Text
		self:SetScript("OnMouseDown", OnMouseDown)
	end

	self:Update()
end

local function Disable(self)
	self.Text:SetText("")
	self:SetScript("OnMouseDown", nil)
	self:UnregisterAllEvents()
end

DataText:Register(L.DataText.MicroMenu, Enable, Disable, Update)

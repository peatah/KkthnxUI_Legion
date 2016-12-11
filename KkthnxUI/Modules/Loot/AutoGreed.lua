local K, C, L = unpack(select(2, ...))
if C.Loot.AutoGreed ~= true or K.Level ~= MAX_PLAYER_LEVEL then return end

local pairs = pairs
local CreateFrame = CreateFrame
local GetItemInfo = GetItemInfo
local GetLootRollItemInfo = GetLootRollItemInfo

--	Auto greed & disenchant on green items(by Tekkub) and NeedTheOrb(by Myrilandell of Lothar)
local frame = CreateFrame("Frame")
frame:RegisterEvent("START_LOOT_ROLL")
frame:SetScript("OnEvent", function(self, event, id)
	local _, name, _, quality, BoP, canNeed, _, canDisenchant = GetLootRollItemInfo(id)
	if id and quality == 2 and not BoP then
		for i in pairs(K.NeedLoot) do
			local itemName = GetItemInfo(K.NeedLoot[i])
			if name == itemName and canNeed then
				RollOnLoot(id, 1)
				return
			end
		end
		local link = GetLootRollItemLink(id)
		local _, _, _, ilevel = GetItemInfo(link)
		if canDisenchant and ilevel > 482 then
			RollOnLoot(id, 3)
		else
			RollOnLoot(id, 2)
		end
	end
end)
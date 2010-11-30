--[[------------------------------
X   HotSpotMicroMenu by Sojik    X
------------------------------]]--
local fmicro = CreateFrame("Frame","MicroMenuHolder",UIParent)

local MicroButtons = {
AchievementMicroButton, CharacterMicroButton, HelpMicroButton,  -- Here's the names of the buttons.
LFDMicroButton, MainMenuMicroButton, PVPMicroButton,            -- You can use them for lines 19 - 22.
QuestLogMicroButton, SocialsMicroButton, SpellbookMicroButton,  -- Don't change anything in this list though unless you
TalentMicroButton, WatchFrameCollapseExpandButton,              -- don't want the WatchFrameCollapseExpandButton moved.
}

local function MoveMicroButtons(skinName)
	for _, f in pairs(MicroButtons) do
		f:SetParent(fmicro)
		f:ClearAllPoints()
		f:SetScale(0.2)
		f:SetAlpha(0)
	end
	CharacterMicroButton:SetPoint("TOPLEFT", UIParent, "TOPLEFT", -4, 20)    -- These lines are what you can edit.
	WatchFrameCollapseExpandButton:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", 0, 0)   -- Change the button name before :SetPoint(...) If you're going to put a micro button here I suggest changing it to ("TOPRIGHT", UIParent, "TOPRIGHT", 4, 20)
	SpellbookMicroButton:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 0, 0)      -- to any of the names from lines 7, 8 or 9.
	TalentMicroButton:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", 0, 0) -- Capitalization is important.
end

hooksecurefunc('WatchFrame_Update', function()    -- Remove these lines to remove the Quest/Achievement WatchFrame functionality.
	if WatchFrame.collapsed then                  -- Remove these lines to remove the Quest/Achievement WatchFrame functionality.
		WatchFrameHeader:Hide()                   -- Remove these lines to remove the Quest/Achievement WatchFrame functionality.
		WatchFrameTitle:SetText("")               -- Remove these lines to remove the Quest/Achievement WatchFrame functionality.
	end                                           -- Remove these lines to remove the Quest/Achievement WatchFrame functionality.
end)                                              -- Remove these lines to remove the Quest/Achievement WatchFrame functionality.

fmicro:RegisterEvent("PLAYER_ENTERING_WORLD")
fmicro:SetScript("OnEvent", function()
	hooksecurefunc("VehicleMenuBar_MoveMicroButtons", MoveMicroButtons)
	MoveMicroButtons()
end)
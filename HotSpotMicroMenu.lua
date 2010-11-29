--[[------------------------------
X   HotSpotMicroMenu by Sojik    X
------------------------------]]--
local fmicro = CreateFrame("Frame","MicroMenuHolder",UIParent)

local MicroButtons = {
	CharacterMicroButton, SpellbookMicroButton, TalentMicroButton,        -- Here's the names of the buttons.
	AchievementMicroButton, QuestLogMicroButton, SocialsMicroButton,      -- You can use them for lines 19 - 22.
	PVPMicroButton, LFDMicroButton, MainMenuMicroButton, HelpMicroButton, -- Don't change anything in this list though.
}

local function MoveMicroButtons(skinName)
	for _, f in pairs(MicroButtons) do
		f:SetParent(fmicro)
		f:ClearAllPoints()
		f:SetScale(0.2)
		f:SetAlpha(0)
	end
	CharacterMicroButton:SetPoint("TOPLEFT", UIParent, "TOPLEFT", -4, 20)    -- These lines are what you can edit.
	SpellbookMicroButton:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", 4, 20)   -- Change the button name before :SetPoint(...)
	LFDMicroButton:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 0, 0)      -- to any of the names from lines 7, 8 or 9.
	TalentMicroButton:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", 0, 0) -- Capitalization is important.
end

fmicro:RegisterEvent("PLAYER_ENTERING_WORLD")
fmicro:SetScript("OnEvent", function()
	hooksecurefunc("VehicleMenuBar_MoveMicroButtons", MoveMicroButtons)
	MoveMicroButtons()
end)
if (not ImprovedBlizzFrame.config.Arena_CombatChecker) then
    return
end

CTT=CreateFrame("Frame", nil, UIParent)
CTT:SetParent(TargetFrame)
--CTT:SetPoint("LEFT",TargetFrame,-30,5)
CTT:SetPoint("RIGHT",TargetFrame,-10,5)
CTT:SetSize(25,25)
CTT.t=CTT:CreateTexture(nil,BORDER)
CTT.t:SetAllPoints()
CTT.t:SetTexture("Interface\\Icons\\ABILITY_DUALWIELD")
CTT:Hide()

local function FrameOnUpdate(self) 
	if UnitAffectingCombat("target") then 
		self:Show() 
	else 
		self:Hide() 
	end 
end 

local g = CreateFrame("Frame", nil, UIParent) 
g:SetScript("OnUpdate", function(self) FrameOnUpdate(CTT) end)

CFT=CreateFrame("Frame", nil, UIParent)
CFT:SetParent(FocusFrame)
--CFT:SetPoint("LEFT",FocusFrame,-30,5)
CFT:SetPoint("RIGHT",FocusFrame,-10,5)
CFT:SetSize(25,25)
CFT.t=CFT:CreateTexture(nil,BORDER)
CFT.t:SetAllPoints()
CFT.t:SetTexture("Interface\\Icons\\ABILITY_DUALWIELD")
CFT:Hide()

local function FrameOnUpdate(self) 
	if UnitAffectingCombat("focus") then 
		self:Show() 
	else 
		self:Hide() 
	end 
end 

local g = CreateFrame("Frame", nil, UIParent) 
g:SetScript("OnUpdate", function(self) FrameOnUpdate(CFT) end)
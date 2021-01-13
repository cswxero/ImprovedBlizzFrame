if(not IBFC.config.BlizzardRaidFrame) then 
	return;
end

local RFP= CreateFrame("Frame")
local RaidFramePortraits = {} 

PVPSpell = PVPSpellList

local function getRaidFramePortraits(frame) 
	local indicator = RaidFramePortraits[frame:GetName()] 
	
	if not indicator then 
		indicator = CreateFrame("Frame", nil, self)
		indicator:SetAlpha(IBFC.Arena_Potrait.RaidFrameAlpha) 
		
		if(strfind(frame:GetName(), "NamePlate")) then
			--이름표일경우
			indicator:SetPoint("CENTER", frame, "CENTER", 0, 70) 
			indicator:SetSize(60, 60) 
		else
			indicator:SetPoint("CENTER", frame, "CENTER", 0, -1) 
			indicator:SetSize(IBFC.Arena_Potrait.RaidFrameSize, IBFC.Arena_Potrait.RaidFrameSize) 
		end
		
		indicator.cooldown = CreateFrame("Cooldown", "$parentCD" ,indicator,"CooldownFrameTemplate")
		indicator.cooldown:SetReverse(true)
		indicator.cooldown:SetAllPoints(indicator)
		indicator.cooldown:SetFrameLevel(0)
		indicator.icon = indicator:CreateTexture("$parentIcon", "BORDER")
		indicator.icon:SetAllPoints(indicator)
		indicator.count = indicator:CreateFontString("$parentCount", "OVERLAY")
		indicator.count:SetFont(GameFontNormal:GetFont(), 14, "OUTLINE")
		indicator.count:SetPoint("BOTTOMRIGHT", 1, 1)
		indicator.count:SetJustifyH("LEFT")
		
		frame:HookScript("OnHide",function(s) 
			RaidFramePortraits[s:GetName()]:Hide()
		end)
		
		RaidFramePortraits[frame:GetName()] = indicator 
	end 
	
	return indicator 
end 

local function updatePortraits(frame) 

	if( strfind(frame:GetName(), "NamePlate")) then return end;
	
	if not frame:IsVisible() then return end 

	local indicator = getRaidFramePortraits(frame) 
	local maxPriority = -99

	for i = 1, 40 do
		local buffName, _, _, _, d, ut, sc, _, _, spellId, c = UnitDebuff(frame.displayedUnit, i); 
		if not spellId then break end -- no more debuffs, terminate the loop
		if not buffName then break end -- no more debuffs, terminate the loop
		
		if( PVPSpell[spellId] ) then
			local Priority = PVPSpell[spellId]
					
			if Priority then
				if Priority == maxPriority  then
					maxPriority = Priority
					CompactUnitFrame_UtilSetAuraSe(indicator, frame.displayedUnit, i, nil,"DEBUFF"); 
				elseif Priority > maxPriority then
					maxPriority = Priority
					CompactUnitFrame_UtilSetAuraSe(indicator, frame.displayedUnit, i, nil,"DEBUFF"); 
				end
			end
		end
	end
	
	for i = 1, 40 do
		local buffName, _, _, _, d, ut, sc, _, _, spellId, c = UnitBuff(frame.displayedUnit, i); 
		
		if not buffName then break end -- no more debuffs, terminate the loop
		if not spellId then break end -- no more debuffs, terminate the loop
		
		if( PVPSpell[spellId] ) then
			local Priority = PVPSpell[spellId]
					
			if Priority then
				if Priority == maxPriority  then
					maxPriority = Priority
					CompactUnitFrame_UtilSetAuraSe(indicator, frame.displayedUnit, i, nil,"BUFF"); 
				elseif Priority > maxPriority then
					maxPriority = Priority
					CompactUnitFrame_UtilSetAuraSe(indicator, frame.displayedUnit, i, nil,"BUFF"); 
				end
			end
		end
	end
	
	
	if( maxPriority == -99 ) then
		indicator:Hide()
	end
end 

function CompactUnitFrame_UtilSetAuraSe(buffFrame, unit, index, filter,type) 
	local name, icon, count, debuffType, duration, expirationTime, source, isStealable, nameplateShowPersonal, spellId;
	if(type=="DEBUFF") then
		name, icon, count, debuffType, duration, expirationTime, source, isStealable, nameplateShowPersonal, spellId = UnitDebuff(unit, index, filter); 
	else
		name, icon, count, debuffType, duration, expirationTime, source, isStealable, nameplateShowPersonal, spellId = UnitBuff(unit, index, filter); 
	end
	
	buffFrame.icon:SetTexture(icon); 
	if ( count > 1 ) then 
		local countText = count; 
		if ( count >= 10 ) then 
			countText = BUFF_STACKS_OVERFLOW; 
		end 
		buffFrame.count:Show(); 
		buffFrame.count:SetText(countText); 
	else 
		buffFrame.count:Hide(); 
	end 
	buffFrame:SetID(index); 
	if ( expirationTime and expirationTime ~= 0 ) then 
		local startTime = expirationTime - duration; 
		CooldownFrame_Set(buffFrame.cooldown, startTime, duration ,1)
		buffFrame.cooldown:Show(); 
	else 
		buffFrame.cooldown:Hide(); 
	end 
	
	buffFrame:Show(); 
end 

local offset = 0;
function RaidFrame_OnUpdate(self, elapsed)
	offset = offset + elapsed
	if offset > 0.05 then
		offset = 0
		CompactRaidFrameContainer_ApplyToFrames(CompactRaidFrameContainer, "normal", updatePortraits);
	end
end

RFP:SetScript("OnUpdate", RaidFrame_OnUpdate);
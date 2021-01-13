if (not (IBFC.config.Portrait or IBFC.config.ArenaFrames)) then
    return
end

PVPSpell = PVPSpellList

local debug = false;
local Portraits = {};

local function CreateFramePortraits(unit, frame) 
	local indicator = Portraits[unit] 
	
	if not indicator then 
		indicator = CreateFrame("Frame", nil, self)
		indicator:SetAllPoints(frame)
		indicator.cooldown = CreateFrame("Cooldown", "$parentCD" ,indicator,"CooldownFrameTemplate")
		indicator.cooldown:SetReverse(true)
		indicator.cooldown:SetAllPoints(indicator)
		indicator.cooldown:SetFrameLevel(0)
		indicator.icon = indicator:CreateTexture("$parentIcon", "BORDER")
		indicator.icon:SetAllPoints(indicator)
		indicator.count = indicator:CreateFontString("$parentCount", "OVERLAY")
		indicator.count:SetFont(GameFontNormal:GetFont(), 20, "OUTLINE")
		indicator.count:SetPoint("BOTTOMRIGHT", 1, 1)
		indicator.count:SetJustifyH("LEFT")
	
		Portraits[unit] = indicator 
	end 
	
	return indicator 
end 

function ClearPortrait(unit) 
	if (Portraits[unit] ~= nil) then
		Portraits[unit]:Hide()
	end
end 

local function CompactUnitFrame_UtilSetAura(buffFrame, unit, index, filter,type) 
	--local name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, canStealOrPurge, shouldConsolidate, spellId, canApplyAura = UnitBuff(unit, index, filter); 
	local name, count, debuffType, duration, expirationTime, unitCaster, canStealOrPurge, shouldConsolidate, spellId;
	if(type=="DEBUFF") then
		name, icon, count, debuffType, duration, expirationTime, unitCaster, canStealOrPurge, shouldConsolidate, spellId = UnitDebuff(unit, index, filter); 
	else
		name, icon, count, debuffType, duration, expirationTime, unitCaster, canStealOrPurge, shouldConsolidate, spellId = UnitBuff(unit, index, filter); 
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
		--buffFrame.cooldown:SetCooldown(startTime, duration); 
		CooldownFrame_Set(buffFrame.cooldown, startTime, duration ,1)
		buffFrame.cooldown:Show(); 
	else 
		buffFrame.cooldown:Hide(); 
	end 
	buffFrame:Show(); 
	
end 

function State(s,e,unit,st)
	if(e=="PLAYER_ENTERING_WORLD")then
		ClearPortrait("player");
		ClearPortrait("target");
		ClearPortrait("focus");
		ClearPortrait("pet");
		
		for i=1,5 do 
			ClearPortrait("arena"..i);
		end;
		
		return;
	end;
	
	if(e=="ARENA_OPPONENT_UPDATE")then
		if(st=="cleared" or st=="destroyed")then 
			ClearPortrait(unit);
			return;
		end;
	end
	
	if(e=="PLAYER_TARGET_CHANGED")then 
		unit="target"; 
	end;
	
	if(e=="PLAYER_FOCUS_CHANGED")then 
		unit="focus"; 
	end;
	
	local maxPriority = -99
	--print(unit)
	if(Portraits[unit])then 
		
		indicator = Portraits[unit];
		
		for i = 1, 40 do
			local buffName,  _, _, _, d, _, ut, _, sc, spellId, c = UnitDebuff(unit, i); 
			if not spellId then break end -- no more debuffs, terminate the loop
			if not buffName then break end -- no more debuffs, terminate the loop
			
			if( PVPSpell[spellId] ) then
				--local Priority = PVPSpell[spellId].Priority
				local Priority = PVPSpell[spellId]
						
				if Priority then
					if Priority == maxPriority  then
						maxPriority = Priority
						CompactUnitFrame_UtilSetAura(indicator, unit, i, nil, "DEBUFF"); 
					elseif Priority > maxPriority then
						maxPriority = Priority
						CompactUnitFrame_UtilSetAura(indicator, unit, i, nil, "DEBUFF"); 
					end
				end
			end
		end
		
		for i = 1, 40 do
			local buffName, _, _, _, d, _, ut, _, sc, spellId, c = UnitBuff(unit, i); 
			
			if not buffName then break end -- no more debuffs, terminate the loop
			if not spellId then break end -- no more debuffs, terminate the loop
			
			if( PVPSpell[spellId] ) then
				--local Priority = PVPSpell[spellId].Priority
				local Priority = PVPSpell[spellId]
						
				if Priority then
					if Priority == maxPriority  then
						maxPriority = Priority
						CompactUnitFrame_UtilSetAura(indicator, unit, i, nil, "BUFF"); 
					elseif Priority > maxPriority then
						maxPriority = Priority
						CompactUnitFrame_UtilSetAura(indicator, unit, i, nil, "BUFF"); 
					end
				end
			end
		end
		
		
		if( maxPriority == -99 ) then
			--indicator:Hide()
			ClearPortrait(unit);
		end
	end
end

LoadAddOn("Blizzard_ArenaUI")
f=CreateFrame("frame", nil, UIParent)
f:SetAllPoints()
f:SetScript("OnEvent",State);
f:RegisterEvent("UNIT_AURA");
f:RegisterEvent("PLAYER_TARGET_CHANGED");
f:RegisterEvent("PLAYER_FOCUS_CHANGED")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:RegisterEvent("ARENA_OPPONENT_UPDATE")

if(IBFC.config.Portrait) then
	CreateFramePortraits("player",PlayerFrame.portrait)
	CreateFramePortraits("target",TargetFrame.portrait)
	CreateFramePortraits("focus",FocusFrame.portrait)
	CreateFramePortraits("pet",PetFrame.portrait)
end

if (IBFC.config.ArenaFrames) then
	for i=1,5 do 
		CreateFramePortraits("arena"..i,_G["ArenaEnemyFrame"..i].classPortrait)
	end;
end

if (not ImprovedBlizzFrame.config.xArena_Losecontrol) then
    return
end

debuff=PVPSpellList;

local function CreateOverlay(button)
	overlay = CreateFrame("Frame", nil, button, "LoseControlAlert")
	overlay:ClearAllPoints()
	overlay:SetParent(button)
	overlay:SetAlpha(1.0)
	overlay:SetPoint("TOPLEFT", button, "TOPLEFT", -ImprovedBlizzFrame.LoseControlPos.Size * 0.4, ImprovedBlizzFrame.LoseControlPos.Size * 0.4)
	overlay:SetPoint("BOTTOMRIGHT", button, "BOTTOMRIGHT", ImprovedBlizzFrame.LoseControlPos.Size * 0.4, -ImprovedBlizzFrame.LoseControlPos.Size * 0.4);
	
	
	button.overlay = overlay;
	overlay:Hide()	
	button.overlayShow = false;	
	--OverStop(button)
end

local function OverPlay(button)
	if( not button.overlayShow ) then 
		button.c.overlay.animIn:Play();
	end		
	
	button.overlayShow = true;
end

local function OverStop(button)
	button.c.overlay.animIn:Stop();
	button.c.overlay:Hide();
	
	button.overlayShow = false;
end

function mDebuff(id) 
	f=CreateFrame("frame") 
	f:SetSize(ImprovedBlizzFrame.LoseControlPos.Size,ImprovedBlizzFrame.LoseControlPos.Size) 
	f.t=f:CreateTexture(nil,"BORDER") 
	f.t:SetAllPoints() 
	f.t:SetTexture(GetSpellTexture(id)) 
	--f.t:SetTexCoord(0.1, 0.9, 0.1, 0.9)
	f.c=CreateFrame("Cooldown",id.."C___")
	f.c:SetAllPoints(f) 
	
	if not (f.c.overlay) then
		CreateOverlay(f.c);
	end
	
	return f;
end;

dFrame={};

for i=1,#debuff do 
	local data = debuff[i]
	
	dFrame[i]=mDebuff(data.spellID);
	dFrame[i]:Hide();
	dFrame[i].c:Hide();
end;

local function createHilight_toLS(button)
	button.Hilight = button:CreateTexture(nil, "BORDER");
	button.Hilight:SetSize(ImprovedBlizzFrame.LoseControlPos.Size*2-5, ImprovedBlizzFrame.LoseControlPos.Size*2-5); 
	button.Hilight:SetPoint("CENTER");
	button.Hilight:SetTexture("Interface\\Buttons\\CheckButtonGlow");

end

function Act(frame, offset, eTime, duration) 
	frame:Show();
	frame:SetPoint("CENTER",offset+ImprovedBlizzFrame.LoseControlPos.PosX,ImprovedBlizzFrame.LoseControlPos.PosY);
	CooldownFrame_SetTimer(frame.c, eTime - duration, duration ,1)
	frame.c:Show();
	
	--print(frame.c.overlay.animIn:IsPlaying())
	
	--if( frame.c.overlay.animIn:IsPlaying() ) then
	--	frame.c.overlay.animIn:Play();
	--end
	OverPlay(frame)
	--if not frame.Hilight then createHilight_toLS(frame) end
	--	frame.Hilight:Show();
end;

function Debuff(self,e,unit) 
	if(unit=="player") then 
		local x=ImprovedBlizzFrame.LoseControlPos.PosX;
	
		for i=1,#debuff do 

			local data = debuff[i]
			
			if data.filter == "DEBUFF" then 
			
				spell = GetSpellInfo(data.spellID)
		
				if not( spell == nil ) then
					if(UnitDebuff(unit,spell)) then	
						local _, _, texture, count, _, duration, eTime = UnitDebuff(unit, spell)
					
						if( duration == nil or eTime == nil ) then
							print("LoseControl Debug Message"..unit, data.spellID, duration, eTime);
						else
							if( data.absID == true ) then
								if( data.spellID == spellID ) then
									Act(dFrame[i],x, eTime, duration);
									x=x+ImprovedBlizzFrame.LoseControlPos.Size+ImprovedBlizzFrame.LoseControlPos.interval;
								end
							else
								Act(dFrame[i],x, eTime, duration);
								x=x+ImprovedBlizzFrame.LoseControlPos.Size+ImprovedBlizzFrame.LoseControlPos.interval;
							end
						end
					else
						dFrame[i]:Hide();
						dFrame[i].c:Hide();
						OverStop(dFrame[i])
					end
				else
					print("Not Found SpellID: "..data.spellID )
				end	
			end
		end;
	end;
end;

f=CreateFrame("frame");
f:SetScript("OnEvent",Debuff)
f:RegisterEvent("UNIT_AURA")
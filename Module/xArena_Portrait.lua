if (not ImprovedBlizzFrame.config.xArena_Portrait) then
    return
end

state=PVPSpellList;

local debug = false;

function NT(u) 
	if (_G[u] ~= nil) then
		--print("NT("..u..")")
		_G[u].c:Hide()
		_G[u]:SetTexture(nil)
		_G[u].maxExpirationTime = 0;
	end
end 

function mFC(u,p,sz)
	--print("mFC("..u..")")
	if not _G[u] then 
		f:CreateTexture(u,"Border")
		_G[u].c=CreateFrame("Cooldown",u.."C",UIParent,"CooldownFrameTemplate")
		_G[u].c:SetReverse(true)
		_G[u].c:SetFrameLevel(2)
	end 
	
	if(sz)then 
		_G[u]:SetSize(sz,sz)
		--레이드 프레임은 알파 1일경우 체력바가 가리니 알파를 줄이자
		_G[u]:SetAlpha(ImprovedBlizzFrame.Arena_Potrait.RaidFrameAlpha)
		_G[u]:SetPoint("Center",p,"Center",0,0)				
	else 
		_G[u]:SetAllPoints(p)
	end 
	
	--_G[u]:SetReverse(true) -- makes the cooldown shade from light to dark instead of dark to light
	
	_G[u].maxExpirationTime = 0;
	_G[u].c:SetAllPoints(u) 
end

function CooldownCheck( unit, eTime, duration, texture )
	if( eTime > _G[unit].maxExpirationTime or _G[unit]:GetTexture()~= texture) then
		_G[unit].maxExpirationTime = eTime
		_G[unit]:SetTexture(texture)
		--SetPortraitToTexture(_G[unit], texture)
		CooldownFrame_SetTimer(_G[unit].c, _G[unit].maxExpirationTime - duration, duration ,1)
	end
end

function State(s,e,unit,st)
	if(e=="PLAYER_ENTERING_WORLD")then
		NT("player")
		NT("target")
		NT("focus")
		NT("pet")

		for i=1,5 do 
			NT("arena"..i)
		end;
		
		for j=1,40 do 
			NT("raid"..j)
		end;
		
		return;
	end;
	
	if(e=="ARENA_OPPONENT_UPDATE")then
		--print("ARENA_OPPONENT_UPDATE :"..st.." Unit:"..unit)
		if(st=="cleared" or st=="destroyed")then 
			NT(unit);
			return;
		end;
	end
	
	if(e=="PLAYER_TARGET_CHANGED")then 
		unit="target"; 
	end;
	
	if(e=="PLAYER_FOCUS_CHANGED")then 
		unit="focus"; 
	end;
	
	local maxPriority = 1
	local maxExpirationTime = 0
	local Icon, Duration
	
	if(_G[unit])then 
		for i = 1, 40 do
			local name, _, icon, _, _, duration, expirationTime, _, _, _, spellId = UnitAura(unit, i, "HARMFUL")
			if not spellId then break end -- no more debuffs, terminate the loop
			if debug then print(unit, "debuff", i, ")", name, "|", duration, "|", expirationTime, "|", spellId) end

			if( PVPSpellList_new[spellId] ) then
				local Priority = PVPSpellList_new[spellId].Priority
						
				if Priority then
					if Priority == maxPriority and expirationTime > maxExpirationTime then
						maxExpirationTime = expirationTime
						Duration = duration
						Icon = icon
					elseif Priority > maxPriority then
						maxPriority = Priority
						maxExpirationTime = expirationTime
						Duration = duration
						Icon = icon
					end
				end
			end
		end
		
		for i = 1, 40 do
			local name, _, icon, _, _, duration, expirationTime, _, _, _, spellId = UnitAura(unit, i)
			if not spellId then break end -- no more debuffs, terminate the loop
			if debug then print(unit, "buff", i, ")", name, "|", duration, "|", expirationTime, "|", spellId) end

			if( PVPSpellList_new[spellId] ) then
				local Priority = PVPSpellList_new[spellId].Priority
			
				if Priority then
					if Priority == maxPriority and expirationTime > maxExpirationTime then
						maxExpirationTime = expirationTime
						Duration = duration
						Icon = icon
					elseif Priority > maxPriority then
						maxPriority = Priority
						maxExpirationTime = expirationTime
						Duration = duration
						Icon = icon
					end
				end
			end
		end
		
		if( maxExpirationTime == 0 ) then
			--찍을게 없다
			NT(unit)
		else
			--찍을게 있다
			CooldownCheck( unit, maxExpirationTime, Duration, Icon)
		end
	end
	
	--[[
	if(_G[unit])then 
		for i=1,#state do 
			local data = state[i]
			local spell = GetSpellInfo(data.spellID)

			if not(spell == nil) then
				if( data.filter == "BUFF" ) then
					if UnitBuff(unit, spell) then 
						local _, _, texture, _, _, duration, eTime, _, _, _ , spellID  = UnitBuff(unit, spell)
						
						if( data.absID == true ) then
							if( data.spellID == spellID ) then
								CooldownCheck( unit, eTime, duration, texture)
								return
							end
						else
							CooldownCheck( unit, eTime, duration, texture)
							return
						end
						
					end
				elseif( data.filter == "DEBUFF" ) then
					if UnitDebuff(unit, spell) then 
						local _, _, texture, _, _, duration, eTime, _, _, _ , spellID  = UnitDebuff(unit, spell)
						
						if( data.absID == true ) then
							if( data.spellID == spellID ) then
								CooldownCheck( unit, eTime, duration, texture)
								return
							end
						else
							CooldownCheck( unit, eTime, duration, texture)
							return
						end
						
					end
				end
			else
				print("Alert - Not Found SpellID: "..state[i])
			end

--	불안정한 고통 해제 예외처리
			if UnitDebuff(unit, UA_localized) then
				local _, _, texture, _, _, duration, eTime = UnitDebuff(unit, UA_localized)
				
				if texture == "Interface\\Icons\\Spell_Holy_Silence" then
					CooldownCheck( unit, eTime, duration, texture)
					return
				end
			end
			
			if(i==#state) then 
				NT(unit)
			end;
		end;
		
		--NT(unit);
	end;
	]]--
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

mFC("player",PlayerFrame.portrait)
mFC("target",TargetFrame.portrait)
mFC("focus",FocusFrame.portrait)
mFC("pet",PetFrame.portrait)

if (ImprovedBlizzFrame.config.xArena_Portrait_ArenaFrame) then
	for i=1,5 do 
		if(mFC) then 
			mFC("arena"..i,_G["ArenaEnemyFrame"..i].classPortrait)
		end 
	end;
end

if (ImprovedBlizzFrame.config.xArena_Portrait_BlizRaidFrame) then
	--hooksecurefunc("CompactUnitFrame_SetUnit",function(fr,u)if(u and u:find("raid")and not(u:find("pet")or u:find("player")))then mFC(u,fr,ImprovedBlizzFrame.Arena_Potrait.RaidFrameSize)fr:HookScript("OnHide",function(s)if(_G[s.unit])then _G[s.unit]:SetTexture(nil)_G[s.unit].c:Hide()end end)end end)
	--hooksecurefunc("CompactUnitFrame_SetUnit",function(fr,u)if(u and u:find("raid")and not(u:find("pet")or u:find("player")))then mFC(u,fr,ImprovedBlizzFrame.Arena_Potrait.RaidFrameSize)fr:HookScript("OnHide",function(s)if(_G[s.unit])then _G[s.unit]:SetTexture(nil)_G[s.unit].c:Hide();_G[s.unit].maxExpirationTime = 0; end end)end end)
	--hooksecurefunc("CompactUnitFrame_SetUnit",function(fr,u)if(u and u:find("raid")and not(u:find("pet")or u:find("player")))then mFC(u,fr,ImprovedBlizzFrame.Arena_Potrait.RaidFrameSize)fr:HookScript("OnHide",function(s) if( s.unit ~= nil) then print("Reset:"..s.unit);NT(s.unit) end; end)end end)
	hooksecurefunc("CompactUnitFrame_SetUnit",function(fr,u)if(u and u:find("raid")and not(u:find("pet")or u:find("player")))then mFC(u,fr,ImprovedBlizzFrame.Arena_Potrait.RaidFrameSize)fr:HookScript("OnHide",function(s) if( s.unit ~= nil) then NT(s.unit) end; end)end end)
end

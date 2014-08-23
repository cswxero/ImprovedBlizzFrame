if (ImprovedBlizzFrame.config.xArena_PVPTrinkets) then	
	print("xArena_PVPTrinkets Module");
	-- Chek Cooldown in Battleground
	COOLDOWN_MAP={
	--공통
		[59752] = 120, --"인간의 자생력" (인간 종족 특성)
		[42292] = 120, --"계급장"
		[7744] = 120, --"포세이큰의 의지",
	}
	
	cooldown={};	

	function isReset(s,n)
		if(RESET_MAP[s]) then 
			for _,id in pairs(RESET_MAP[s]) do 
				if(_G[id..n]) then 
					rfc(_G[id..n].c,GetTime(),0,1)
				end;
			end;
			
			return 1;
		end;
	end;

	function Cp(n,s)
		f.t=f:CreateTexture(n,"BORDER")
		
		if(s==42292) then 
			f.t:SetTexture(GetItemIcon(70395))
		else 
			f.t:SetTexture(GetSpellTexture(s))
		end;
		
		f.t:SetSize(ps,ps)
		f.t:SetPoint("Top",0,100)
		f.t.c=cf("Cooldown",n.."C")
		f.t.c:SetAllPoints(f.t)
		
		return f.t;
	end

	function isHarm(fl)
		return bit.band(fl,COMBATLOG_OBJECT_REACTION_HOSTILE)
	end;
	
	function isSpell(e)
		return e=="SPELL_CAST_SUCCESS" or e=="SPELL_AURA_APPLIED" or e=="SPELL_MISSED" or e=="SPELL_SUMMON"
	end;

	function SC(n,s)
		if not cooldown[n] then 
			cooldown[n]={}
		end;
		
		if not cooldown[n][s] then 
			cooldown[n][s]=Cp(s..n,s)
		end;
		
		rfc(_G[s..n].c,GetTime(),COOLDOWN_MAP[s],1)
	end;
	
	function isTarget(n)
		local tn=UnitName("target")
		return(tn and n==strmatch(tn,"[%P]+"))
	end

	function Fp(n)
		for i=1,WorldFrame:GetNumChildren()do 
			frame=select(i,WorldFrame:GetChildren())
			if (frame) then
				if( frame:GetName() )then
					
					if(gsub(frame:GetName(), '%s%(%*%)',''):find("NamePlate")) then
						if( n==strmatch(((select(2, frame:GetChildren())):GetRegions()):GetText(),"[%P]+") ) then
							if(frame:IsVisible())then 
								return frame;
							end;
						end;
					end;
				end;
			end;
		end;
	end

	function Pp() 
		for n,tb in pairs(cooldown) do 
			pl=Fp(n)
			
			if(pl) then 
				if(isTarget(n)) then 
					Bp(pl,tb,1)
				else 
					Bp(pl,tb,0.6)
				end;
			else 
				for _,fr in pairs(tb) do 
					fr:ClearAllPoints()
					fr:SetPoint("Top",UIParent,"Top",0,100)
				end;
			end;
		end;
	end

	function Bp(pt,tb,ap) 
		local x=0;
		
		for id,fr in pairs(tb) do 
			fr:SetAlpha(ap)
			fr:ClearAllPoints()
			
			if(id==42292 or id==59752 or id==7744) then 
				fr:SetPoint("BOTTOMLEFT",pt,"TOPRIGHT",0,-40) 
			else 
				fr:SetPoint("BOTTOMLEFT",pt,"TOPLEFT",x,-5);
				x=x+ps+5;
			end;
		end;
	end

	function Kp(_,e,...)
		if(e==e6) then 
			_,eT,_,_,n,fl,_,_,_,_,_,s,_,_,_=...;
			
			if(isHarm(fl)~=0 and isSpell(eT)and COOLDOWN_MAP[s]) then 
				n=strmatch(n,"[%P]+")
				
				--if not isReset(s,n) then 
					SC(n,s)
				--end;
			end;
		else 
			_,st=...;
			
			if(e==e3 and st=="cleared") then 
				Dp()
			end;
		end;
	end

	function Dp() 
		for n,table in pairs(cooldown) do 
			for id,frame in pairs(table) do 
				frame:Hide()
				frame.c:Hide()
				_G[id..n].c=nil;
				_G[id..n]=nil;
			end;
		end;
		
		cooldown={}
	end

	ps=30;
	tp=0;
	cf=CreateFrame;
	rfc=CooldownFrame_SetTimer;
	e3="ARENA_OPPONENT_UPDATE";
	e6="COMBAT_LOG_EVENT_UNFILTERED";
	f=cf("frame")
	f:SetAllPoints()
	f:SetScript("OnEvent",Kp)
	f:RegisterEvent(e3)
	f:RegisterEvent(e6)
	f:SetScript("OnUpdate",Pp)
end
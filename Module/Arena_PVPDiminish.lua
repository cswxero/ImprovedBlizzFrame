if (ImprovedBlizzFrame.config.Arena_PVPDiminish) then
	-- Gradual CC
	-- 스턴류 : GRA_MAP[1]={2812,1833,408,12809,46968,853,85388,44572,5211,30283,89766,9005,22570,47481,88625,90337,91797}
	-- 변이류 : GRA_MAP[2]={118,82691,49203,6770,1499,20066,51514}
	-- 공포류 : GRA_MAP[3]={2094,5246,8122,5484,5782,6358,10326,676,51722}
	-- 침묵류 : GRA_MAP[4]={28730,18498,47476,34490,1330,55021,19647,15487}
	
	function isHarm(fl)
		return bit.band(fl,COMBATLOG_OBJECT_REACTION_HOSTILE)
	end
	
	function isTarget(n)
		local tn=UnitName("target")
		return(tn and n==strmatch(tn,"[%P]+"))
	end;
	
	function Cg(n)
		f.t=f:CreateTexture(n,"BORDER")
		f.t:SetSize(gs,gs)
		f.t:SetPoint("Top",0,100)
		f.t.c=CreateFrame("Cooldown",n.."C")
		f.t.c:SetAllPoints(f.t)
		return f.t;
	end;
	
	function Sg(n,s,k)
		if not gradual[n] then 
			gradual[n]={}
		end;
		
		if not gradual[n][k] then 
			gradual[n][k]=Cg(k..n)
		end;
		
		_G[k..n]:SetTexture(GetSpellTexture(s))
		CooldownFrame_SetTimer(_G[k..n].c,GetTime(),18,1)
	end

	function Fp(n)
		for i=1,WorldFrame:GetNumChildren()do 
			frame=select(i,WorldFrame:GetChildren())
			
			if (frame) then
				if( frame:GetName() )then
					if(gsub(frame:GetName(), '%s%(%*%)',''):find("NamePlate")) then
						--print("n:"..n.."test"..strmatch(((select(2, frame:GetChildren())):GetRegions()):GetText(),"[%P]+"));
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
	
	function Pg()
		for n,tb in pairs(gradual) do 
			pl=Fp(n)
			
			if (pl) then 
				if(isTarget(n)) then 
					Bg(pl,tb,1)
				else 
					Bg(pl,tb,0.6)
				end;
			else 
				for _,fr in pairs(tb) do 
					fr:ClearAllPoints()
					fr:SetPoint("Top",UIParent,"Top",0,100)
				end;
			end;
		end;
	end
	
	function Bg(pt,tb,ap)
		local gn=0;
		for _,fr in pairs(tb) do 
			fr:ClearAllPoints()
			if(fr.c:IsVisible()) then 
				fr:SetAlpha(ap)
				fr:SetPoint("BOTTOMLEFT",pt,"TOPRIGHT",30+gs*floor(gn/2),-25-gs*(gn%2))
				gn=gn+1;
			else 
				fr:SetPoint("Top",UIParent,"Top",0,100)
			end;
		end;
	end
	
	function Kg(_,e,...)
		if(e=="COMBAT_LOG_EVENT_UNFILTERED")then _,eT,_,_,_,_,_,_,n,fl,_,s,_,_,_=...;
		
			if(isHarm(fl)~=0 and (eT=="SPELL_AURA_REMOVED" or eT=="SPELL_AURA_REFRESH")) then 
				if ( not n ) then
					local tempName, _, _, _, _, _, _, _, _ = GetSpellInfo(s)
					--print("Arena_PVPDiminish Debug String : "..tempName.."("..s..")")
					return;
				end
				
				n=strmatch(n,"[%P]+")
				
				for k,table in pairs(GRA_MAP) do 
					for _,id in pairs(table) do 
						if(id==s)then 
							Sg(n,s,k)
						end;
					end;
				end;
			end;
		end;
	end
	gs=25;
	f=CreateFrame("frame")
	f:SetAllPoints()
	f:SetScript("OnEvent",Kg)
	f:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	f:SetScript("OnUpdate",Pg)
	gradual={}
end
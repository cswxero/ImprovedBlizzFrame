local addonName, ns = ...

if not (IBFC.config.NamePlateTinker or IBFC.config.NamePlateDiminish) then
	return
end

local f
local npVisible = {} --화면에 보여지고 있는 이름표를 담고 있는 배열
local ps=25;
local gs=25; --아이콘 크기
local SPELL_MAP = {}
local CDTimeCache={} -- 쿨다운 타임 캐쉬
local TextureCache={} --쿨다운 아이콘 캐쉬
local DRTextureCache={} --점감 아이콘 캐쉬

local gradual={}
local cooldown={}
local isArena=false
local isBg=false
local isPvP=false

if (IBFC.config.NamePlateTinker) then
	for sp,tm in pairs(TRINKET_MAP)do
		--print(sp,tm)
		SPELL_MAP[sp] = tm;
	end
end

if (IBFC.config.NamePlateZzal) then
	for sp,tm in pairs(INTERRUPT_MAP)do
		--print(sp,tm)
		SPELL_MAP[sp] = tm;
	end
end

if (IBFC.config.NamePlateCooldown) then
	for sp,tm in pairs(COOLDOWN_MAP)do
		--print(sp,tm)
		SPELL_MAP[sp] = tm;
	end

	--쿨다운 기능 켜져있고 짤기능이 꺼져있으면 쿨다운 위치로 짤도 이동
	if (not IBFC.config.NamePlateZzal) then
		for sp,tm in pairs(INTERRUPT_MAP)do
			--print(sp,tm)
			SPELL_MAP[sp] = tm;
		end
	end

	--쿨다운 기능 켜져있고 계급장 기능이 꺼져있으면 쿨다운 위치로 계급장도 이동
	if (not IBFC.config.NamePlateTinker) then
		for sp,tm in pairs(TRINKET_MAP)do
			--print(sp,tm)
			SPELL_MAP[sp] = tm;
		end
	end
end

wipe(COOLDOWN_MAP)

for sp,tm in pairs(SPELL_MAP)do
	if (GetSpellLink(sp) == nil) then
		print("[SPELL_MAP] 없는 주문 -->>"..sp);
	else
		CDTimeCache[sp] = tm;
		TextureCache[sp] = select(3, GetSpellInfo(sp));
	end
end

wipe(SPELL_MAP)

for k,t in pairs(GRA_MAP) do
	for _,id in pairs(t) do
		if IBFC.config.NamePlateDiminishCommonIcon then
			if (GetSpellLink(id) == nil) then
				print("[GRA_MAP] 없는 주문 -->> "..id);
			else
				DRTextureCache[id] = select(3, GetSpellInfo(id));
			end
			break
		else
			if (GetSpellLink(id) == nil) then
				print("[GRA_MAP] 없는 주문 -->> "..id);
			else
				DRTextureCache[id] = select(3, GetSpellInfo(id));
			end
		end
	end;
end;

if (UnitFactionGroup("player") == "Alliance") then
	TextureCache[42292] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_01"; --PvP 장신구
	TextureCache[195710] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_01";--명예로운메달
	TextureCache[208683] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_01";--검투사의 메달
	TextureCache[214027] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_01";--상황 적응 (발동 급장)
else
	TextureCache[42292] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02";--PvP 장신구
	TextureCache[195710] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02";--명예로운메달
	TextureCache[208683] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02";--검투사의 메달
	TextureCache[214027] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02";--상황 적응 (발동 급장)
end

local function isHarm(fl)
	return bit.band(fl,COMBATLOG_OBJECT_REACTION_HOSTILE)
end

local function isSpell(e)
	return e=="SPELL_CAST_SUCCESS" or e=="SPELL_AURA_APPLIED" or e=="SPELL_MISSED" or e=="SPELL_SUMMON"
end;

local function isTarget(n)
	--local tn=UnitName("target")
	local tn=UnitGUID("target")
	return(tn and n==tn)
end;

local function isReset(n,s)
	if(RESET_MAP[s])then
		for _,id  in pairs(RESET_MAP[s])do
			if (TRINKET_MAP[id])then
				id = 42292;
			end
			if(cooldown[n] and cooldown[n][id])then
				CooldownFrame_Set(cooldown[n][id].c,GetTime(),0,1)
				cooldown[n][id].timeleft = 0;
			end;
		end;
		return true;
	end;
	return false;
end

local function Cg(n)
	f.t=f:CreateTexture(n,"BORDER")
	f.t:SetSize(gs,gs)
	f.t:SetPoint("Top",0,100)
	--f.t:SetTexCoord(0.1, 0.9, 0.1, 0.9)

	--f.t.background = f:CreateTexture(n,"BORDER")
	--f.t.background:SetPoint("CENTER", f.t)
	--f.t.background:SetPoint("CENTER", f.t,"CENTER")
	--f.t.background:SetAllPoints(f.t)
	--f.t.background:SetHeight(gs);
	--f.t.background:SetWidth(gs);
	--f.t.background:SetSize(gs,gs)
	--f.t.background:SetTexture(1, 1, 1);

	local border = f:CreateTexture()
	border:SetTexture("Interface\\Buttons\\UI-Debuff-Overlays")
	border:SetTexCoord(0.296875, 0.5703125, 0, 0.515625)
	border:SetSize(gs +3, gs +2)
	border:SetPoint('CENTER', f.t, 'CENTER')
	border:SetVertexColor(0,0,0)
	f.t.border = border

	f.t.c=CreateFrame("Cooldown",n.."C")
	f.t.c:SetAllPoints(f.t)
	return f.t;
end;

local function Sg(n,s,k)
	if not gradual[n] then
		gradual[n]={}
	end;

	if not gradual[n][k] then
		gradual[n][k]=Cg(k..n)
		_G[k..n].c:SetScript("OnHide", function(self)
			self.count = nil;
		end)
	end;

	local f = _G[k..n]
	if (f.c.count==nil)then
		f.c.count = 1;
	else
		f.c.count = f.c.count + 1;
	end;

	--local mask_rgb = {1, 1, 1};
	local mask_rgb = {0, 0, 0};
	if _G[k..n].c.count==2 then
		mask_rgb = {1, 1, 0}
	elseif _G[k..n].c.count > 2 then
		mask_rgb = {1, 0, 0}
	end

	--_G[k..n].background:SetVertexColor(mask_rgb[1], mask_rgb[2], mask_rgb[3])
	_G[k..n].border:SetVertexColor(mask_rgb[1], mask_rgb[2], mask_rgb[3])


	--_G[k..n]:SetTexture(GetSpellTexture(s))
	_G[k..n]:SetTexture(DRTextureCache[s])
	CooldownFrame_Set(_G[k..n].c,GetTime(),18,1)
end

local function Fp(n)
	for frame, unitName in pairs(npVisible) do
		if (n==unitName) then
			return frame
		end
	end
end

local function Bg(pt,tb,ap)
	local gn=0;
	for _,fr in pairs(tb) do
		fr:ClearAllPoints()
		if(fr.c:IsVisible()) then
			fr:SetAlpha(ap)
			--fr.border:SetAlpha(ap)
			fr.c:SetAlpha(ap)
			fr:SetPoint("BOTTOMLEFT",pt,"TOPRIGHT",30+gs*floor(gn/2),-25-gs*(gn%2))
			gn=gn+1;
		else
			fr:SetPoint("Top",UIParent,"Top",0,100)
		end;
	end;
end

local function Cp(n,s)
	f.t=f:CreateTexture(n,"BORDER")
	f.t:SetTexture(TextureCache[s])
	f.t:SetSize(ps,ps)
	f.t:SetPoint("Top",0,100)

	local border = f:CreateTexture()
	border:SetTexture("Interface\\Buttons\\UI-Debuff-Overlays")
	border:SetTexCoord(0.296875, 0.5703125, 0, 0.515625)
	border:SetSize(gs +3, gs +2)
	border:SetPoint('CENTER', f.t, 'CENTER')
	border:SetVertexColor(0,0,0)
	f.t.border = border

	f.t.c=CreateFrame("Cooldown",n.."C")
	f.t.c:SetAllPoints(f.t)
	f.t.timeleft = 0;

	return f.t;
end

local function SC(n,s)
	if not cooldown[n] then
		cooldown[n]={}
	end;

	--local set_time = SPELL_MAP[s];
	local set_time=CDTimeCache[s]
	if (TRINKET_MAP[s])then
		if isPvP and s==195710 then
			s = 42292;
		--전장에서 검투사의 메달이 아닌 명예로운 메달이 사용되는 버그가 있는듯 하다.
		--사용은 명예로운 메달이 사용되는데 쿨탐은 또 검투사의 메달 쿨탐이 적용되는듯하다		
			set_time=120
		end
	end
	if not cooldown[n][s] then
		cooldown[n][s]=Cp(n..s, s)
	end;

	if (TRINKET_MAP[s]) then
		local left_time = cooldown[n][s].timeleft;

		if(left_time<set_time)then
			CooldownFrame_Set(cooldown[n][s].c,GetTime(),set_time,1)
			cooldown[n][s].timeleft = set_time;
		end
	else
		CooldownFrame_Set(cooldown[n][s].c,GetTime(),set_time,1)
		cooldown[n][s].timeleft = set_time;
	end
end;


local function Bp(pt,tb,ap,elapsed)
	local x=0
	for id,fr in pairs(tb) do
		--print(fr.timeleft);
		if fr.timeleft <= 0 then
			fr.timeleft = 0;
		else
			fr.timeleft = fr.timeleft-elapsed;
		end;

		fr:ClearAllPoints()
		--if(fr:IsVisible()) then
		if(fr.c:IsVisible()) then
			fr:SetAlpha(ap)
			if IBFC.config.NamePlateTinker and TRINKET_MAP[id] then
				fr:SetPoint("BOTTOMLEFT",pt,"TOPRIGHT",0,-40)
			--elseif IBFC.config.NamePlateZzal and INTERRUPT_MAP[id] then
			--	fr:SetPoint("BOTTOMRIGHT",pt,"TOPLEFT",0,-40)
			else
				fr:SetPoint("BOTTOMLEFT",pt,"TOPLEFT",x,5);
				x=x+ps+5;
			end;
		else
			fr:SetPoint("Top",UIParent,"Top",0,100)
		end;
	end;
end

local function Dp()
	for n,table in pairs(cooldown) do
		for id,frame in pairs(table) do
			frame:Hide()
			frame.border:Hide()
			frame.c:Hide()
			_G[n..id].c=nil;
			--_G[id..n].border=nil;
			_G[n..id]=nil;
		end;
	end;


	for n,table in pairs(gradual) do
		for id,frame in pairs(table) do
			frame:Hide()
			--frame.background:Hide()
			frame.border:Hide()
			frame.c:Hide()
			--print("GrClear:"..id..n);
			_G[id..n].c=nil;
			--_G[id..n].border=nil;
			_G[id..n]=nil;
		end;
	end;

	gradual={}
	cooldown={}
	--isArena=select(2, GetInstanceInfo())
	local inInstance, instanceType = IsInInstance()
	if inInstance and (instanceType == 'pvp' or instanceType == 'arena' ) then
		isPvP = true
		if instanceType=='arena' then
			isArena = true
		elseif instanceType=='pvp' then
			isBg = true
		end
	end
end

local function onEvent(_,e,...)
	if(e=="PLAYER_ENTERING_WORLD")then
		Dp();
	elseif(e=="NAME_PLATE_UNIT_ADDED")then

		local unitID = ...;
		local nameplate = C_NamePlate.GetNamePlateForUnit(unitID);
		local unitName = UnitGUID(unitID);
		--local unitName = UnitName(unitID);
		npVisible[nameplate] = unitName;

	elseif(e=="NAME_PLATE_UNIT_REMOVED")then

		local unitID = ...;
		local nameplate = C_NamePlate.GetNamePlateForUnit(unitID);
		npVisible[nameplate] = nil;
	elseif(e=="COMBAT_LOG_EVENT_UNFILTERED")then
		if (IBFC.config.NamePlateDiminish) then
			_,eT,_,_,_,_,_,destGUID,n,fl,_,s,_,_,AuraType = CombatLogGetCurrentEventInfo()

			if(isHarm(fl)~=0 and (eT=="SPELL_AURA_REMOVED" or eT=="SPELL_AURA_REFRESH") and AuraType=="DEBUFF") then
				n = destGUID

				--[[
				local className = GetPlayerInfoByGUID(destGUID)

				if not className then
					return;
				end]]

				--print(className)

				--n=strmatch(n,"[%P]+")

				--print(n)

				if strfind(n,"Player")==nil then return end


				for k,table in pairs(GRA_MAP) do
					for _,id in pairs(table) do
						if(id==s)then
							if(IBFC.config.NamePlateDiminishCommonIcon) then
								Sg(n,table[1],k)
							else
								Sg(n,s,k)
							end
						end;
					end;
				end;
			end;
		end

		if (IBFC.config.NamePlateTinker or IBFC.config.NamePlateCooldown or IBFC.config.NamePlateZzal) then
			_,eT,_,uid,n,fl,_,_,_,_,_,s,_,_,_= CombatLogGetCurrentEventInfo()

			--print("test"..s);
			if(isHarm(fl)~=0 and isSpell(eT))then

				local TEMP_MAP = nil;

				--투기장이면 급장/차단기만 나온다.
				if (IBFC.config.NamePlateCooldown_ARENA==false and isArena) then
					TEMP_MAP = TRINKET_MAP
					for sp,tm in pairs(INTERRUPT_MAP)do
						--print(sp,tm)
						TEMP_MAP[sp] = tm;
					end
				else
					--TEMP_MAP = SPELL_MAP
					TEMP_MAP = CDTimeCache
				end

				if TEMP_MAP[s] or RESET_MAP[s] then
					--n=strmatch(n,"[%P]+")
					if not isReset(uid,s) then
						SC(uid,s)
					end;
				end
			end
		end
		
	end;
end


local getUpdate = 0
local function onUpdate(frame, elapsed)
	getUpdate = getUpdate + elapsed
	if (getUpdate > .33) then
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

		for n,tb in pairs(cooldown) do
			pl=Fp(n)
			if(pl) then
				if(isTarget(n)) then
					Bp(pl,tb,1,getUpdate)
				else
					Bp(pl,tb,0.6,getUpdate)
				end;
			else
				for _,fr in pairs(tb) do
					fr:ClearAllPoints()
					fr:SetPoint("Top",UIParent,"Top",0,100)
				end;
			end;
		end;

		getUpdate = 0
	end;
end

f=CreateFrame("frame")
f:SetAllPoints()
f:SetScript("OnEvent",onEvent)
f:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
--f:RegisterEvent("ARENA_OPPONENT_UPDATE")
f:RegisterEvent("NAME_PLATE_UNIT_ADDED")
f:RegisterEvent("NAME_PLATE_UNIT_REMOVED")
f:SetScript("OnUpdate",onUpdate)
local _G = _G
local unpack = unpack

if (not ImprovedBlizzFrame.config.combattext) then
    return
end

------- Combat Text
local ASCT_X_POSITION = 0
local ASCT_Y_POSITION = -200

local size = 18


-- true/false 로 켜고 끕니다.
local CombatTextHighlightDB = {
	-- 공통 버프
	["<고대의 격분> 사라짐"] = true, -- 야수특성 사냥꾼 소환수
	["<고대의 격분>"] = true,
	["<고통 억제> 사라짐"] = true, -- 수양특성 사제
	["<고통 억제>"] = true,
	["<마력 주입> 사라짐"] = true, -- 수양특성 사제
	["<마력 주입>"] = true,
	["<속임수 거래> 사라짐"] = true, -- 도적
	["<속임수 거래>"] = true,
	["<수호 영혼> 사라짐"] = true, -- 신성특성 사제
	["<수호 영혼>"] = true,
	["<시간 왜곡> 사라짐"] = true, -- 마법사
	["<시간 왜곡>"] = true,
	["<신의 권능: 방벽> 사라짐"] = true, -- 수양특성 사제
	["<신의 권능: 방벽>"] = true,
	["<영웅심> 사라짐"] = true, -- 얼라이언스 주술사
	["<영웅심>"] = true,
	["<오라 숙련> 사라짐"] = true, -- 신성특성 성기사
	["<오라 숙련>"] = true,
	["<천상의 수호자> 사라짐"] = true, -- 보호특성 성기사
	["<천상의 수호자>"] = true,
	["<피의 욕망> 사라짐"] = true, -- 호드 주술사
	["<피의 욕망>"] = true,
	["<희생의 손길> 사라짐"] = true, -- 성기사
	["<희생의 손길>"] = true,

	-- 일반 이벤트
	[ENTERING_COMBAT] = true,
	[LEAVING_COMBAT] = true,
	[HEALTH_LOW] = true,
	[MANA_LOW] = true,
};


local CombatTextIgnoreDB = {
	-- 무시할 이벤트의 이름 CombatTextHighlightDB 보다 우선적으로 적용하여 무시리스트에 등록된건 CombatTextHighlightDB에 등록되어있더라도 안나온다
	["<test> 사라짐"] = true,
};


local CombatText_AddMessage_Org;

local function combatText_AddMessage(message, scrollFunction, r, g, b, displayType, isStaggered)
	if CombatTextHighlightDB[message] then
		if not CombatTextIgnoreDB[message] then
			CombatText_AddMessage_Org(message, scrollFunction, r, g, b, "crit", isStaggered);
		end
	else
		if not CombatTextIgnoreDB[message] then
			CombatText_AddMessage_Org(message, scrollFunction, r, g, b, displayType, isStaggered);
		end
	end
end

function onCombatTextMOD_Event(self, event, arg1)

	local bShowHeal = nil
	
	if event == "PLAYER_ENTERING_WORLD" then--or event == "ACTIVE_TALENT_GROUP_CHANGED"then
		if not CombatText_AddMessage_Org then 
			--print(event.." - Not CombatText_AddMessage_Org ")
			CombatText_AddMessage_Org = CombatText_AddMessage;
			CombatText_AddMessage = combatText_AddMessage;
			--hooksecurefunc("CombatText_AddMessage", combatText_AddMessage);
		end	
		
		if CombatText_UpdateDisplayedMessages then
			CombatTextFont:SetFont("Fonts\\2002.ttf",size,"OUTLINE")
			--CombatTextFont:SetFont("Fonts\\K_Damage.TTF",size,"OUTLINE")
			CombatTextFont:SetShadowOffset(1.25, -1.25)
			CombatTextFont:SetShadowColor(0, 0, 0)
			--CombatTextFont:SetShadowOffset(2, -2);
			--CombatTextFont:SetShadowColor(0, 0, 0);
			COMBAT_TEXT_HEIGHT = size;
			COMBAT_TEXT_CRIT_MAXHEIGHT = floor(size * 3.6); -- 2.4
			COMBAT_TEXT_CRIT_MINHEIGHT = floor(size * 2); -- 1.2
			
			--local masteryIndex = GetPrimaryTalentTree();

			--if (masteryIndex == nil) then
			--	bShowHeal = 1

			--else
			--	local id, name = GetTalentTabInfo(masteryIndex);

			--	if (name == "1" or name == "2" or name == "3" or name == "4") then
			--		ChatFrame1:AddMessage(name.."HIDE COMBAT TEXT.")
			--		bShowHeal = nil
			--	else
			--		bShowHeal = 1
			--	end
			--end

			--COMBAT_TEXT_TYPE_INFO["HEAL_CRIT"] = {r = 0.1, g = 1, b = 0.1, show = bShowHeal};
			--COMBAT_TEXT_TYPE_INFO["HEAL"] = {r = 0.1, g = 1, b = 0.1, show = bShowHeal};
			--COMBAT_TEXT_TYPE_INFO["PERIODIC_HEAL_ABSORB"] = {r = 0.1, g = 1, b = 0.1, show = bShowHeal};
			--COMBAT_TEXT_TYPE_INFO["HEAL_CRIT_ABSORB"] = {r = 0.1, g = 1, b = 0.1, show = bShowHeal};
			--COMBAT_TEXT_TYPE_INFO["HEAL_ABSORB"] = {r = 0.1, g = 1, b = 0.1, show = bShowHeal};
			--COMBAT_TEXT_TYPE_INFO["PERIODIC_HEAL"] = {r = 0.1, g = 1, b = 0.1, show = bShowHeal};
			
			--도트힐 찍지않음
			COMBAT_TEXT_TYPE_INFO["PERIODIC_HEAL"].show= ImprovedBlizzFrame.combattext.SHOW_PERIODIC_HEAL;
			--COMBAT_TEXT_TYPE_INFO["PERIODIC_HEAL_ABSORB"] = {r = 0.1, g = 1, b = 0.1, show = bShowHeal};
			--COMBAT_TEXT_TYPE_INFO["PERIODIC_HEAL"] = {r = 0.1, g = 1, b = 0.1, show = bShowHeal};
			
			hooksecurefunc("CombatText_UpdateDisplayedMessages", ASCT_UpdateDisplayedMessages);
			
			ASCT_UpdateDisplayedMessages()
			
		end
		return;
	end
end 

function ASCT_UpdateDisplayedMessages()

  if ( COMBAT_TEXT_FLOAT_MODE == "1" ) then
    COMBAT_TEXT_SCROLL_FUNCTION = CombatText_StandardScroll;
    COMBAT_TEXT_LOCATIONS = {
      startX = ASCT_X_POSITION,
      startY = 460 * COMBAT_TEXT_Y_SCALE,
	  --startY = 384 * COMBAT_TEXT_Y_SCALE,
      endX = ASCT_X_POSITION,
      endY = 650 * COMBAT_TEXT_Y_SCALE
	  --endY = 609 * COMBAT_TEXT_Y_SCALE
    };

  elseif ( COMBAT_TEXT_FLOAT_MODE == "2" ) then
    COMBAT_TEXT_SCROLL_FUNCTION = CombatText_StandardScroll;
    COMBAT_TEXT_LOCATIONS = {
      startX = ASCT_X_POSITION,
      startY = 340 * COMBAT_TEXT_Y_SCALE,
	  --startY = 384 * COMBAT_TEXT_Y_SCALE,
      endX = ASCT_X_POSITION,
      endY =  140 * COMBAT_TEXT_Y_SCALE
	  --endY =  159 * COMBAT_TEXT_Y_SCALE
    };
  else
    COMBAT_TEXT_SCROLL_FUNCTION = CombatText_FountainScroll;
    COMBAT_TEXT_LOCATIONS = {
      startX = ASCT_X_POSITION,
      startY = 460 * COMBAT_TEXT_Y_SCALE,
	  --startY = 384 * COMBAT_TEXT_Y_SCALE,
      endX = ASCT_X_POSITION,
      endY = 650 * COMBAT_TEXT_Y_SCALE
	  --endY = 609 * COMBAT_TEXT_Y_SCALE
    };
  end
  CombatText_ClearAnimationList();
end

CombatTextFrame = CreateFrame("Frame", nil, UIParent)
CombatTextFrame :RegisterEvent("PLAYER_ENTERING_WORLD")
--CombatTextFrame :RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED")
CombatTextFrame :RegisterEvent("PLAYER_LOGIN")
CombatTextFrame :SetScript("OnEvent", onCombatTextMOD_Event)

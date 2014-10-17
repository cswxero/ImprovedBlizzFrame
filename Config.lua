ImprovedBlizzFrame = {}

ImprovedBlizzFrame.config = {
	combattext = true,					-- 전투메세지 변경 활성유무
	MyDebuffLargetMOD = true,			-- 대상, 주시창의 내가걸은 디버프 크기 수정 활성유무
	Arena_PVPDiminish = true,			-- 적대적인 대상의 점감리셋 표시 유무
	Arena_CombatChecker = false,		-- 대상이나 주시대상이 전투중인지 아닌지 표시
	ClassColor = true,					-- 플레이어 프레임, 대상, 보스프레임등의 체력바에 직업별 색상을 표시
	HealthPersent = true,				-- 대상, 보스프레임등에 체력을 %로 표현하는 기능
	
	xArena_Portrait = true,				-- Player, Target, Focus 프레임의 초상화에 Potrait기능 추가
	xArena_Portrait_BlizRaidFrame = true,-- 블리자드 기본 레이드 프레임에 포트레이트 추가(위의 기능이 꺼져있으면 동작하지 않습니다.)
	xArena_Portrait_ArenaFrame = true,	-- ArenaFrame의 Potrait기능 On off
	xArena_Losecontrol = false,			-- 본인에게 걸린 제어불가 상태 표시
	xArena_PVPTrinkets = false,			-- 이름표에 계급장 표시
}

--기본 프레임의 크기수정관련
ImprovedBlizzFrame.scale = { -- 기본값은 1
	player = 1.1, 			-- 플레이어 프레임
	target = 1.1, 			-- 대상 프레임
	focus = 1.1, 			-- 주시대상 프레임
	boss = 1.00, 			-- 보스 프레임
	FocusSpellBar = 1.3,	-- 주시대상 시전바
	TargetSpellBar = 1.3,	-- 대상 시전바
}

--Lose Contorol 기능의 옵션
ImprovedBlizzFrame.LoseControlPos = {
	PosX = -0,	--X좌표(중앙기준)
	PosY = 110,	--Y좌표(중앙기준 -아래 +위)
	PosY = 0,	--Y좌표(중앙기준 -아래 +위)
	Size = 46,	--크기
	interval = 5,	--아이콘사이의 크기
}

--포트레이트 기능에서 부가적인 기능
ImprovedBlizzFrame.Arena_Potrait = {
	RaidFrameAlpha = 0.7,	--레이드프레임의 알파값(투명도 - 1.0이 젤진하게 0이 완전투명)
	RaidFrameSize = 28,		--레이드프레임 상태의 아이콘 크기 기본이 32
}

ImprovedBlizzFrame.combattext = {
	SHOW_PERIODIC_HEAL = true;	-- 전투메세지 도트힐의 표시여부
}


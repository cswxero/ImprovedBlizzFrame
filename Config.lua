IBFC = {}

IBFC.config = {
	MyDebuffLargetMOD = true,			-- 대상, 주시창의 내가걸은 디버프 크기 수정 활성유무
	ClassColor = true,					-- 플레이어 프레임, 대상, 보스프레임등의 체력바에 직업별 색상을 표시
	HealthPersent = true,				-- 대상, 보스프레임등에 체력을 %로 표현하는 기능

	Portrait = true,					-- 내프레임/대상/주시프레임/펫프레임 켜기/끄기
	ArenaFrames = true,					-- 블리자드 기본 투기장프레임에 포트레이트 추가
	BlizzardRaidFrame = true,			-- 블리자드 기본 레이드 프레임에 포트레이트 추가
	NamePlateTinker = false,			--이름표에 급장표시
	NamePlateDiminish = true,			--이름표에 점감표시
	NamePlateDiminishCommonIcon = true, --이름표에 점감표시시 점감별 공통스킬아이콘을 쓸지를 결정
	NamePlateCooldown = false,
	NamePlateZzal = false,
	NamePlateCooldown_ARENA = false,
}

--기본 프레임의 크기수정관련
IBFC.scale = { -- 기본값은 1
	player = 1.1, 			-- 플레이어 프레임
	target = 1.1, 			-- 대상 프레임
	focus = 1.1, 			-- 주시대상 프레임
	boss = 1.00, 			-- 보스 프레임
	FocusSpellBar = 1.3,	-- 주시대상 시전바
	TargetSpellBar = 1.3,	-- 대상 시전바
}

--포트레이트 기능에서 부가적인 기능
IBFC.Arena_Potrait = {
	RaidFrameAlpha = 0.7,	--레이드프레임의 알파값(투명도 - 1.0이 젤진하게 0이 완전투명)
	RaidFrameSize = 28,		--레이드프레임 상태의 아이콘 크기 기본이 32
}

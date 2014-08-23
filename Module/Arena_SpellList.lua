PVPSpellList_new={
	--가장 우선적으로 피해야하는것
	[88611] = {spellID = 88611, filter="DEBUFF", absID = false, Priority = 11 },	--연막
	[140023] = {spellID = 140023, filter="DEBUFF", absID = true, Priority = 11 },	--평화의 고리 침묵 디버프
	--immunitys
	[33786] = {spellID = 33786, filter="DEBUFF", absID = false, Priority = 11 },	--회오리
	--때리면 안되는것
	[122470] = {spellID = 122470, filter="DEBUFF", absID = false, Priority = 11 },	--수도사 업보의 손아귀
	
	-- stuns
	[1833] = {spellID = 1833, filter="DEBUFF", absID = false, Priority = 10 },	--비습
	[408] = {spellID = 408, filter="DEBUFF", absID = false, Priority = 10 },	--급가
	[132168] = {spellID = 46968, filter="DEBUFF", absID = false, Priority = 10 },	--충격파
	[853] = {spellID = 853, filter="DEBUFF", absID = false, Priority = 10 },	--심망
	[105593] = {spellID = 105593, filter="DEBUFF", absID = false, Priority = 10 }, --심판의 주먹 (추가 성기사 6초기절)
	[44572] = {spellID = 44572, filter="DEBUFF", absID = false, Priority = 10 },	--동결
	[5211] = {spellID = 5211, filter="DEBUFF", absID = false, Priority = 10 },	--곰스턴(거센강타)
	[30283] = {spellID = 30283, filter="DEBUFF", absID = false, Priority = 10 },	--어둠의 격노
	[89766] = {spellID = 89766, filter="DEBUFF", absID = false, Priority = 10 },	--도끼던지기
	[9005] = {spellID = 9005, filter="DEBUFF", absID = false, Priority = 10 },	--암습
	[91800] = {spellID = 91800, filter="DEBUFF", absID = false, Priority = 10 },	--굴스턴
	[91797] = {spellID = 91797, filter="DEBUFF", absID = false, Priority = 10 },	--굴변신스턴
	[88625] = {spellID = 88625, filter="DEBUFF", absID = false, Priority = 10 },	--신사스턴
	[90337] = {spellID = 90337, filter="DEBUFF", absID = false, Priority = 10 },	--원숭이실명	
	[102795] = {spellID = 102795, filter="DEBUFF", absID = false, Priority = 10 },	--격한 포옹(곰스턴)
	[119381] = {spellID = 119381, filter="DEBUFF", absID = false, Priority = 10 }, --수도사 스턴
	[113953] = {spellID = 113953, filter="DEBUFF", absID = false, Priority = 10 }, --마비독 5중첩시 4초간 스턴(MOP - 도적신규)
	[118271] = {spellID = 118271, filter="DEBUFF", absID = false, Priority = 10 },	--발화 충격(발화 스턴)
	[115001] = {spellID = 115001, filter="DEBUFF", absID = true, Priority = 10}, --냉혹한 겨울(MOP - 죽기 90렙 스킬)
	[22570] = {spellID = 22570, filter="DEBUFF", absID = true, Priority = 10}, 	--무력화
	[120086] = {spellID = 120086, filter="DEBUFF", absID = false, Priority = 10 },	--분노의 주먹(수도사 - 디버프랑 버프랑 확인해야됨)
	[118905] = {spellID = 118905, filter="DEBUFF", absID = false, Priority = 10 },	--전하 충격(술사스턴)
	[132169] = {spellID = 132169, filter="DEBUFF", absID = false, Priority = 10 },	--스톰볼트(전사 90렙특성)
	[20549] = {spellID = 20549, filter="DEBUFF", absID = false, Priority = 10 },	--타우렌 쿵쿵따
	[50519] = {spellID = 50519, filter="DEBUFF", absID = false, Priority = 10 }, -- Sonic Blast (Bat)
	[56626] = {spellID = 56626, filter="DEBUFF", absID = false, Priority = 10 }, -- Sting (Wasp)
	--[113656] = {spellID = 113656, filter="DEBUFF", absID = false, Priority = 10 }, -- 분노의 주먹
	[119072] = {spellID = 119072, filter="DEBUFF", absID = false, Priority = 10 },	-- 신의 격노
	[22703] = {spellID = 22703, filter="DEBUFF", absID = false, Priority = 10 }, -- Infernal Awakening (Infernal)
	
--특수공포	
	[24394] = {spellID = 24394, filter="DEBUFF", absID = true, Priority = 9 },	--위협(사냥꾼펫)
	
	[137143] = {spellID = 137143, filter="DEBUFF", absID = true, Priority = 9 },	--핏빛 두려움
	[111397] = {spellID = 111397, filter="BUFF", absID = true, Priority = 9 },	--핏빛 두려움
	[64044] = {spellID = 64044, filter="DEBUFF", absID = false, Priority = 9 },	--정신적 두려움
	[6789] = {spellID = 6789, filter="DEBUFF", absID = false, Priority = 9 },	--죽고
	[31661] = {spellID = 31661, filter="DEBUFF", absID = false, Priority = 9 },	--용숨
--특수스턴	
	[7922] = {spellID = 7922, filter="DEBUFF", absID = false, Priority = 9 }, 	--돌진 스턴
	
	-- cc	
	[19503] = {spellID = 19503, filter="DEBUFF", absID = false, Priority = 8 },	--산탄사격	
	[118] = {spellID = 118, filter="DEBUFF", absID = false, Priority = 8 },	--변이
	[61305] = {spellID = 61305, filter="DEBUFF", absID = false, Priority = 8 },	--변이
	[28272] = {spellID = 28272, filter="DEBUFF", absID = false, Priority = 8 },	--변이
	[61721] = {spellID = 61721, filter="DEBUFF", absID = false, Priority = 8 },	--변이
	[61780] = {spellID = 61780, filter="DEBUFF", absID = false, Priority = 8 },	--변이
	[28271] = {spellID = 28271, filter="DEBUFF", absID = false, Priority = 8 },	--변이
	
	[82691] = {spellID = 82691, filter="DEBUFF", absID = false, Priority = 8 },	--서리고리
	[6770] = {spellID = 6770, filter="DEBUFF", absID = false, Priority = 8 },	--혼절
	[3355] = {spellID = 3355, filter="DEBUFF", absID = false, Priority = 8 },	--빙결의 덫
	[20066] = {spellID = 20066, filter="DEBUFF", absID = false, Priority = 8 },	--참회
	[51514] = {spellID = 51514, filter="DEBUFF", absID = false, Priority = 8 },	--헥스
	[2094] = {spellID = 2094, filter="DEBUFF", absID = false, Priority = 8 },	--실명
	[5246] = {spellID = 5246, filter="DEBUFF", absID = false, Priority = 8 },	--위협의 외침
	[8122] = {spellID = 8122, filter="DEBUFF", absID = false, Priority = 8 },	--영절
	[5484] = {spellID = 5484, filter="DEBUFF", absID = false, Priority = 8 },	--공울
	[118699] = {spellID = 118699, filter="DEBUFF", absID = false, Priority = 8 },	--공포
	[145067] = {spellID = 145067, filter="DEBUFF", absID = false, Priority = 8 },	--악령퇴치
	[5782] = {spellID = 5782, filter="DEBUFF", absID = false, Priority = 8 },	--공포
	[130616] = {spellID = 130616, filter="DEBUFF", absID = false, Priority = 8 },	--공포
	[6358] = {spellID = 6358, filter="DEBUFF", absID = false, Priority = 8 },	--현혹
	[10326] = {spellID = 10326, filter="DEBUFF", absID = false, Priority = 8 },	--악령퇴치
	[115268] = {spellID = 115268, filter="DEBUFF", absID = false, Priority = 8 }, --최면(흑마법사 MOP 추가)
	[102051] = {spellID = 102051, filter="DEBUFF", absID = false, Priority = 8 }, --서리투성이 턱(마법사 MOP 추가)
	[113792] = {spellID = 113792, filter="DEBUFF", absID = false, Priority = 8 }, --영혼의 공포 (추가 사제 6초공포)
	[96201] = {spellID = 96201, filter="DEBUFF", absID = false, Priority = 8 }, --거미줄 감싸기 (추가 사냥꾼 3초기절)
	[105421] = {spellID = 105421, filter="DEBUFF", absID = false, Priority = 8 }, --눈부신 빛(기사 실명)
	[99] = {spellID = 99, filter="DEBUFF", absID = false, Priority = 8 }, 	--혼란의 포효(야드 MOP 추가)
	[107079] = {spellID = 107079, filter="DEBUFF", absID = false, Priority = 8 }, --전율의 장풍(판다렌 MOP 추가)		
	[2637] = {spellID = 2637, filter="DEBUFF", absID = false, Priority = 8 },	--겨울잠
	[1513] = {spellID = 1513, filter="DEBUFF", absID = false, Priority = 8 },	--야수겁주기
	[119392] = {spellID = 119392, filter="DEBUFF", absID = false, Priority = 8 },	--황소쇄도(수도사)
	[122242] = {spellID = 122242, filter="DEBUFF", absID = false, Priority = 8 },	--충돌(수도사)
	[104045] = {spellID = 104045, filter="DEBUFF", absID = false, Priority = 8 },	--수면(흑마탈태)
	[19386] = {spellID = 19386, filter="DEBUFF", absID = false, Priority = 8 }, -- Wyvern Sting
	[115078] = {spellID = 115078, filter="DEBUFF", absID = false, Priority = 8 }, -- Paralysis(수도사 마비)
	[9484] = {spellID = 9484, filter="DEBUFF", absID = false, Priority = 8 }, -- Shackle Undead
	[1776] = {spellID = 1776, filter="DEBUFF", absID = false, Priority = 8 },	--후려
	[117526] = {spellID = 117526, filter="DEBUFF", absID = false, Priority = 8 },	--구속의 사격
		
	-- silences
	[28730] = {spellID = 28730, filter="DEBUFF", absID = false, Priority = 7 },	--비전격류
	[18498] = {spellID = 18498, filter="DEBUFF", absID = false, Priority = 7 },	--입막음
	[47476] = {spellID = 47476, filter="DEBUFF", absID = false, Priority = 7 },	--질식
	[34490] = {spellID = 34490, filter="DEBUFF", absID = false, Priority = 7 },	--침사
	[147362] = {spellID = 147362, filter="DEBUFF", absID = false, Priority = 7 },	--반격의 사격
	[1330] = {spellID = 1330, filter="DEBUFF", absID = false, Priority = 7 },	--목졸
	[55021] = {spellID = 55021, filter="DEBUFF", absID = false, Priority = 7 },	--법사깡마
	[24259] = {spellID = 24259, filter="DEBUFF", absID = false, Priority = 7 },	--똥개깡마
	[15487] = {spellID = 15487, filter="DEBUFF", absID = false, Priority = 7 },	--암사침묵
	[115782] = {spellID = 115782, filter="DEBUFF", absID = false, Priority = 7 },	--mop 업글 똥개 흑마 펫 침묵
	[108194] = {spellID = 108194, filter="DEBUFF", absID = false, Priority = 7 }, --MOP 어둠의 질식
	[31117] = {spellID = 31117, filter="DEBUFF", absID = false, Priority = 7 }, --MOP 불안정한 고통 해제
	
	[81261] = {spellID = 81261, filter="DEBUFF", absID = false, Priority = 7 },	--태양 광선
	[78675] = {spellID = 78675, filter="DEBUFF", absID = false, Priority = 7 },	--태양 광선
	
	[44957] = {spellID = 44957, filter="DEBUFF", absID = false, Priority = 7 },	--황천의 충격(사냥꾼 펫)
	[116709] = {spellID = 116709, filter="DEBUFF", absID = false, Priority = 7 },	--손날찌르기(수도사)
	[114238] = {spellID = 114238, filter="DEBUFF", absID = false, Priority = 7 }, -- 요불침묵
	[50479] = {spellID = 50479, filter="DEBUFF", absID = false, Priority = 7 }, -- Nether Shock (Nether ray)
	[31935] = {spellID = 31935, filter="DEBUFF", absID = false, Priority = 7 }, -- Avenger's Shield
	
	--무장해제
	[676] = {spellID = 676, filter="DEBUFF", absID = false, Priority = 6 },	--무장 해제
	[51722] = {spellID = 51722, filter="DEBUFF", absID = false, Priority = 6 },	--장비 분해
	[64058] = {spellID = 64058, filter="DEBUFF", absID = false, Priority = 6 },	--Psychic Horror(disarm part)
	[117368] = {spellID = 117368, filter="DEBUFF", absID = false, Priority = 6 },	--Grapple Weapon(수도사 무기뺏기 - 원거리 장분)

	--무적
	[642] = {spellID = 642, filter="BUFF", absID = false, Priority = 5 },	--천상의 보호막
	[45438] = {spellID = 45438, filter="BUFF", absID = false, Priority = 5 },	--얼음 방패
		
	--반무적
	[19263] = {spellID = 19263, filter="BUFF", absID = false, Priority = 4 },	--공격 저지
	[148467] = {spellID = 148467, filter="BUFF", absID = false, Priority = 4 },	--공격 저지
	[1022] = {spellID = 1022, filter="BUFF", absID = false, Priority = 4 },	--보호의 손길
	[1044] = {spellID = 1044, filter="BUFF", absID = false, Priority = 4 },	--자유의 손길
	[110913] = {spellID = 110913, filter="BUFF", absID = false, Priority = 4 }, --어둠의 거래(흑마법사 MOP )
	[132413] = {spellID = 132413, filter="BUFF", absID = false, Priority = 4 }, --어둠의 보루(흑마법사 MOP )
	[31224] = {spellID = 31224, filter="BUFF", absID = false, Priority = 4 },	--그림자 망토
	
	--침묵면역
	[31821] = {spellID = 31821, filter="BUFF", absID = false, Priority = 3 },	--오라 숙련
	[104773] = {spellID = 104773, filter="BUFF", absID = false, Priority = 3 }, --영원한 결의(흑마법사 MOP )
	[89485 ] = {spellID = 89485 , filter="BUFF", absID = false, Priority = 3 },	--내집문양
	
	--매즈면역	
	[48707] = {spellID = 48707, filter="BUFF", absID = false, Priority = 2 },	--대마보
	[49039] = {spellID = 49039, filter="BUFF", absID = false, Priority = 2 },	--리치의 혼
	[19574] = {spellID = 19574, filter="BUFF", absID = false, Priority = 2 },	--야수의 격노(MOP 추가)\
	[115018] = {spellID = 115018, filter="BUFF", absID = false, Priority = 2 }, --더럽혀진 대지
	[137562] = {spellID = 137562, filter="BUFF", absID = true, Priority = 2 }, --수도사 민활주
	
	--데미지 추가 or 데미지
	[107574] = {spellID = 107574, filter="BUFF", absID = false, Priority = 1 },	--투신(전사 90렙 특성 투신)
	[51713] = {spellID = 51713, filter="BUFF", absID = false, Priority = 1 },	--어둠의 춤
	[46924] = {spellID = 46924, filter="BUFF", absID = false, Priority = 1 },	--칼날 폭풍
	[31884] = {spellID = 31884, filter="BUFF", absID = false, Priority = 1 }, 	--응징의 격노
	[1719] = {spellID = 1719, filter="BUFF", absID = false, Priority = 1 },	--무희	
	
	--데미지 감소
	[6940] = {spellID = 6940, filter="BUFF", absID = false, Priority = 1 },	--희생의 손길
	[30823] = {spellID = 30823, filter="BUFF", absID = false, Priority = 1 },	--주술의 분노
	[33206] = {spellID = 33206, filter="BUFF", absID = false, Priority = 1 },	--고통 억제
	[47585] = {spellID = 47585, filter="BUFF", absID = false, Priority = 1 },	--분산
	[871] = {spellID = 871, filter="BUFF", absID = false, Priority = 1 },	--방벽
	[498] = {spellID = 498, filter="BUFF", absID = false, Priority = 1 },	--신의 가호
	[48792] = {spellID = 48792, filter="BUFF", absID = false, Priority = 1 },	--얼음같은 인내력
	[61336] = {spellID = 61336, filter="BUFF", absID = false, Priority = 1 },	--생존 본능
	[5277] = {spellID = 5277, filter="BUFF", absID = false, Priority = 1 },	--회피
	[47788] = {spellID = 47788, filter="BUFF", absID = false, Priority = 1 },	--수호 영혼
	[74001] = {spellID = 74001, filter="BUFF", absID = true, Priority = 1 },	--전투준비(도적 기존스킬인데 MOP때 추가함)
	[53271] = {spellID = 53271, filter="BUFF", absID = false, Priority = 1 },	--주인의 부름(사냥꾼 기존스킬인데 MOP때 추가함)
	[53480] = {spellID = 53480, filter="BUFF", absID = false, Priority = 1 },	--희생의 포효(사냥꾼 기존스킬인데 MOP때 추가함)
	[118038] = {spellID = 118038, filter="BUFF", absID = false, Priority = 1 }, --투사의 혼(전사 8초무기막기100% 2분쿨 MOP때 추가함)
	[116849] = {spellID = 116849, filter="BUFF", absID = false, Priority = 1 },	--수도사 기의 고치
	[122464] = {spellID = 122464, filter="BUFF", absID = false, Priority = 1 },	--수도사 비물질화
	[108271] = {spellID = 108271, filter="BUFF", absID = false, Priority = 1 },	--주술사 영혼 이동
	[122783] = {spellID = 122783, filter="BUFF", absID = false, Priority = 1 }, --수도사 마법 해소 
	[122278] = {spellID = 122278, filter="BUFF", absID = false, Priority = 1 }, --수도사 해악 감퇴
	
	--기타
	[23920] = {spellID = 23920, filter="BUFF", absID = false, Priority = 1 },	--주문 반사
	[114028] = {spellID = 114028, filter="BUFF", absID = false, Priority = 1 },	--대규모 주문반사
	[114018] = {spellID = 114018, filter="BUFF", absID = false, Priority = 1 }, --은폐의 장막(은신-MOP-도적)
	[77606] = {spellID = 77606, filter="DEBUFF", absID = false, Priority = 1 },	--어둠복제
	[130735] = {spellID = 130735, filter="DEBUFF", absID = false, Priority = 1 }, -- 영혼 쐐기
	
--------------------------------------------------------------------------------------------
	
	[23333] = {spellID = 23333, filter="BUFF", absID = true, Priority = 1 }, --얼라이언스 깃발
	[23335] = {spellID = 23335, filter="BUFF", absID = true, Priority = 1 }, --호드 깃발
};

PVPSpellList={
	--가장 우선적으로 피해야하는것
	{spellID = 88611, filter="DEBUFF", absID = false, Priority = 11 },	--연막탄
	{spellID = 140023, filter="DEBUFF", absID = true, Priority = 11 },	--평화의 고리 침묵 디버프
	--immunitys
	{spellID = 33786, filter="DEBUFF", absID = false, Priority = 11 },	--회오리
	--때리면 안되는것
	{spellID = 122470, filter="DEBUFF", absID = false, Priority = 11 },	--수도사 업보의 손아귀
	
	-- stuns
	{spellID = 1833, filter="DEBUFF", absID = false, Priority = 10 },	--비습
	{spellID = 408, filter="DEBUFF", absID = false, Priority = 10 },	--급가
	{spellID = 46968, filter="DEBUFF", absID = false, Priority = 10 },	--충격파
	{spellID = 853, filter="DEBUFF", absID = false, Priority = 10 },	--심망
	{spellID = 105593, filter="DEBUFF", absID = false, Priority = 10 }, --심판의 주먹 (추가 성기사 6초기절)
	{spellID = 44572, filter="DEBUFF", absID = false, Priority = 10 },	--동결
	{spellID = 5211, filter="DEBUFF", absID = false, Priority = 10 },	--곰스턴(거센강타)
	{spellID = 30283, filter="DEBUFF", absID = false, Priority = 10 },	--어둠의 격노
	{spellID = 89766, filter="DEBUFF", absID = false, Priority = 10 },	--도끼던지기
	{spellID = 9005, filter="DEBUFF", absID = false, Priority = 10 },	--암습
	{spellID = 47481, filter="DEBUFF", absID = false, Priority = 10 },	--굴스턴
	{spellID = 88625, filter="DEBUFF", absID = false, Priority = 10 },	--신사스턴
	{spellID = 90337, filter="DEBUFF", absID = false, Priority = 10 },	--원숭이실명
	{spellID = 91797, filter="DEBUFF", absID = false, Priority = 10 },	--굴변신스턴
	{spellID = 102795, filter="DEBUFF", absID = false, Priority = 10 },	--격한 포옹(곰스턴)
	{spellID = 119381, filter="DEBUFF", absID = false, Priority = 10 }, --수도사 스턴
	{spellID = 113953, filter="DEBUFF", absID = false, Priority = 10 }, --마비독 5중첩시 4초간 스턴(MOP - 도적신규)
	{spellID = 118271, filter="DEBUFF", absID = false, Priority = 10 },	--발화 충격(발화 스턴)
	{spellID = 115001, filter="DEBUFF", absID = true, Priority = 10}, --냉혹한 겨울(MOP - 죽기 90렙 스킬)
	{spellID = 22570, filter="DEBUFF", absID = true, Priority = 10}, 	--무력화
	{spellID = 120086, filter="DEBUFF", absID = false, Priority = 10 },	--분노의 주먹(수도사 - 디버프랑 버프랑 확인해야됨)
	{spellID = 118905, filter="DEBUFF", absID = false, Priority = 10 },	--전하 충격(술사스턴)
	{spellID = 132169, filter="DEBUFF", absID = false, Priority = 10 },	--스톰볼트(전사 90렙특성)
	{spellID = 20549, filter="DEBUFF", absID = false, Priority = 10 },	--타우렌 쿵쿵따
	{spellID = 50519, filter="DEBUFF", absID = false, Priority = 10 }, -- Sonic Blast (Bat)
	{spellID = 56626, filter="DEBUFF", absID = false, Priority = 10 }, -- Sting (Wasp)
	{spellID = 113656, filter="DEBUFF", absID = false, Priority = 10 }, -- 분노의 주먹
	{spellID = 119072, filter="DEBUFF", absID = false, Priority = 10 },	-- 신의 격노
	{spellID = 22703, filter="DEBUFF", absID = false, Priority = 10 }, -- Infernal Awakening (Infernal)
	
--특수공포	
	{spellID = 24394, filter="DEBUFF", absID = true, Priority = 9 },	--위협(사냥꾼펫)
	
	{spellID = 137143, filter="DEBUFF", absID = true, Priority = 9 },	--핏빛 두려움
	{spellID = 111397, filter="BUFF", absID = true, Priority = 9 },	--핏빛 두려움

--특수스턴	
	{spellID = 7922, filter="DEBUFF", absID = false, Priority = 9 }, 	--돌진 스턴
--	{spellID = 85387, filter="DEBUFF", absID = false },  --재앙의 여파(흑마법사 MOP 신규스턴 - 점감이 다름)
	
	-- cc
	{spellID = 64044, filter="DEBUFF", absID = false, Priority = 8 },	--정신적 두려움
	{spellID = 6789, filter="DEBUFF", absID = false, Priority = 8 },	--죽고
	{spellID = 19503, filter="DEBUFF", absID = false, Priority = 8 },	--산탄사격
	{spellID = 31661, filter="DEBUFF", absID = false, Priority = 8 },	--용숨
	{spellID = 118, filter="DEBUFF", absID = false, Priority = 8 },	--변이
	{spellID = 82691, filter="DEBUFF", absID = false, Priority = 8 },	--서리고리
	{spellID = 6770, filter="DEBUFF", absID = false, Priority = 8 },	--혼절
	{spellID = 3355, filter="DEBUFF", absID = false, Priority = 8 },	--빙결의 덫
	{spellID = 20066, filter="DEBUFF", absID = false, Priority = 8 },	--참회
	{spellID = 51514, filter="DEBUFF", absID = false, Priority = 8 },	--헥스
	{spellID = 2094, filter="DEBUFF", absID = false, Priority = 8 },	--실명
	{spellID = 5246, filter="DEBUFF", absID = false, Priority = 8 },	--위협의 외침
	{spellID = 8122, filter="DEBUFF", absID = false, Priority = 8 },	--영절
	{spellID = 5484, filter="DEBUFF", absID = false, Priority = 8 },	--공울
	{spellID = 5782, filter="DEBUFF", absID = false, Priority = 8 },	--공포
	{spellID = 6358, filter="DEBUFF", absID = false, Priority = 8 },	--현혹
	{spellID = 10326, filter="DEBUFF", absID = false, Priority = 8 },	--악령퇴치
	{spellID = 115268, filter="DEBUFF", absID = false, Priority = 8 }, --최면(흑마법사 MOP 추가)
	{spellID = 102051, filter="DEBUFF", absID = false, Priority = 8 }, --서리투성이 턱(마법사 MOP 추가)
	{spellID = 113792, filter="DEBUFF", absID = false, Priority = 8 }, --영혼의 공포 (추가 사제 6초공포)
	{spellID = 96201, filter="DEBUFF", absID = false, Priority = 8 }, --거미줄 감싸기 (추가 사냥꾼 3초기절)
	{spellID = 105421, filter="DEBUFF", absID = false, Priority = 8 }, --눈부신 빛(기사 실명)
	{spellID = 99, filter="DEBUFF", absID = false, Priority = 8 }, 	--혼란의 포효(야드 MOP 추가)
	{spellID = 107079, filter="DEBUFF", absID = false, Priority = 8 }, --전율의 장풍(판다렌 MOP 추가)		
	{spellID = 2637, filter="DEBUFF", absID = false, Priority = 8 },	--겨울잠
	{spellID = 1513, filter="DEBUFF", absID = false, Priority = 8 },	--야수겁주기
	{spellID = 119392, filter="DEBUFF", absID = false, Priority = 8 },	--황소쇄도(수도사)
	{spellID = 122242, filter="DEBUFF", absID = false, Priority = 8 },	--충돌(수도사)
	{spellID = 104045, filter="DEBUFF", absID = false, Priority = 8 },	--수면(흑마탈태)
	{spellID = 19386, filter="DEBUFF", absID = false, Priority = 8 }, -- Wyvern Sting
	{spellID = 115078, filter="DEBUFF", absID = false, Priority = 8 }, -- Paralysis(수도사 마비)
	{spellID = 9484, filter="DEBUFF", absID = false, Priority = 8 }, -- Shackle Undead
	{spellID = 1776, filter="DEBUFF", absID = false, Priority = 8 },	--후려
	{spellID = 117526, filter="DEBUFF", absID = false, Priority = 8 },	--구속의 사격
		
	-- silences
	{spellID = 28730, filter="DEBUFF", absID = false, Priority = 7 },	--비전격류
	{spellID = 18498, filter="DEBUFF", absID = false, Priority = 7 },	--입막음
	{spellID = 47476, filter="DEBUFF", absID = false, Priority = 7 },	--질식
	{spellID = 34490, filter="DEBUFF", absID = false, Priority = 7 },	--침사
	{spellID = 147362, filter="DEBUFF", absID = false, Priority = 7 },	--반격의 사격
	{spellID = 1330, filter="DEBUFF", absID = false, Priority = 7 },	--목졸
	{spellID = 55021, filter="DEBUFF", absID = false, Priority = 7 },	--법사깡마
	{spellID = 24259, filter="DEBUFF", absID = false, Priority = 7 },	--똥개깡마
	{spellID = 15487, filter="DEBUFF", absID = false, Priority = 7 },	--암사침묵
	{spellID = 115782, filter="DEBUFF", absID = false, Priority = 7 },	--mop 업글 똥개 흑마 펫 침묵
	{spellID = 108194, filter="DEBUFF", absID = false, Priority = 7 }, --MOP 어둠의 질식
	{spellID = 78675, filter="DEBUFF", absID = false, Priority = 7 },	--태양 광선
	{spellID = 44957, filter="DEBUFF", absID = false, Priority = 7 },	--황천의 충격(사냥꾼 펫)
	{spellID = 116709, filter="DEBUFF", absID = false, Priority = 7 },	--손날찌르기(수도사)
	{spellID = 114238, filter="DEBUFF", absID = false, Priority = 7 }, -- 요불침묵
	{spellID = 50479, filter="DEBUFF", absID = false, Priority = 7 }, -- Nether Shock (Nether ray)
	{spellID = 31935, filter="DEBUFF", absID = false, Priority = 7 }, -- Avenger's Shield
	
	--무장해제
	{spellID = 676, filter="DEBUFF", absID = false, Priority = 6 },	--무장 해제
	{spellID = 51722, filter="DEBUFF", absID = false, Priority = 6 },	--장비 분해
	{spellID = 64058, filter="DEBUFF", absID = false, Priority = 6 },	--Psychic Horror(disarm part)
	{spellID = 117368, filter="DEBUFF", absID = false, Priority = 6 },	--Grapple Weapon(수도사 무기뺏기 - 원거리 장분)


	--무적
	{spellID = 642, filter="BUFF", absID = false, Priority = 4 },	--천상의 보호막
	{spellID = 45438, filter="BUFF", absID = false, Priority = 4 },	--얼음 방패
		
	--반무적
	{spellID = 19263, filter="BUFF", absID = false, Priority = 4 },	--공격 저지
	{spellID = 1022, filter="BUFF", absID = false, Priority = 4 },	--보호의 손길
	{spellID = 1044, filter="BUFF", absID = false, Priority = 4 },	--자유의 손길
	{spellID = 110913, filter="BUFF", absID = false, Priority = 4 }, --어둠의 거래(흑마법사 MOP )
	{spellID = 132413, filter="BUFF", absID = false, Priority = 4 }, --어둠의 보루(흑마법사 MOP )
	{spellID = 31224, filter="BUFF", absID = false, Priority = 4 },	--그림자 망토
	
	--침묵면역
	{spellID = 31821, filter="BUFF", absID = false, Priority = 3 },	--오라 숙련
	{spellID = 104773, filter="BUFF", absID = false, Priority = 3 }, --영원한 결의(흑마법사 MOP )
	{spellID = 96267, filter="BUFF", absID = false, Priority = 3 },	--내집문양
	
	--매즈면역	
	{spellID = 48707, filter="BUFF", absID = false, Priority = 2 },	--대마보
	{spellID = 49039, filter="BUFF", absID = false, Priority = 2 },	--리치의 혼
	{spellID = 19574, filter="BUFF", absID = false, Priority = 2 },	--야수의 격노(MOP 추가)\
	{spellID = 115018, filter="BUFF", absID = false, Priority = 2 }, --더럽혀진 대지
	{spellID = 137562, filter="BUFF", absID = true, Priority = 2 }, --수도사 민활주
	
	--데미지 추가 or 데미지
	{spellID = 107574, filter="BUFF", absID = false, Priority = 1 },	--투신(전사 90렙 특성 투신)
	{spellID = 51713, filter="BUFF", absID = false, Priority = 1 },	--어둠의 춤
	{spellID = 46924, filter="BUFF", absID = false, Priority = 1 },	--칼날 폭풍
	{spellID = 31884, filter="BUFF", absID = false, Priority = 1 }, 	--응징의 격노
	{spellID = 1719, filter="BUFF", absID = false, Priority = 1 },	--무희	
	
	--데미지 감소
	{spellID = 6940, filter="BUFF", absID = false, Priority = 1 },	--희생의 손길
	{spellID = 30823, filter="BUFF", absID = false, Priority = 1 },	--주술의 분노
	{spellID = 33206, filter="BUFF", absID = false, Priority = 1 },	--고통 억제
	{spellID = 47585, filter="BUFF", absID = false, Priority = 1 },	--분산
	{spellID = 871, filter="BUFF", absID = false, Priority = 1 },	--방벽
	{spellID = 498, filter="BUFF", absID = false, Priority = 1 },	--신의 가호
	{spellID = 48792, filter="BUFF", absID = false, Priority = 1 },	--얼음같은 인내력
	{spellID = 61336, filter="BUFF", absID = false, Priority = 1 },	--생존 본능
	{spellID = 5277, filter="BUFF", absID = false, Priority = 1 },	--회피
	{spellID = 47788, filter="BUFF", absID = false, Priority = 1 },	--수호 영혼
	{spellID = 74001, filter="BUFF", absID = true, Priority = 1 },	--전투준비(도적 기존스킬인데 MOP때 추가함)
	{spellID = 53271, filter="BUFF", absID = false, Priority = 1 },	--주인의 부름(사냥꾼 기존스킬인데 MOP때 추가함)
	{spellID = 53480, filter="BUFF", absID = false, Priority = 1 },	--희생의 포효(사냥꾼 기존스킬인데 MOP때 추가함)
	{spellID = 118038, filter="BUFF", absID = false, Priority = 1 }, --투사의 혼(전사 8초무기막기100% 2분쿨 MOP때 추가함)
	{spellID = 116849, filter="BUFF", absID = false, Priority = 1 },	--수도사 기의 고치
	{spellID = 122464, filter="BUFF", absID = false, Priority = 1 },	--수도사 비물질화
	{spellID = 108271, filter="BUFF", absID = false, Priority = 1 },	--주술사 영혼 이동
	{spellID = 122783, filter="BUFF", absID = false, Priority = 1 }, --수도사 마법 해소 
	{spellID = 122278, filter="BUFF", absID = false, Priority = 1 }, --수도사 해악 감퇴
	
	--기타
	{spellID = 23920, filter="BUFF", absID = false, Priority = 1 },	--주문 반사
	{spellID = 114028, filter="BUFF", absID = false, Priority = 1 },	--대규모 주문반사
	{spellID = 114018, filter="BUFF", absID = false, Priority = 1 }, --은폐의 장막(은신-MOP-도적)
	{spellID = 77606, filter="DEBUFF", absID = false, Priority = 1 },	--어둠복제
	{spellID = 130735, filter="DEBUFF", absID = false, Priority = 1 }, -- 영혼 쐐기
	
--------------------------------------------------------------------------------------------
	
	{spellID = 23333, filter="BUFF", absID = true, Priority = 1 }, --얼라이언스 깃발
	{spellID = 23335, filter="BUFF", absID = true, Priority = 1 }, --호드 깃발
};

--ICICLE 스킬리스트
RESET_MAP={
		[14185] = { -- Rogue: Preparation
			2983,  -- Sprint	
			1856,  -- Vanish
			5277, -- Evasion
			51722, -- Dismantle (XXX only with Preparation Glyph)
--			31224, -- 그망(이제 초기화 시키지않음)
		},
		[11958] = { -- Mage: Cold Snap
			45438, -- Ice Block
			122,   -- Frost Nova
			--냉기돌풍 추가해야함
		},
		[108285] = { -- 주술사 토템
			8177,
			8143,
			108269,
			--축전토템 추가해야함
		}
	}
	
COOLDOWN_MAP={
	--공통
	[59752] = 120, --"인간의 자생력" (인간 종족 특성)
	[42292] = 120, --"계급장"
	[7744] = 120, --"포세이큰의 의지",

	--죽음의 기사 소환수
	[91797] = 60, --"무시무시한 일격" (변신 구울 물어뜯기)
	[91800] = 60, --"물어뜯기"

	--흑마법사 소환수
	[19647] = 24, --"주문 잠금" (지옥 사냥개 주문 잠금) 
	[115781] = 24, --"안구 광선" (감시자 주문 잠금)
	[89808] = 10, --"마법 태우기" (임프 마법 삼키기)
	[115276] = 10, --"마법 불태우기" (지옥 임프 마법 삼키기)
	[6360] = 25, --"채찍질" (서큐 넉백)
	[115770] = 25, --"지옥칼날" (쉬바라 넉백)
	[89766] = 30, --"도끼 던지기" (Stun)

	--죽음의 기사
	[47476] = 60, --"질식시키기"
	[108194] = 60, --"어둠의 질식"
	[48707] = 45, --"대마법 보호막"
	[49576] = 25, --"죽음의 손길",
	[47528] = 15, --"정신 얼리기" (문양 13초)
	[48792] = 180, --"얼음같은 인내력" (문양 90초)

	--드루이드
	[78675] = 60, --"태양 광선"
	[80964] = 15, --"두개골 강타"
	[80965] = 15, --"두개골 강타"
	[5211] = 50, --"거센 강타"

	--사냥꾼
	[19263] = 120, --"공격 저지" (특성 60초)
	[19503] = 30, --"산탄 사격"
	[53271] = 45, --"주인의 부름"
	[34490] = 24, --"침묵의 사격"
	[19574] = 60, --"야수의 격노"
	[781] = 25, --"철수"
	[23989] = 300, --"만반의 준비"
	[109304] = 120, --"활기"
	[147362] = 24, --"반격의 사격"
		
	--마법사
	[2139] = 20, --"마법 차단" (12시즌 입으면 20초)
	[119308] =24, --"마법 차단" (문양)
	[1953] = 15, --"점멸"
	[119415] = 15, --"점멸" (문양)
	[31661] = 20, --"용의 숨결"
	[45438] = 300, --"얼음 방패"
	[11958] = 180, --"매서운 한파"
	[44572] = 30, --"동결"

	--성기사
	[1044] = 25, --"자유의 손길"
	[853] = 60, --"심판의 망치"
	[96231] = 15, --"비난" (문양20초)
	[642] = 300, --"천상의 보호막"
	[31821] = 180, --"헌신의 오라"
	[105593] = 30, --"심판의 주먹"

	--사제
	[64044] = 45, --"정신적 두려움" (문양 35초)
	[8122] = 30, --"영혼의 절규"
	[108921] = 30, --"영혼의 마귀"
	[15487] = 45, --"침묵"
	[47585] = 120, --"분산" (문양 105초)
	[6346] = 180, --"공포의 수호물" (문양 120초)
	[89485] = 45, --"내면의 집중력"
	[586] = 30, --"소실"
	[108920] = 30, --"공허의 촉수"
	[605] = 30, --"정신 지배"

	--도적
	[1766] = 15, --"발차기", (문양 성공11초 실패19초)
	[31224] = 60, --"그림자 망토"
	[36554] = 20, --"그림자 밟기"
	[76577] = 180, --"연막탄"
	[408] = 20, --"급소 가격"
	[14185] = 300, --"마음가짐"

	--주술사
	[98008] = 180, --"정신의 고리 토템"
	[8177] = 25, --"마법흡수 토템" (복술 대격변셋만 22초)
	[57994] = 12, --"날카로운 바람"
	[30823] = 60, --"주술의 분노"
	[51490] = 45, --"천둥폭풍" (문양 35초)
	[8143] = 60, --"진동의 토템"
	[108269] = 45, --"축전 토템"
	[51514] = 45, --"사술" (문양 35초)
	[108285] = 180, --"원소의 부름"

	--흑마법사
	[30283] = 30, --"어둠의 격노",
	[5484] = 40, --"공포의 울부짖음",
	[6789] = 45, --"죽음의 고리",
	[108482] =60, --"해방된 의지",
	[111397]= 10, --"피의 공포",
	[48020]= 30, --"악마의 마법진: 순간이동",
	[103967]= 12, --"흡혈박쥐 떼",
	[104773]= 180, --"영원한 결의",

	--전사
	[6552] = 15, --"자루 공격",
	[23920] = 20, --"주문 반사", (문양 15초)
	[114028]= 60, --"대규모 주문 반사",
	[46968]= 20,  --"충격파",
	[107574]= 180, --"투신",
	[57755]= 30, --"영웅의 투척",
	[6544]= 45, --"영웅의 도약", (문양 30초)
	[102060] = 45, --"훼방의 외침",
	[107570] = 30, -- 폭풍 망치(2.0추가)
}

--점감 테이블
GRA_MAP={}
--스턴류
GRA_MAP[1]=
	{
		-- Death Knight(완)
		108194, -- Asphyxiate (talent)(어둠의 질식)
		91800, --47481, -- Gnaw (Ghoul) (굴강타)
		91797, --improve ghoul (강화 굴강타)
		-- Druid(완)
		22570, -- Maim(드루 무력화)
		5211, -- Mighty Bash (talent)
		9005, -- 암습??		102546, -- Pounce
		-- Hunter
		24394, --19577, -- Intimidation
		90337, -- Bad Manner (Monkey)
		50519, -- Sonic Blast (Bat)
		56626, -- Sting (Wasp)
		-- Mage(완)
		44572, -- Deep Freeze(동결)
		118271, --11129, -- Combustion (Fire)(충돌스턴)
		-- Monk
		119392, -- Charging Ox Wave (talent)
		119381, -- Leg Sweep (talent)
		122057, -- Clash (Brewmaster)
		113656, -- Fists of Fury (Windwalker)
		-- Paladin(완)
		853, -- Hammer of Justice(심망)
		119072, -- Holy Wrath (Protection)
		105593, -- Fist of Justice (talent)(심판의주먹)
		-- Priest(완)
		88625, -- Holy Word: Chastise
		-- Rogue(완)
		1833, -- Cheap Shot(비습)
		408, -- Kidney Shot(급가)
		-- Shaman(완)
		118905,--108269, -- Capacitor Totem
		-- Warlock(완)
		30283, -- Shadowfury
		89766, -- Axe Toss (Felguard)
		22703, -- Infernal Awakening (Infernal)
		-- Warrior(완)
		--132168,--46968, -- Shockwave
		46968, -- ShockWave(2.5에 잘못된거같아서 수정)
		--107570,-- 폭풍 망치(2.0추가)
		132169, -- 폭풍 망치
		-- Tauren(완)
		20549, -- War Stomp
	}
--변이류
GRA_MAP[2]=
	{
		-- Druid
		2637, -- Hibernate
		99, -- Disorienting Roar (talent)
		-- Hunter(완)
		3355, -- Freezing Trap
		19386, -- Wyvern Sting
		-- Mage
		118, -- Polymorph
		28272, -- Polymorph (pig)
		28271, -- Polymorph (turtle)
		61305, -- Polymorph (black cat)
		61025, -- Polymorph (serpent) -- FIXME: gone ?
		61721, -- Polymorph (rabbit)
		61780, -- Polymorph (turkey)
		82691, -- Ring of Frost
		-- Monk
		115078, -- Paralysis
		-- Paladin
		105421, -- --115750, -- Blinding Light(기사 실명)
		20066, -- Repentance
		-- Priest
		9484, -- Shackle Undead
		-- Rogue(완)
		1776, -- Gouge
		6770, -- Sap
		-- Shaman(완)
		51514, -- Hex
		-- Pandaren
		107079, -- Quaking Palm
	}
--공포류
GRA_MAP[3]=
	{
		-- Hunter
		1513, -- Scare Beast
		-- Paladin
		10326, -- Turn Evil
		-- Priest(완)
		8122, -- Psychic Scream
		113792, -- 펫공포()
		-- [] = "fear", -- Psyfiend Fear (ID ?)
		-- Rogue(완)
		2094, -- Blind
		-- Warlock(완)
		118699, --		5782, -- Fear (Warlock)
		5484, -- Howl of Terror
		6358, -- Seduction (Succubus)
		115268, -- Seduction (improve Succubus)
		104045,	-- 탈태 수면
		-- Warrior(완)
		5246, -- Intimidating Shout (main target)
		20511, -- Intimidating Shout (secondary targets)
	}
--침묵류
GRA_MAP[4]=
	{
		-- Death Knight(완)
		47476, -- Strangulate(질식)
		-- Druid(완)
		78675, -- Solar Beam
		81261, -- Solar Beam -- FIXME: check id
		114238, -- 요불침묵
		-- Hunter
		34490, -- Silencing Shot
		50479, -- Nether Shock (Nether ray)
		-- Mage(완)
		55021, --12598, -- Improved Counterspell
		102051, -- Frostjaw (talent)
		-- Paladin
		31935, -- Avenger's Shield
		-- Priest(완)
		15487, -- Silence
		-- Rogue(완)
		1330, -- Garrote(목졸)
		-- Warlock(완)
		115782, --103135, -- Spell Lock (Felhunter-improve)
		24259, 	-- Spell Lock (Felhunter)
		-- Warrior(완)
		18498, -- Glyph of Gag Order -- FIXME: check id
		-- Blood Elf(완)
		25046, -- Arcane Torrent (Energy version)
		28730, -- Arcane Torrent (Mana version)
		50613, -- Arcane Torrent (Runic power version)
		69179, -- Arcane Torrent (Rage version)
		80483, -- Arcane Torrent (Focus version)
		147362, -- 반격의 사격
	}
GRA_MAP[5]=
	{
		122,   -- 얼음 회오리 
		33395, -- 얼리기
	}
	
UA_localized = GetSpellInfo(31117)	-- MOP Unstable Affliction 
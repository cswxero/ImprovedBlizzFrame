ImprovedBlizzFrame = {}

ImprovedBlizzFrame.config = {
	combattext = true,					-- �����޼��� ���� Ȱ������
	MyDebuffLargetMOD = true,			-- ���, �ֽ�â�� �������� ����� ũ�� ���� Ȱ������
	Arena_PVPDiminish = true,			-- �������� ����� �������� ǥ�� ����
	Arena_CombatChecker = false,		-- ����̳� �ֽô���� ���������� �ƴ��� ǥ��
	ClassColor = true,					-- �÷��̾� ������, ���, ���������ӵ��� ü�¹ٿ� ������ ������ ǥ��
	HealthPersent = true,				-- ���, ���������ӵ ü���� %�� ǥ���ϴ� ���
	
	xArena_Portrait = true,				-- Player, Target, Focus �������� �ʻ�ȭ�� Potrait��� �߰�
	xArena_Portrait_BlizRaidFrame = true,-- ���ڵ� �⺻ ���̵� �����ӿ� ��Ʈ����Ʈ �߰�(���� ����� ���������� �������� �ʽ��ϴ�.)
	xArena_Portrait_ArenaFrame = true,	-- ArenaFrame�� Potrait��� On off
	xArena_Losecontrol = false,			-- ���ο��� �ɸ� ����Ұ� ���� ǥ��
	xArena_PVPTrinkets = false,			-- �̸�ǥ�� ����� ǥ��
}

--�⺻ �������� ũ���������
ImprovedBlizzFrame.scale = { -- �⺻���� 1
	player = 1.1, 			-- �÷��̾� ������
	target = 1.1, 			-- ��� ������
	focus = 1.1, 			-- �ֽô�� ������
	boss = 1.00, 			-- ���� ������
	FocusSpellBar = 1.3,	-- �ֽô�� ������
	TargetSpellBar = 1.3,	-- ��� ������
}

--Lose Contorol ����� �ɼ�
ImprovedBlizzFrame.LoseControlPos = {
	PosX = -0,	--X��ǥ(�߾ӱ���)
	PosY = 110,	--Y��ǥ(�߾ӱ��� -�Ʒ� +��)
	PosY = 0,	--Y��ǥ(�߾ӱ��� -�Ʒ� +��)
	Size = 46,	--ũ��
	interval = 5,	--�����ܻ����� ũ��
}

--��Ʈ����Ʈ ��ɿ��� �ΰ����� ���
ImprovedBlizzFrame.Arena_Potrait = {
	RaidFrameAlpha = 0.7,	--���̵��������� ���İ�(���� - 1.0�� �����ϰ� 0�� ��������)
	RaidFrameSize = 28,		--���̵������� ������ ������ ũ�� �⺻�� 32
}

ImprovedBlizzFrame.combattext = {
	SHOW_PERIODIC_HEAL = true;	-- �����޼��� ��Ʈ���� ǥ�ÿ���
}


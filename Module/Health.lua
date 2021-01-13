if (not IBFC.config.HealthPersent) then
    return
end

local thT = TargetFrameTextureFrame:CreateFontString("CatTargettargetHealthText", "OVERLAY", "NumberFontNormalHuge");
local font, size = thT:GetFont()
thT:SetFont(font, size-7,"OUTLINE");
thT:SetPoint("RIGHT", "TargetFrameHealthBar", "LEFT", 0, 0);

local fhT = FocusFrameTextureFrame:CreateFontString("CatTargetfocusHealthText", "OVERLAY", "NumberFontNormalHuge");
fhT:SetFont(font, size-7,"OUTLINE");
fhT:SetPoint("RIGHT", "FocusFrameHealthBar", "LEFT");

local b1hT = Boss1TargetFrame:CreateFontString("CatTargetboss1HealthText", "OVERLAY", "NumberFontNormalHuge");
b1hT:SetFont(font, size-7,"OUTLINE");
b1hT:SetPoint("RIGHT", "Boss1TargetFrameHealthBar", "LEFT");
local b2hT = Boss2TargetFrame:CreateFontString("CatTargetboss2HealthText", "OVERLAY", "NumberFontNormalHuge");
b2hT:SetFont(font, size-7,"OUTLINE");
b2hT:SetPoint("RIGHT", "Boss2TargetFrameHealthBar", "LEFT");
local b3hT = Boss3TargetFrame:CreateFontString("CatTargetboss3HealthText", "OVERLAY", "NumberFontNormalHuge");
b3hT:SetFont(font, size-7,"OUTLINE");
b3hT:SetPoint("RIGHT", "Boss3TargetFrameHealthBar", "LEFT");
local b4hT = Boss4TargetFrame:CreateFontString("CatTargetboss4HealthText", "OVERLAY", "NumberFontNormalHuge");
b4hT:SetFont(font, size-7,"OUTLINE");
b4hT:SetPoint("RIGHT", "Boss4TargetFrameHealthBar", "LEFT");
local b5hT = Boss5TargetFrame:CreateFontString("CatTargetboss5HealthText", "OVERLAY", "NumberFontNormalHuge");
b5hT:SetFont(font, size-7,"OUTLINE");
b5hT:SetPoint("RIGHT", "Boss5TargetFrameHealthBar", "LEFT");


local COLOR = {
	[0] = "|cffff0000",
	[1] = "|cffff3300",
	[2] = "|cffff6600",
	[3] = "|cffff9900",
	[4] = "|cffffcc00",
	[5] = "|cffffff00",
	[6] = "|cffccff00",
	[7] = "|cff99ff00",
	[8] = "|cff66ff00",
	[9] = "|cff33ff00",
	[10] = "|cff00ff00",
};

local function health(self, value, text)
	local h = value / select(2, self:GetMinMaxValues());
	if (h > 0.99) or (h == 0) then
		text:SetText("");
	else
		text:SetText(COLOR[ceil(h * 10)]..ceil(h * 100).."%");
	end
end


TargetFrameHealthBar:HookScript("OnValueChanged", function(self, value) health(self, value, thT) end);
FocusFrameHealthBar:HookScript("OnValueChanged", function(self, value) health(self, value, fhT) end);

Boss1TargetFrameHealthBar:HookScript("OnValueChanged", function(self, value) health(self, value, b1hT) end);
Boss2TargetFrameHealthBar:HookScript("OnValueChanged", function(self, value) health(self, value, b2hT) end);
Boss3TargetFrameHealthBar:HookScript("OnValueChanged", function(self, value) health(self, value, b3hT) end);
Boss4TargetFrameHealthBar:HookScript("OnValueChanged", function(self, value) health(self, value, b4hT) end);

--PlayerFrame:UnregisterEvent("UNIT_COMBAT")
--PetFrame:UnregisterEvent("UNIT_COMBAT")

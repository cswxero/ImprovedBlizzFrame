if (not IBFC.config.MyDebuffLargetMOD) then
    return
end

local LARGE_AURA_SIZE = 27; -- default = 21
local SMALL_AURA_SIZE = 17; -- default = 17
local AURA_ROW_WIDTH = 122;
local AURA_OFFSET_Y = 3;


local function targetFrame_UpdateAuraPositions(self, auraName, numAuras, numOppositeAuras, largeAuraList, updateFunc, maxRowWidth, offsetX, mirrorAurasVertically)
	local size;
	local offsetY = AURA_OFFSET_Y;
	local rowWidth = 0;
	local firstBuffOnRow = 1;
	if (maxRowWidth ~= 80) then maxRowWidth = AURA_ROW_WIDTH end
	for i=1, numAuras do
		if largeAuraList[i] then
			size = LARGE_AURA_SIZE;
			offsetY = AURA_OFFSET_Y + AURA_OFFSET_Y;
		else
			size = SMALL_AURA_SIZE;
		end

		if (i == 1) then
			rowWidth = size;
		else
			rowWidth = rowWidth + size + offsetX;
		end
		if (rowWidth > maxRowWidth) then
			updateFunc(self, auraName, i, numOppositeAuras, firstBuffOnRow, size, offsetX, offsetY, mirrorAurasVertically);
			rowWidth = size;
			firstBuffOnRow = i;
			offsetY = AURA_OFFSET_Y;
		else
			updateFunc(self, auraName, i, numOppositeAuras, i - 1, size, offsetX, offsetY, mirrorAurasVertically);
		end
	end
end
hooksecurefunc("TargetFrame_UpdateAuraPositions", targetFrame_UpdateAuraPositions);

TargetFrameToT:SetPoint("BOTTOMRIGHT", -11, -10);
FocusFrameToT:SetPoint("BOTTOMRIGHT", -11, -10);

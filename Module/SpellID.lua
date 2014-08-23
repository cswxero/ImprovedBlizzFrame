﻿--SpellID for Gametooltip
--툴팁에 스펠ID를 표시해줌

hooksecurefunc(GameTooltip, "SetUnitBuff", function(self,...)
	local id = select(11,UnitBuff(...))
	if id then
		self:AddDoubleLine("주문ID:",id)
		self:Show()
	end
end)

hooksecurefunc(GameTooltip, "SetUnitDebuff", function(self,...)
	local id = select(11,UnitDebuff(...))
	if id then
		self:AddDoubleLine("주문ID:",id)
		self:Show()
	end
end)

hooksecurefunc(GameTooltip, "SetUnitAura", function(self,...)
	local id = select(11,UnitAura(...))
	if id then
		self:AddDoubleLine("주문ID:",id)
		self:Show()
	end
end)

hooksecurefunc("SetItemRef", function(link, text, button, chatFrame)
	if string.find(link,"^spell:") then
		local id = string.sub(link,7)
		ItemRefTooltip:AddDoubleLine("주문ID:",id)
		ItemRefTooltip:Show()
	end
end)

GameTooltip:HookScript("OnTooltipSetSpell", function(self)local id = select(3,self:GetSpell())
	if id then
		self:AddDoubleLine("주문ID:",id)
		self:Show()
	end
end)
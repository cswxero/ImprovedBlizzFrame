	local _G = _G
	local unpack = unpack

	PlayerFrame:SetScale(IBFC.scale.player)
	TargetFrame:SetScale(IBFC.scale.target)
	FocusFrame:SetScale(IBFC.scale.focus)
	FocusFrameSpellBar:SetScale(IBFC.scale.FocusSpellBar)
	TargetFrameSpellBar:SetScale(IBFC.scale.TargetSpellBar)

	local function onEvent(self, event, arg1)
		if (event == "PLAYER_ENTERING_WORLD") then
			print("ImprovedBlizzFrameCompact Loaded By Azshara_kr - |cffDA70D6Lapresisz");
			self:UnregisterEvent(event);
		end
	end
	
	local ibfCore = CreateFrame("Frame");
	ibfCore:SetScript("OnEvent", onEvent);
	ibfCore:RegisterEvent("PLAYER_ENTERING_WORLD");
	
	

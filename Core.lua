	local _G = _G
	local unpack = unpack

	PlayerFrame:SetScale(ImprovedBlizzFrame.scale.player)
	TargetFrame:SetScale(ImprovedBlizzFrame.scale.target)
	FocusFrame:SetScale(ImprovedBlizzFrame.scale.focus)
	FocusFrameSpellBar:SetScale(ImprovedBlizzFrame.scale.FocusSpellBar)
	TargetFrameSpellBar:SetScale(ImprovedBlizzFrame.scale.TargetSpellBar)

	-- 플레이어 프레임 엘리트로 변경
	--PlayerFrameTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Elite.blp") 

	local function onEvent(self, event, arg1)
		if (event == "ADDON_LOADED") then
			print("ImprovedBlizzFrame Core Loaded By Azshara_kr - |cffDA70D6Lapresis");
			self:UnregisterEvent(event);
		end
	end
	
	local ibfCore = CreateFrame("Frame");
	ibfCore:SetScript("OnEvent", onEvent);
	ibfCore:RegisterEvent("ADDON_LOADED");
	
	

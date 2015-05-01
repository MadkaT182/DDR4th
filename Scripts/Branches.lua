Branch.AfterInit = function()
	local coinMode = GAMESTATE:GetCoinMode()
	if coinMode == 'CoinMode_Home' then
		return "ScreenTitleMenu"
	else
		return "ScreenLogo"
	end
end

Branch.StartGame = function()
	return PREFSMAN:GetPreference("ShowCaution") and "ScreenCaution" or "ScreenSelectStyle"
end

hasChars = function()
	return CHARMAN:GetAllCharacters() ~= nil
end;

function ScreenNetSelectPlayMode()
	if IsNetSMOnline() then return SMOnlineScreen() end
	if IsNetConnected() then return "ScreenNetSelectMusic" end
	return "ScreenSelectMusic"
end;

Branch.AfterProfileLoad = function()
	-- if online, ignore character check and move straight to online
	if IsNetConnected() then ReportStyle() end;
	if IsNetSMOnline() or IsNetConnected() then
		GAMESTATE:ApplyGameCommand("playmode,regular");
		return ScreenNetSelectPlayMode()
	end

	return hasChars and "ScreenSelectCharacter" or "ScreenSelectMusic"
end

Branch.InformationPage = function()
	local nextScreen = getenv("NextInfoScreen");
	return nextScreen or "ScreenInformation"
end

Branch.AfterSMOLogin = SMOnlineScreen()
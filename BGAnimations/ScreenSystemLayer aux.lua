local function CreditsText( pn )
	function update(self)
		local str = ScreenSystemLayerHelpers.GetCreditsMessage(pn);
		self:settext(str);
	end

	function UpdateVisible(self,creditType)
		local screen = SCREENMAN:GetTopScreen();
		local bShow = true;
		if screen then
			local sClass = screen:GetName();
			bShow = THEME:GetMetric( sClass, "ShowCreditDisplay"..creditType );
		end

		self:visible( bShow );
	end

	-- todo: make this like my max2 theme
	local creditsFont = "ScreenSystemLayer credits normal"
	--[[
	local topScreenName = SCREENMAN:GetTopScreen():GetName()
	if topScreenName == "ScreenGameplay" or topScreenName == "ScreenDemonstration"
	or topScreenName == "ScreenHowToPlay" or topScreenName == "ScreenJukebox" then
		creditsFont = "_credits small";
	end
	--]]

	local text = LoadFont(creditsFont) .. {
		InitCommand=function(self)
			self:name("Credits" .. PlayerNumberToString(pn))
			ActorUtil.LoadAllCommandsAndSetXY(self,Var "LoadingScreen");
		end;
		UpdateTextCommand=function(self)
			local str = ScreenSystemLayerHelpers.GetCreditsMessage(pn);
			self:settext(str);
		end;
		UpdateVisibleCommand=function(self)
			local screen = SCREENMAN:GetTopScreen();
			local bShow = true;
			if screen then
				local sClass = screen:GetName();
				bShow = THEME:GetMetric( sClass, "ShowCreditDisplay" );
			end

			self:visible( bShow );
		end;
	};
	return text;
end

local t = Def.ActorFrame {
	CreditsText( PLAYER_1 );
	CreditsText( PLAYER_2 );
};
return t;
-- ScreenJukebox underlay: force characters
local t = Def.ActorFrame{
	InitCommand=function(self)
		if hasChars then -- only bother with this if characters are installed
			local curStyle = GAMESTATE:GetCurrentStyle();
			local styleType = curStyle:GetStyleType();
			local masterPlayer = GAMESTATE:GetMasterPlayerNumber()
			local randChar1 = CHARMAN:GetRandomCharacter():GetCharacterID()
			local randChar2 = CHARMAN:GetRandomCharacter():GetCharacterID()

			-- remove hoxx's alice because I hate seeing texture errors coming up
			-- all the time; FIX IT, DAMNIT. -f
			if randChar1 == "Alice [DDR X2 v.2]" then
				randChar1 = CHARMAN:GetRandomCharacter():GetCharacterID()
			end
			if randChar2 == "Alice [DDR X2 v.2]" then
				randChar2 = CHARMAN:GetRandomCharacter():GetCharacterID()
			end

			-- todo: 5th mix characters only (strict mode)

			-- set master player
			if masterPlayer == PLAYER_1 then
				GAMESTATE:SetCharacter(PLAYER_1,randChar1);
			elseif masterPlayer == PLAYER_2 then
				GAMESTATE:SetCharacter(PLAYER_2,randChar1);
			end;

			-- if the StyleType is two players, add the other player's character.
			if styleType == 'StyleType_TwoPlayersTwoSides'
			or styleType == 'StyleType_TwoPlayersSharedSides' then
				if masterPlayer == PLAYER_1 then
					GAMESTATE:SetCharacter(PLAYER_2,randChar2);
				elseif masterPlayer == PLAYER_2 then
					GAMESTATE:SetCharacter(PLAYER_1,randChar2);
				end;
			end;
		end
	end;
};

return t;
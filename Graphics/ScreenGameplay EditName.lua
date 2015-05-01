-- this is colored differently based on home/arcade:
local arcadeCmd = cmd(strokecolor,color("#003173");diffuse,color("#C6F700");diffusebottomedge,color("#6BBD6B"););
local homeCmd = cmd(strokecolor,color("#B51900");diffuse,color("#D6EF00");diffusebottomedge,color("#EFB500"););

local t = Def.ActorFrame{
	LoadFont("_greengrad 2x")..{
		InitCommand=GAMESTATE:GetCoinMode() == 'CoinMode_Home' and homeCmd or arcadeCmd;
		BeginCommand=function(self)
			local editName = "";
			-- if any player is playing an edit, show it.
			for pn in ivalues(GAMESTATE:GetHumanPlayers()) do
				local steps = GAMESTATE:GetCurrentSteps(pn)
				if steps:GetDifficulty() == 'Difficulty_Edit' then
					editName = steps:GetDescription();
				end
			end
			self:settext( string.format("[%-8s]",editName) )
		end;
	};
};

return t;
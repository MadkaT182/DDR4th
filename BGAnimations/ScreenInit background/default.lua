setenv("TitleChoice",1)

local card1Type = GAMESTATE:GetCoinMode() == 'CoinMode_Home' and "home" or "arcade"

local t = Def.ActorFrame{
	LoadActor("warning")..{
				InitCommand=cmd(Center;FullScreen);
				};
	
};
return t;
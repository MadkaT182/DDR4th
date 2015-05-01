setenv("TitleChoice",1)

local card1Type = GAMESTATE:GetCoinMode() == 'CoinMode_Home' and "home" or "arcade"

local t = Def.ActorFrame{
	LoadActor("1")..{
		InitCommand=cmd(Center;FullScreen;sleep,3.0;);
	};

local t = Def.ActorFrame{
	LoadActor("2")..{
		InitCommand=cmd(Center;FullScreen;sleep,3.0;);
	};
		
		};
	};
};
return t;
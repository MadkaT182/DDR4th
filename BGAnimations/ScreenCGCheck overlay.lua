-- ScreenCGCheck overlay
local t = Def.ActorFrame{
	LoadFont("_service")..{
		InitCommand=cmd(x,SCREEN_CENTER_X-11;y,SCREEN_CENTER_Y-181;uppercase,true;settext,"CG Check");
	};
	LoadFont("_service")..{
		InitCommand=cmd(x,SCREEN_CENTER_X+3;y,SCREEN_CENTER_Y+195;uppercase,true;settext,"Press 1P Start Button = Exit");
	};
};

return t;
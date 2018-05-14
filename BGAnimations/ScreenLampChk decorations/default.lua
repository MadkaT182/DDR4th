return Def.ActorFrame {
	LoadFont("_service")..{
		Text="LAMP CHECK";
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_TOP+59);
	};
	LoadFont("_service")..{
		Text="PRESS 1P LEFT/RIGHT BUTTON = SELECT LAMP";
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-49);
	};
	LoadFont("_service")..{
		Text="PRESS 1P START = DO CHECK";
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-33);
	};
};
return Def.ActorFrame {
	LoadFont("_service")..{
		Text="VIEW BOOKKEEPING INFORMATION";
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_TOP+55);
	};
	LoadFont("_service")..{
		Text="PRESS 1P LEFT/RIGHT = PREV/NEXT PAGE";
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-85);
	};
	LoadFont("_service")..{
		Text="PRESS 2P START BUTTON = DATA CLEAR";
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-53);
	};
	LoadFont("_service")..{
		Text="PRESS 1P START BUTTON = EXIT";
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-37);
	};
};
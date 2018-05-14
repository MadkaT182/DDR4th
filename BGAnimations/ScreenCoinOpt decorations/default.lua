return Def.ActorFrame {
	LoadFont("_service")..{
		Text="COIN OPTIONS";
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_TOP+59);
	};
	LoadFont("_service")..{
		Text="PRESS 1P LEFT/RIGHT = SELECT OPTION";
		InitCommand=cmd(x,SCREEN_CENTER_X-311;y,SCREEN_BOTTOM-49;horizalign,left);
	};
	LoadFont("_service")..{
		Text="PRESS 2P START BUTTON = MODIFY SETTING";
		InitCommand=cmd(x,SCREEN_CENTER_X-311;y,SCREEN_BOTTOM-33;horizalign,left);
	};
};
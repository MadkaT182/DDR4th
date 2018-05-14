return Def.ActorFrame {
	LoadFont("_service")..{
		Text="DIP SWITCH SETTINGS";
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_TOP+59);
	};
	LoadFont("_service")..{
		Text="SW   1  2  3  4";
		InitCommand=cmd(x,SCREEN_CENTER_X-177;y,SCREEN_CENTER_Y-153;horizalign,left);
	};
	LoadFont("_service")..{
		Text="'  '  '     OFF";
		InitCommand=cmd(x,SCREEN_CENTER_X-92;y,SCREEN_CENTER_Y-133;horizalign,left);
	};
	LoadFont("_service")..{
		Text="&  ON";
		InitCommand=cmd(x,SCREEN_CENTER_X+61;y,SCREEN_CENTER_Y-113;horizalign,left);
	};
	LoadFont("_service")..{
		Text="TO MODIFY SETTINGS, OPERATE\nTHE RELEVANT DIP SWITCH\nON THE PCB.";
		InitCommand=cmd(x,SCREEN_CENTER_X-225;y,SCREEN_TOP+168;horizalign,left);
	};
	LoadFont("_service")..{
		Text="SW1  NOT USE";
		InitCommand=cmd(x,SCREEN_CENTER_X-225;y,SCREEN_CENTER_Y-25;horizalign,left);
	};
	LoadFont("_service")..{
		Text="SW2  NOT USE";
		InitCommand=cmd(x,SCREEN_CENTER_X-225;y,SCREEN_CENTER_Y+23;horizalign,left);
	};
	LoadFont("_service")..{
		Text="SW3  NOT USE";
		InitCommand=cmd(x,SCREEN_CENTER_X-225;y,SCREEN_CENTER_Y+71;horizalign,left);
	};
	LoadFont("_service")..{
		Text="SW4  BOOT DEVICE";
		InitCommand=cmd(x,SCREEN_CENTER_X-225;y,SCREEN_CENTER_Y+119;horizalign,left);
	};
	LoadFont("_service")..{
		Text="FLASH-ROM";
		InitCommand=cmd(x,SCREEN_CENTER_X-140;y,SCREEN_CENTER_Y+139;horizalign,left);
	};
	LoadFont("_service")..{
		Text="PRESS 1P START BUTTON = EXIT";
		InitCommand=cmd(x,SCREEN_CENTER_X-27;y,SCREEN_BOTTOM-37);
	};
};
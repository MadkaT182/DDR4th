return Def.ActorFrame{
	LoadFont("_service")..{
		Text="ARE YOU SURE YOU WANT TO RESTORE SETTINGS?";
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_TOP+(SCREEN_WIDTH/4));
	};
};
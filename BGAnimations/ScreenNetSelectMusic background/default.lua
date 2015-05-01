return Def.ActorFrame{
	LoadActor("_online song bg")..{
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y+12);
	};
	LoadActor(THEME:GetPathB("ScreenSelectMusic","background/circles"))..{
		InitCommand=cmd(x,SCREEN_CENTER_X+140;y,SCREEN_CENTER_Y);
	};
};
local t = Def.ActorFrame{
	LoadActor("press_start")..{
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y+172);
		OnCommand=cmd(diffuseblink);
	};
};

return t;
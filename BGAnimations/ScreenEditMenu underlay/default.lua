return Def.ActorFrame{
	LoadActor("main")..{
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-96);
	};
	LoadActor("secondary")..{
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-20;draworder,100);
	};
};
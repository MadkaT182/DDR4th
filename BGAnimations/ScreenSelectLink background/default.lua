return Def.ActorFrame{
	LoadActor("_link bg")..{
		InitCommand=cmd(Center);
	};
	LoadActor("top_frame")..{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_TOP+27);
	};
	LoadActor("_title")..{
		InitCommand=cmd(x,SCREEN_CENTER_X+40;y,SCREEN_TOP+30);
	};
	LoadActor("left_frame")..{
		InitCommand=cmd(x,SCREEN_LEFT+158;y,SCREEN_TOP+169);
	};
	LoadActor("right_frame")..{
		InitCommand=cmd(x,SCREEN_RIGHT-24;y,SCREEN_TOP+279);
	};
	LoadActor("footer")..{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-18);
	};
};
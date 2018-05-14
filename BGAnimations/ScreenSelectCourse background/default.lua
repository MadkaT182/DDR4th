return Def.ActorFrame{
	LoadActor("_coursebg")..{
		InitCommand=cmd(Center);
	};
	LoadActor("header")..{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_TOP+38);
	};
	LoadActor("_title")..{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_TOP+37);
	};
	LoadActor("footer")..{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-18);
	};
};
return Def.ActorFrame {
	LoadActor( "starstrip" )..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+92);
	};
	LoadActor( "footer" )..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-18);
	};
};
local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame {
	LoadActor( "header" )..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_TOP+54);
	};
	LoadActor( "subheader" )..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_TOP+100);
	};
	LoadActor( "title" )..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_TOP+35);
	};
	LoadActor( "starstrip" )..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+92);
	};
	LoadActor( "footer" )..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-18);
	};
};

return t
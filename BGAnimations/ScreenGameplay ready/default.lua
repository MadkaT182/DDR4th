return Def.ActorFrame {
	LoadActor( "ready" )..{
		OnCommand=cmd(Center;diffusealpha,0;linear,0.5;diffusealpha,.5;sleep,0.5;linear,0.5;diffusealpha,0);
	};
	LoadActor( "ready" )..{
		OnCommand=cmd(x,SCREEN_CENTER_X+100;y,SCREEN_CENTER_Y-100;diffusealpha,0;linear,0.5;diffusealpha,.5;Center;sleep,0.5;linear,0.5;diffusealpha,0;x,SCREEN_CENTER_X-100;y,SCREEN_CENTER_Y-100);
	};
	LoadActor( "ready" )..{
		OnCommand=cmd(x,SCREEN_CENTER_X-100;y,SCREEN_CENTER_Y+100;diffusealpha,0;linear,0.5;diffusealpha,.5;Center;sleep,0.5;linear,0.5;diffusealpha,0;x,SCREEN_CENTER_X+100;y,SCREEN_CENTER_Y+100);
	};
}
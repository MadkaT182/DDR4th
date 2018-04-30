return Def.ActorFrame {
	LoadActor( "cleared" )..{
		OnCommand=cmd(Center;diffusealpha,0;sleep,.133;linear,.901;diffusealpha,1;sleep,1.835;linear,.668;diffusealpha,0;sleep,.9);
	};
	LoadActor( "../_stars/clearL" )..{
		OnCommand=cmd(x,-SCREEN_WIDTH;sleep,.133;linear,1.335;x,SCREEN_CENTER_X+302);
	};
	LoadActor( "../_stars/clearR" )..{
		OnCommand=cmd(x,SCREEN_WIDTH;sleep,.133;linear,1.335;x,(SCREEN_LEFT-SCREEN_WIDTH/2)-304);
	};
}
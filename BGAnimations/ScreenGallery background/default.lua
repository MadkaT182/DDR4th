return Def.ActorFrame{
	Def.Quad{
		InitCommand=cmd(Center;FullScreen;diffuse,color("0,0,0,1"));
	};
	LoadActor("_bgtile")..{
		InitCommand=cmd(CenterX;scaletofit,SCREEN_LEFT,SCREEN_TOP,SCREEN_RIGHT,SCREEN_BOTTOM;customtexturerect,0,0,9,10);
		OnCommand=cmd(texcoordvelocity,-0.375,-0.5);
	};
	Def.Quad{
		InitCommand=cmd(Center;FullScreen;diffuse,color("0,0,0,0.65"));
	};
	LoadActor("_gallery bg")..{
		InitCommand=cmd(Center);
	};
};
return Def.ActorFrame {
	LoadActor( "../logobg" )..{
		OnCommand=cmd(FullScreen);
	};
	Def.Quad{
		InitCommand=cmd(FullScreen;diffusecolor,color("#000000");diffusealpha,.8);
	};
	LoadActor("menuhelp")..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-63);
	};
}
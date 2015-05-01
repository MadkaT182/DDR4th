-- ScreenNetSelectMusic overlay
return Def.ActorFrame{
	Def.Quad{
		InitCommand=cmd(CenterX;y,SCREEN_TOP;valign,0;diffuse,color("0,0,0,1");zoomto,SCREEN_WIDTH,12;);
	};
};
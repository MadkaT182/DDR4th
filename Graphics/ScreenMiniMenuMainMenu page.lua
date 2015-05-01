local t = Def.ActorFrame{
	Def.Quad{
		InitCommand=cmd(zoomto,SCREEN_CENTER_X*0.8,SCREEN_HEIGHT*0.9;diffuse,color("0,0,0,0.5"));
	};
};

return t;
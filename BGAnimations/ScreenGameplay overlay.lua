local t = Def.ActorFrame{};

t[#t+1] = StandardDecorationFromFile( "LifeFrame", "LifeFrame" );
t[#t+1] = StandardDecorationFromFile( "ScoreFrame", "ScoreFrame" );

t[#t+1] = Def.ActorFrame{
	Name="Letterbox";
	InitCommand=cmd(CenterY;visible,false);
	Def.Quad{
		InitCommand=cmd(x,SCREEN_CENTER_X-320;halign,1;zoomto,107,SCREEN_HEIGHT;diffuse,color("0,0,0,1"));
	};
	Def.Quad{
		InitCommand=cmd(x,SCREEN_CENTER_X+320;halign,0;zoomto,107,SCREEN_HEIGHT;diffuse,color("0,0,0,1"));
	};
};

return t;
local outColor = color("#000000")

return Def.ActorFrame{
	Def.Quad{
		Name="LeftSide";
		InitCommand=cmd(x,SCREEN_CENTER_X-320;CenterY;diffuse,outColor;halign,1;zoomto,SCREEN_CENTER_X,SCREEN_HEIGHT);
	};
	Def.Quad{
		Name="RightSide";
		InitCommand=cmd(x,SCREEN_CENTER_X+320;CenterY;diffuse,outColor;halign,0;zoomto,SCREEN_CENTER_X,SCREEN_HEIGHT);
	};
	LoadActor("bg")..{ InitCommand=cmd(Center;); };
}
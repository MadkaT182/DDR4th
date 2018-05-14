local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(CenterY;fov,90);
	Def.Model{
		Name="LeftCube";
		Meshes="cube-model.txt",
		Materials="cubetex1.txt",
		Bones="cube-model.txt",
		InitCommand=cmd(x,SCREEN_CENTER_X*0.75;diffusealpha,0.5;zoom,0.25;zbuffer,true;zwrite,true);
		OnCommand=cmd(spin;effectmagnitude,60,0,60);
	};
	Def.Model{
		Name="RightCube";
		Meshes="cube-model.txt",
		Materials="cubetex2.txt",
		Bones="cube-model.txt",
		InitCommand=cmd(x,SCREEN_CENTER_X*1.25;zoom,0.25;ztest,false);
		OnCommand=cmd(spin;effectmagnitude,-60,0,-60);
	};
};

t[#t+1] = Def.ActorFrame {
	LoadFont("_service")..{
		Text="CG CHECK";
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_TOP+60);
	};
	LoadFont("_service")..{
		Text="PRESS 1P START BUTTON = EXIT";
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-45);
	};
};

return t
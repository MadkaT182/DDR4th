return Def.ActorFrame{
	Def.Quad{
		InitCommand=cmd(Center;FullScreen;diffuse,color("0,0,0,0"));
		OnCommand=cmd(linear,0.3;diffusealpha,1);
	};
	LoadActor(THEME:GetPathB("","_moveon"))..{
		InitCommand=cmd(Center;zoomy,0;diffuse,color("0,0,0,0"););
		OnCommand=cmd(linear,0.5;diffuse,color("1,1,1,1");zoomy,1);
	};
};
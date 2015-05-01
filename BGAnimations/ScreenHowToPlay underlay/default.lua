-- ScreenHowToPlay underlay
local t = Def.ActorFrame{
	LoadActor("_howtoplay")..{
		Name="HowToPlaySmall";
		InitCommand=cmd(x,SCREEN_CENTER_X-126;y,SCREEN_CENTER_Y-174;);
		OnCommand=cmd(hibernate,2);
	};

	Def.ActorFrame{
		InitCommand=cmd(fov,20);
		Def.Model{
			Name="DoublesPad";
			Meshes=GetCharAnimPath("DancePads.txt");
			--Materials=THEME:GetPathG("_pad","textures/DancePads.txt");
			Materials=THEME:GetPathG("_pad","textures/DancePads.txt");
			Bones=GetCharAnimPath("DancePads.txt");

			--Meshes=THEME:GetPathG("_pad","textures/DancePads.txt");
			--Materials=THEME:GetPathG("_pad","textures/DancePads.txt");
			--Bones=THEME:GetPathG("_pad","textures/DancePads.txt");
			InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y+165;zoom,15;rotationx,12.5;rotationy,180;cullmode,'CullMode_None';);
			OnCommand=cmd(hibernate,3;linear,0.317;rotationx,52;zoom,20;y,SCREEN_CENTER_Y+107;sleep,3.017;linear,0.316;rotationx,20.5;y,SCREEN_CENTER_Y+162;sleep,1.05;linear,0.434;rotationy,360;sleep,1.016;diffusealpha,0);
		};
	};
};

return t;
-- ScreenHowToPlay Overlay
local t = Def.ActorFrame{
	LoadActor("_howtoplay")..{
		Name="HowToPlayBig";
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-84;zoomy,0);
		OnCommand=cmd(linear,0.384;zoomy,1;sleep,1.216;linear,0.384;zoomy,0);
	};

	LoadActor("_playwithfeet")..{
		Name="PlayWithFeet";
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-88;addx,-SCREEN_WIDTH;zoomx,0.5);
		OnCommand=cmd(sleep,3.417;linear,0.3;addx,SCREEN_WIDTH;zoomx,1;sleep,2.333;linear,0.267;zoomy,0);
	};

	LoadActor(THEME:GetPathG("ScreenGameplay","LifeFrame"))..{
		InitCommand=cmd(CenterX;y,SCREEN_TOP;valign,0;addy,-64;diffuse,color("0,0,0,1"));
		OnCommand=cmd(sleep,9.15;linear,0.35;addy,64;diffuse,color("1,1,1,1"));
	};
};

return t;
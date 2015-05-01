local t = Def.ActorFrame{
	-- todo: different colors
	LoadFont("ScreenSystemLayer credits normal")..{
		InitCommand=cmd(Center;settext,"No Data");
	};

	LoadActor(THEME:GetPathG("","_help/_diet diary"))..{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-34;addy,100;);
		OnCommand=cmd(diffuseblink;effectperiod,1.056;linear,0.25;addy,-100;);
		OffCommand=cmd(linear,0.25;addy,100;);
	};
};

return t;
-- ScreenSelectMusic Overlay
return Def.ActorFrame{
	LoadActor(THEME:GetPathG("","_help/_lr-start "..GetGraphicType()))..{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-34;addy,100;);
		OnCommand=cmd(diffuseblink;effectperiod,1.056;linear,0.25;addy,-100;);
		OffCommand=cmd(linear,0.25;addy,100;);
	};
};
local gc = Var("GameCommand");
local t = Def.ActorFrame {};
t[#t+1] = LoadActor(THEME:GetPathG("TitleScreen","Row")) .. {
	InitCommand=cmd(zoomtowidth,SCREEN_WIDTH;blend,"BlendMode_Add");
	OnCommand=cmd(diffuseshift;effectcolor1,color("1,1,1,1");effectcolor2,color("1,1,1,.5"));
	OffCommand=cmd(stoptweening);
	GainFocusCommand=cmd(stoptweening;decelerate,0.1;diffusealpha,.5);
	LoseFocusCommand=cmd(stoptweening;accelerate,0.1;diffusealpha,0);
};
t[#t+1] = LoadActor(THEME:GetPathG("TitleScreen","Scroller")) .. {
	InitCommand=cmd(blend,"BlendMode_Add");
	OnCommand=cmd(diffuseshift;effectcolor1,color("1,1,1,1");effectcolor2,color("1,1,1,.5"));
	OffCommand=cmd(stoptweening);
	GainFocusCommand=cmd(stoptweening;decelerate,0.1;diffusealpha,.5);
	LoseFocusCommand=cmd(stoptweening;accelerate,0.1;diffusealpha,0);
};
t[#t+1] = LoadActor(THEME:GetPathG("titl_op",gc:GetText())) .. {
	GainFocusCommand=cmd(diffuse,color("#00F000"));
	LoseFocusCommand=cmd(diffuse,color("#787878"));
};
return t;
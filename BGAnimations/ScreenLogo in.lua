-- ScreenLogo in
return Def.Quad{
	InitCommand=cmd(Center;FullScreen;blend,Blend.Add;);
	OnCommand=cmd(decelerate,0.55;diffusealpha,0);
};
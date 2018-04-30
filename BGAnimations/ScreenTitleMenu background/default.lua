return Def.ActorFrame {
	--Logo
	LoadActor( "../logobg" )..{
		OnCommand=cmd(FullScreen);
	};
	--Filter
	Def.Quad{
		InitCommand=cmd(FullScreen;diffusecolor,color("#000000");diffusealpha,.8);
	};
	-- --Title
	-- LoadFont("LyricDisplay text")..{
	-- InitCommand=cmd(addx,SCREEN_WIDTH/2;y,SCREEN_TOP+67;diffusecolor,color("#ECF414"));
	-- 	OnCommand=function(self)
	-- 	self:settext("MODE SELECTION");
	-- 	end;
	-- };
	-- --Dancers
	-- LoadActor("md")..{
	-- 	OnCommand=cmd(diffuse,.4,.4,1,2;zoom,.1;x,SCREEN_CENTER_X-215;y,SCREEN_CENTER_Y+130;diffusealpha,0;sleep,.2;diffusealpha,1;linear,0.3;y,SCREEN_CENTER_Y+100;zoom,1.4;);
	-- };
	-- LoadActor("fd")..{
	-- 	OnCommand=cmd(diffuse,.95,.8,.7,.65;zoom,.1;x,SCREEN_CENTER_X+215;y,SCREEN_CENTER_Y+120;diffusealpha,0;sleep,.2;diffusealpha,1;linear,0.3;y,SCREEN_CENTER_Y+95;zoom,1.4;);
	-- };
	-- LoadActor("titlehelp")..{
	-- 	OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+126;diffuseblink;effectperiod,.8;effectcolor1,.4,.4,.4,.5);
	-- };
	-- --Menu help
	-- LoadActor("menuhelp")..{
	-- 	OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+182);
	-- };

}
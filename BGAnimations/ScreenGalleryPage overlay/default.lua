-- ScreenGalleryPage
--[[ a 4x3 grid of items that starts off on a specific page. You can switch pages
at the left and right edges.

Pressing Start/Circle/Whatever makes the thumbnail zoom to around 0.5, the normal
sized item will take over from 0.5 to 1.0. (this is assumed; check actual behavior)
--]]

local t = Def.ActorFrame{
	LoadActor(THEME:GetPathB("_missing","overlay"));

	LoadActor(THEME:GetPathG("","_gallery/_explanation frame"))..{
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y+147);
	};

	LoadActor(THEME:GetPathG("","_help/_gallery items"))..{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-34;addy,100;);
		OnCommand=cmd(diffuseblink;effectperiod,1.056;linear,0.25;addy,-100;);
		OffCommand=cmd(linear,0.25;addy,100;);
	};
};

return t;
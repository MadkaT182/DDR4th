-- ScreenDietMenu underlay
local t = Def.ActorFrame{
	LoadActor("_usc")..{ InitCommand=cmd(x,SCREEN_CENTER_X+1;y,SCREEN_CENTER_Y-27); };
};

return t;
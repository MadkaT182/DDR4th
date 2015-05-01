local t = Def.ActorFrame{
	LoadActor("_bg")..{ InitCommand=cmd(Center); };
	LoadActor("_frame")..{ InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y+4); };
};

return t;
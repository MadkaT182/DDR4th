local counter = 0;
local t = Def.ActorFrame{
	LoadActor("warning jp")..{
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y*1.75);
	};
};

return t;
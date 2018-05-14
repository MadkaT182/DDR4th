local t = Def.ActorFrame{
	LoadActor("_mainmode")..{
		InitCommand=cmd(x,SCREEN_CENTER_X+65;y,SCREEN_CENTER_Y+156);
	};
	LoadActor("_arrowleft")..{
		InitCommand=cmd(x,SCREEN_CENTER_X-85;y,SCREEN_CENTER_Y+156;bob;effectmagnitude,-4,0,0;effectperiod,0.5);
	};
};
return t;

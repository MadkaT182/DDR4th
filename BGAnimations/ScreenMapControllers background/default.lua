local t = Def.ActorFrame{
	LoadActor("_bg")..{ InitCommand=cmd(Center); };
};

return t;
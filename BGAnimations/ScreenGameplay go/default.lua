return Def.ActorFrame{
	LoadActor("go")..{
		InitCommand=cmd(Center);
		OnCommand=cmd(sleep,1.5;diffusealpha,0);
	};
};
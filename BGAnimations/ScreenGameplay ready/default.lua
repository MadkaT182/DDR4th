return Def.ActorFrame{
	LoadActor("ready")..{
		InitCommand=cmd(Center);
		OnCommand=cmd(sleep,1.5;diffusealpha,0);
	};
};
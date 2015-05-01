local t = Def.ActorFrame{
	LoadActor("diarybg")..{
		InitCommand=cmd(Center);
	};
};

return t;
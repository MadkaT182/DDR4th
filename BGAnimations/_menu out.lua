return Def.ActorFrame{
	LoadActor(THEME:GetPathB("","_moveon"))..{
		InitCommand=cmd(Center;diffusealpha,0);
		OnCommand=cmd(sleep,0.5;linear,0.5;diffusealpha,1);
	};
};
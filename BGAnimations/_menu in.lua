return Def.ActorFrame{
	LoadActor(THEME:GetPathB("","_moveon"))..{
		InitCommand=cmd(Center;diffusealpha,1;);
		OnCommand=cmd(linear,0.3;diffusealpha,0);
	};
};
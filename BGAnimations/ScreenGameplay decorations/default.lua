return Def.ActorFrame {
	LoadActor("../ScreenGameplay danger");
	LoadActor("../_lifebar");
	LoadActor("../_stageFrame")..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_TOP+44);
	};
	LoadActor("../_difficulty")..{
		InitCommand=cmd(x,SCREEN_CENTER_X);
		Condition=not GAMESTATE:IsDemonstration();
	};
	StandardDecorationFromFile("ScoreFrame","ScoreFrame")..{
		Condition=not GAMESTATE:IsDemonstration();
	};
};
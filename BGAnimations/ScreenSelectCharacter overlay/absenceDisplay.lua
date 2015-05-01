local t = Def.ActorFrame{
	Name="Absences";
	LoadActor("_absence")..{
		Name="AbsenceP1";
		InitCommand=cmd(x,SCREEN_CENTER_X-202;y,SCREEN_CENTER_Y+85;diffuseshift;effectcolor1,color("0.5,0.5,0.5,1");effectcolor2,color("1,1,1,1");cropbottom,1);
		BeginCommand=cmd(visible,not GAMESTATE:IsHumanPlayer(PLAYER_1));
		OnCommand=cmd(linear,0.5;cropbottom,0);
		OffCommand=cmd(linear,0.5;cropbottom,1);
	};
	LoadActor("_absence")..{
		Name="AbsenceP2";
		InitCommand=cmd(x,SCREEN_CENTER_X+162;y,SCREEN_CENTER_Y+45;diffuseshift;effectcolor1,color("0.5,0.5,0.5,1");effectcolor2,color("1,1,1,1");cropbottom,1);
		BeginCommand=cmd(visible,not GAMESTATE:IsHumanPlayer(PLAYER_2));
		OnCommand=cmd(linear,0.5;cropbottom,0);
		OffCommand=cmd(linear,0.5;cropbottom,1);
	};
};

return t;
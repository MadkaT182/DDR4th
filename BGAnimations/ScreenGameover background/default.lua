return Def.ActorFrame {
	--Game over
	LoadActor("gameover")..{
		OnCommand=cmd(Center);
	};
	SOUND:PlayAnnouncer("game over")
};
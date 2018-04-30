local t = Def.ActorFrame{};

--P1 ScoreFrame
t[#t+1] = LoadActor("normal")..{
	InitCommand=cmd(player,PLAYER_1;x,SCREEN_CENTER_X-176);
}

--P2 ScoreFrame
t[#t+1] = LoadActor("normal")..{
	InitCommand=cmd(player,PLAYER_2;x,SCREEN_CENTER_X+176);
}

return t
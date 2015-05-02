local t = Def.ActorFrame {

LoadActor("_eval bg")..{
	InitCommand=cmd(Center);
};

LoadActor("../../Graphics/ScreenEvaluation header")..{
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_TOP);
};

};

return t;
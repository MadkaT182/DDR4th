return Def.ActorFrame {
	LoadActor("../_lifebar");
	--Score frame
	LoadActor("../_difficulty")..{
		InitCommand=cmd(x,SCREEN_CENTER_X);
	};
	StandardDecorationFromFile("ScoreFrame","ScoreFrame");
};

--Danger Filter
-- t[#t+1] = LoadActor("../ScreenGameplay Danger");

-- --Stage frame
-- t[#t+1] = LoadActor("../_stageFrame")..{
-- 	OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_TOP+54);
-- };

-- --Play mode
-- t[#t+1] = Def.ActorFrame {
-- 	LoadActor( "../_style" )..{
-- 		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-72)
-- 	}
-- };
-- t[#t+1] = Def.ActorFrame {
-- 	LoadActor( "../_playmode" )..{
-- 		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_BOTTOM)
-- 	}
-- };
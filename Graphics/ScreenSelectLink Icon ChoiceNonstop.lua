return Def.ActorFrame {
	Def.ActorFrame {
		OnCommand=cmd(x,SCREEN_CENTER_X-150;y,SCREEN_CENTER_Y-17);
		GainFocusCommand=cmd(addx,20;linear,0.1;addx,-40;linear,0.1;addx,20);
		LoadActor("btn_nonstop")..{};
		LoadActor("link_cursor")..{
			OnCommand=cmd(diffuseshift;effectcolor1,1,1,1,1;effectcolor2,1,1,1,0);
			GainFocusCommand=cmd(diffusealpha,1);
			LoseFocusCommand=cmd(diffusealpha,0);
		};
	};
	Def.ActorFrame {
		OnCommand=cmd(x,SCREEN_CENTER_X-150;y,SCREEN_CENTER_Y-17);
		LoadActor("song_nonstop")..{
			OnCommand=cmd(x,129;y,91);
			GainFocusCommand=cmd(diffusealpha,1);
			LoseFocusCommand=cmd(diffusealpha,0);
		};
	};
};
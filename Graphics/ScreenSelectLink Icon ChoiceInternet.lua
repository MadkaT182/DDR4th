return Def.ActorFrame {
	Def.ActorFrame {
		OnCommand=cmd(x,SCREEN_CENTER_X+1;y,SCREEN_CENTER_Y-71);
		GainFocusCommand=cmd(addx,20;linear,0.1;addx,-40;linear,0.1;addx,20);
		LoadActor("btn_ir");
		LoadActor("link_cursor")..{
			OnCommand=cmd(diffuseshift;effectcolor1,1,1,1,1;effectcolor2,1,1,1,0);
			GainFocusCommand=function(self)
				self:diffusealpha(1);
				GAMESTATE:ApplyGameCommand("sort,Preferred");
				SONGMAN:SetPreferredSongs("PreferredSongsInternet");
			end;
			LoseFocusCommand=cmd(diffusealpha,0);
		};
	};
	Def.ActorFrame {
		OnCommand=cmd(x,SCREEN_CENTER_X+1;y,SCREEN_CENTER_Y-71);
		LoadActor("song_internet")..{
			OnCommand=cmd(x,2;y,151);
			GainFocusCommand=cmd(diffusealpha,1);
			LoseFocusCommand=cmd(diffusealpha,0);
		};
	};
};
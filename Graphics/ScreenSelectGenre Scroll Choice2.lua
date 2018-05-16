return Def.ActorFrame {
	Def.ActorFrame{
		OnCommand=cmd(x,147;y,-133);
		GainFocusCommand=function(self)
			self:linear(.5);
			self:x(115);
		end;
		LoseFocusCommand=cmd(linear,.5;x,147);
		LoadActor("genre/group02");
		LoadActor("genre_cursor")..{
			OnCommand=cmd(diffuseshift;effectcolor1,1,1,1,1;effectcolor2,1,1,1,0);
			GainFocusCommand=function(self)
				self:diffusealpha(1);
				GAMESTATE:ApplyGameCommand("sort,Preferred");
				SONGMAN:SetPreferredSongs("PreferredSongsGroup02");
			end;
			LoseFocusCommand=cmd(diffusealpha,0);
		};
	}
	-- Def.ActorFrame{
	-- 	OnCommand=cmd(x,SCREEN_CENTER_X+151;y,SCREEN_CENTER_Y-125);
	-- 	LoadActor("song_edit")..{
	-- 		OnCommand=cmd(x,-147;y,229);
	-- 		GainFocusCommand=cmd(diffusealpha,1);
	-- 		LoseFocusCommand=cmd(diffusealpha,0);
	-- 	};
	-- };
};
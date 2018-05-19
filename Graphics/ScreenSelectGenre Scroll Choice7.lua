return Def.ActorFrame {
	Def.ActorFrame{
		OnCommand=cmd(x,147;y,-13);
		GainFocusCommand=function(self)
			self:stoptweening();
			self:linear(.25);
			self:x(115);
		end;
		LoseFocusCommand=cmd(linear,.25;x,147);
		LoadActor("genre/group07");
		LoadActor("genre_cursor")..{
			OnCommand=cmd(diffuseshift;effectcolor1,1,1,1,1;effectcolor2,1,1,1,0);
			GainFocusCommand=function(self)
				self:diffusealpha(1);
				GAMESTATE:ApplyGameCommand("sort,Preferred");
				SONGMAN:SetPreferredSongs("PreferredSongsGroup07");
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
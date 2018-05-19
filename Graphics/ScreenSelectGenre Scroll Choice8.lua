return Def.ActorFrame {
	Def.ActorFrame{
		OnCommand=cmd(x,147;y,11);
		GainFocusCommand=function(self)
			self:stoptweening();
			self:linear(.25);
			self:x(115);
		end;
		LoseFocusCommand=cmd(linear,.25;x,147);
		LoadActor("genre/group08");
		LoadActor("genre_cursor")..{
			OnCommand=cmd(diffuseshift;effectcolor1,1,1,1,1;effectcolor2,1,1,1,0);
			GainFocusCommand=function(self)
				self:diffusealpha(1);
				GAMESTATE:ApplyGameCommand("sort,Preferred");
				SONGMAN:SetPreferredSongs("PreferredSongsGroup08");
			end;
			LoseFocusCommand=cmd(diffusealpha,0);
		};
	};
	Def.ActorFrame{
		OnCommand=cmd(x,-1;y,104);
		LoadActor("genre/list08")..{
			GainFocusCommand=cmd(diffusealpha,1);
			LoseFocusCommand=cmd(diffusealpha,0);
		};
	};
};
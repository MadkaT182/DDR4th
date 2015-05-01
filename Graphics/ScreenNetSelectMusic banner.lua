local t = Def.ActorFrame{
	Def.Banner {
		Name="Banner";
		OffCommand=cmd(linear,0.2;diffusealpha,0);
		SetCommand=function(self)
			local song = GAMESTATE:GetCurrentSong();
			if not song then self:Load( THEME:GetPathG("common fallback","banner") );
			else self:LoadFromSong(song);
			end;
			self:ScaleToClipped(254,78);
		end;
		InitCommand=cmd(queuecommand,"Set");
		CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
	};

	Def.ActorProxy{
		Name="CDTitleProxy";
		InitCommand=cmd(x,8;y,68);
		BeginCommand=function(self)
			local cdtitle = SCREENMAN:GetTopScreen():GetChild('CDTitle');
			self:SetTarget(cdtitle);
		end;
	};
};

return t;
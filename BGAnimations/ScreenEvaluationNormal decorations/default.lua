local t = Def.ActorFrame {};

--Decorations
t[#t+1] = Def.ActorFrame {
	LoadActor("title")..{
		InitCommand=cmd(x,SCREEN_CENTER_X-5;y,SCREEN_TOP+36);
	};
	LoadFont("_system1")..{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_TOP+69;playcommand,"Set");
		SetCommand=function(self)
			local song = GAMESTATE:GetCurrentSong();
			if song then
				self:settext(song:GetDisplayMainTitle());
				self:diffuse(color(GetSongColor(song:GetDisplayMainTitle())));
			end;
		end;
	};
};

--Player Stats
t[#t+1] = LoadActor("statsP1")..{
	OnCommand=cmd(x,SCREEN_CENTER_X-72;y,SCREEN_CENTER_Y-64;player,PLAYER_1)
};
t[#t+1] = LoadActor("statsP2")..{
	OnCommand=cmd(x,SCREEN_CENTER_X+228;y,SCREEN_CENTER_Y-64;player,PLAYER_2)
};

--Grade
t[#t+1] = LoadActor("grade")..{
	OffCommand=cmd(sleep,0.2;linear,0.2;diffusealpha,0);
};

return t;
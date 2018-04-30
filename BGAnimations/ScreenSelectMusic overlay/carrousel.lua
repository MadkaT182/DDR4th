local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame {
	-- LoadActor(THEME:GetPathG("MW","highlight"))..{
	-- 	InitCommand=cmd(scaletoclipped,190,55;rotationz,-45;x,SCREEN_CENTER_X-21+25;y,SCREEN_CENTER_Y+98-25;diffuseshift;effectcolor1,1,1,1,1;effectcolor2,1,1,1,0);
	-- 	RefreshCommand=cmd(stopeffect;x,SCREEN_CENTER_X-21;y,SCREEN_CENTER_Y+98;sleep,.3;x,SCREEN_CENTER_X-21+25;y,SCREEN_CENTER_Y+98-25;diffuseshift;effectcolor1,1,1,1,1;effectcolor2,1,1,1,0);
	-- 	CurrentSongChangedMessageCommand=cmd(playcommand,"Refresh");
	-- };
	-- LoadActor("greenbar")..{
	-- 	OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-44;zoomtowidth,SCREEN_WIDTH);
	-- };
	Def.Sprite {
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-92;playcommand,"Refresh");
		RefreshCommand=function(self)
		local song = GAMESTATE:GetCurrentSong();
			if song then
				if song:HasBackground() then
					self:LoadFromSongBackground(song);
				else
					self:LoadBackground(THEME:GetPathG("Common fallback", "background"));
				end;
				self:scaletoclipped(320,240);
				self:cropto(320,80);
			end;
		end;
		CurrentSongChangedMessageCommand=cmd(playcommand,"Refresh");
	};
};

--Variables para la musicwheel
-- local topscreen = SCREENMAN:GetTopScreen();
-- local MusicWheel = topscreen:GetMusicWheel();
-- local Windes = MusicWheel:GetCUrrentIndex();

return t;
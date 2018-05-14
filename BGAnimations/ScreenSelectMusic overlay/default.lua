local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame {
	LoadActor(THEME:GetPathG("MW","highlight"))..{
		InitCommand=cmd(scaletoclipped,190,55;rotationz,-45;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+94;diffuseshift;effectcolor1,1,1,1,1;effectcolor2,1,1,1,0);
	};
	LoadFont("_system1")..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-18);
		RefreshCommand=function(self)
			local song = GAMESTATE:GetCurrentSong();
			if song then
				self:settext(song:GetDisplayMainTitle());
				self:diffuse(color(GetSongColor(song:GetDisplayMainTitle())));
			else
				self:settext("");
			end
		end;
		CurrentSongChangedMessageCommand=cmd(playcommand,"Refresh");
	};
	LoadFont("_system1")..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-2);
		RefreshCommand=function(self)
			local song = GAMESTATE:GetCurrentSong();
			if song then
				self:settext(song:GetDisplaySubTitle());
				self:diffuse(color(GetSongColor(song:GetDisplayMainTitle())));
			else
				self:settext("");
			end
		end;
		CurrentSongChangedMessageCommand=cmd(playcommand,"Refresh");
	};
	LoadActor("new")..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-9;playcommand,"Refresh");
		RefreshCommand=function (self)
			local song = GAMESTATE:GetCurrentSong();
			if song then
				local iTitlen = string.len(song:GetDisplayMainTitle());
				local iSubtitlen = string.len(song:GetDisplaySubTitle());
				if PROFILEMAN:IsSongNew(GAMESTATE:GetCurrentSong()) then
					self:visible(true);
					self:stopeffect();
					self:pulse();
					self:effectperiod(.3);
					if iTitlen > iSubtitlen then
						self:x(SCREEN_CENTER_X-((iTitlen/2)*10+31));
					else
						self:x(SCREEN_CENTER_X-((iSubtitlen/2)*10+31));
					end;
				else
					self:visible(false);
				end;
			else
				self:visible(false);
			end;
		end;
		CurrentSongChangedMessageCommand=cmd(playcommand,"Refresh");
	};
	LoadActor("carrousel")..{};
	LoadActor("greenbar")..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-44;zoomtowidth,SCREEN_WIDTH);
	};
	LoadActor("frame")..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-48);
	};
	LoadActor("title")..{
		OnCommand=cmd(x,SCREEN_CENTER_X-117;y,SCREEN_CENTER_Y-78);
	};
};

return t
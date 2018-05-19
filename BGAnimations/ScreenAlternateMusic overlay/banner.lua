local t = Def.ActorFrame {};
	t[#t+1] = Def.ActorFrame {
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
		};
		Def.Sprite {
			OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+87;playcommand,"Refresh");
			RefreshCommand=function(self)
			local song = GAMESTATE:GetCurrentSong();
				if song then
					self:LoadFromSongBanner(song);
				else
					self:Load(THEME:GetPathG("Common fallback","banner"))
				end;
				self:scaletoclipped(128,36);
			end;
		};
		CurrentSongChangedMessageCommand=cmd(playcommand,"Refresh");
	};
return t;
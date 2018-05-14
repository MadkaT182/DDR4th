local t = Def.ActorFrame{};


t[#t+1] = Def.ActorFrame{
	Def.Banner{
		Name="BannerWheel";
		InitCommand=cmd(scaletoclipped,190,55;rotationz,-45;addy,-2);
		SetMessageCommand=function(self,params)
			local song = params.Song;
			if song then
				self:LoadFromSong(song);
			else
				self:Load( THEME:GetPathG("Common fallback","banner"));
			end;
		end;
	};
};

t[#t+1] = Def.ActorFrame{
	Def.ActorFrame{
		LoadActor("blue hl")..{
			InitCommand=cmd(rotationz,-45;addy,-2;zoomx,.74;zoomy,.687);
			OnCommand=cmd(blend,'BlendMode_NoEffect';zwrite,true;clearzbuffer,true);
			SetCommand=function(self,param)
				if param.Song then
					if PROFILEMAN:IsSongNew(param.Song) then
						self:visible(true);
					else
						self:visible(false);
					end
				else
					self:visible(false);
				end
			end;
		};
	};
	Def.Sprite{
		Name="New";
		InitCommand=cmd(spin;effectmagnitude,0,0,60;addy,-2);
		OnCommand=cmd(ztest,true);
		SetCommand=function(self,params)
			if params.Song then
				if PROFILEMAN:IsSongNew(params.Song) then
					self:Load(THEME:GetPathG("", "MusicWheelItem Song NormalPart/new_indicator"))
					self:visible(true);
					self:ztest(true);
				else
					self:visible(false);
					self:ztest(false);
				end
			else
				self:visible(false);
				self:ztest(false);
			end
		end;
	};
	Def.Sprite{
		Name="LeftBanner";
		BeginCommand=cmd();
		InitCommand=cmd(xy,-230,-190;scaletoclipped,320,240;cropto,320,80);
		SetCommand=function(self,params)
			local course = params.Course
			local song = params.Song
			local index = params.DrawIndex
			if song then
				if index == 5 then
					self:LoadFromSongBackground(song);
					self:visible(true)
				else
					self:visible(false)
				end
			else
				self:Load( THEME:GetPathG("Common fallback","banner"));
			end;
		end;
	};
	Def.Sprite{
		Name="RightBanner";
		BeginCommand=cmd();
		InitCommand=cmd(xy,230,-190;scaletoclipped,320,240;cropto,320,80);
		SetCommand=function(self,params)
			local course = params.Course
			local song = params.Song
			local index = params.DrawIndex
			if song then
				if index == 7 then
					self:LoadFromSongBackground(song);
					self:visible(true)
				else
					self:visible(false)
				end
			else
				self:Load(THEME:GetPathG("Common fallback","banner"));
			end;
		end;
	};
	Def.Sprite{
		Name="MidBanner";
		BeginCommand=cmd();
		InitCommand=cmd(xy,0,-190;scaletoclipped,320,240;cropto,320,80);
		SetCommand=function(self,params)
			local course = params.Course
			local song = params.Song
			local index = params.DrawIndex
			if song then
				if index == 6 then
					self:LoadFromSongBackground(song);
					self:visible(true)
				else
					self:visible(false)
				end
			else
				self:Load(THEME:GetPathG("Common fallback","banner"));
			end;
		end;
	};
};

return t;

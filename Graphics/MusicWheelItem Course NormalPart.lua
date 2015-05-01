local bannerPath;

function GetSongBanner(song)
	if song then
		local path = song:GetBannerPath()
		if path then return path end
	end
	return THEME:GetPathG("Common","fallback banner")
end

function GetSongBg(song)
	if song then
		local path = song:GetBackgroundPath()
		if path then return path end
	end
	return THEME:GetPathG("Common","fallback background")
end

local t = Def.ActorFrame{

	Def.Banner {
		Name="SongBanner";
		InitCommand=cmd(scaletoclipped,220,220;);
		SetMessageCommand=function(self,params)
			local song = params.Song;
			local course = params.Course;
			if song and not course then
				-- this is where we do all song-specific stuff
				--self:LoadFromSong(params.Song);
				self:LoadBackground(GetSongBanner(params.Song));
				--self:LoadFromCachedBanner(GetSongBanner(params.Song));
				--[ja] Ǵ��ǭǿ�Ī��
				--self:LoadBackground(song:GetJacketPath());
				self:position(0);
				--self:rate(0.5);
			elseif course and not song then
				-- this is where we do all course-specific stuff
				self:LoadFromCourse(params.Course);
			else
				-- call fallback
				self:Load( THEME:GetPathG("Common fallback","banner") );
			end;

		end;
	};
	Def.Banner {
		InitCommand=cmd(scaletoclipped,220,220;y,220;rotationx,180;croptop,0.5;diffusealpha,0.6;diffusetopedge,1,1,1,0);
		SetMessageCommand=function(self,params)
			local song = params.Song;
			local course = params.Course;
			if song and not course then
				-- this is where we do all song-specific stuff
				--self:LoadFromSong(params.Song);
				self:LoadFromCachedBanner(GetSongBanner(params.Song));
				self:position(0);
				-- [ja] �譱�Ϯg�����V�O�Rǩ��ǿǳ���N�i�H�M�P�Q���o�T 
				-- if params.HasFocus then
					-- self:rate(0.2);
				-- end;
			elseif course and not song then
				-- this is where we do all course-specific stuff
				self:LoadFromCourse(params.Course);

			end;
		end;
	};

};
return t;
--GetThemeCD(songtit);
local cdo = false;
local t = Def.ActorFrame{
	--CD Mask
	Def.ActorFrame{
		Name="CdMask";
		InitCommand=cmd();
		LoadActor(THEME:GetPathG("", "MusicWheelItem Song NormalPart/cd/cd_mask"))..{
			OnCommand=cmd(blend,'BlendMode_NoEffect';zwrite,true;clearzbuffer,true);
		};
	};
	--CD
	Def.Sprite{
		Name="Disc";
		OnCommand=cmd(ztest,true;);
		SetMessageCommand=function(self,params)
			local Song = params.Song;
			if Song then
				discimg = GetThemeCD(params.Song:GetDisplayMainTitle());
				if discimg == "fallback" then
					--Create custom CD graphic
					--Verify jacket
					if params.Song:HasJacket() then
						self:LoadBackground(params.Song:GetJacketPath());
						self:setsize(256,256);
						self:ztest(true);
						cdo = true;
						elseif params.Song:HasBackground() then
							--Verify BG
							self:LoadBackground(params.Song:GetBackgroundPath());
							self:setsize(256,256);
							self:ztest(true);
							cdo = true;
						else
							--Fallback
							self:Load(THEME:GetPathG("", "MusicWheelItem Song NormalPart/cd/"..discimg));
							self:ztest(false);
							cdo = false;
					end;
				else
					--Load CD from theme
					self:Load(THEME:GetPathG("", "MusicWheelItem Song NormalPart/cd/"..discimg));
					self:ztest(false);
					cdo = false;
				end;
			end;
		end;
	};
	--Overlay
	Def.ActorFrame{
		Name="CdOver";
		LoadActor(THEME:GetPathG("", "MusicWheelItem Song NormalPart/cd/overlay"))..{
		SetMessageCommand=function(self,params)
			if cdo then
				self:diffusealpha(1);
			else
				self:diffusealpha(0);
			end;
		end;
		};
	};
};

return t;
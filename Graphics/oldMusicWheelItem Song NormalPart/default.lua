local t = Def.ActorFrame{
	Def.Sprite {
		Name="Banner";
		SetMessageCommand=function(self,params)
			local Song = params.Song;
			if Song then
				if params.Song:HasBanner() then
					self:LoadBackground(params.Song:GetBannerPath());
					self:scaletoclipped(190,55);
				elseif params.Song:HasBackground() then
					self:LoadBackground(params.Song:GetBackgroundPath());
					self:scaletoclipped(190,55);
				else
					self:LoadBackground(THEME:GetPathG("Common fallback", "banner"));
					self:scaletoclipped(190,55);
				end;
			end;
		end;
	};
};

return t;
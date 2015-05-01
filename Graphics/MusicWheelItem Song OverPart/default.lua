return LoadActor("longver")..{
	InitCommand=cmd(x,-30;y,-16;draworder,100;blend,Blend.Add;);
	SetMessageCommand=function(self,param)
		if param.Song then
			local isLongOrMarathon = param.Song:IsLong() or param.Song:IsMarathon();
			self:visible(isLongOrMarathon)
		else
			self:visible(false)
		end;
	end;
	CurrentSongChangedMessageCommand=function(self)
		-- highlight hackery
		local song = GAMESTATE:GetCurrentSong()
		local highlightColor = color("#3A3A6B7F")
		if song then
			local isLongOrMarathon = song:IsLong() or song:IsMarathon();
			highlightColor = isLongOrMarathon and color("#FF00007F") or color("#3A3ABB7F")
		end;
		local highlight = SCREENMAN:GetTopScreen():GetChild("MusicWheel"):GetChild("Highlight")
		if highlight then
			highlight:diffuse(highlightColor)
		end
	end;
};
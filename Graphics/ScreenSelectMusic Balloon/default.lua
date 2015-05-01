local c;
local t = Def.ActorFrame{
	InitCommand=function(self) c = self:GetChildren(); end;
	LoadActor("_long")..{
		Name="Long";
		InitCommand=cmd(visible,false);
		OnCommand=function(self)
			local song = GAMESTATE:GetCurrentSong()
			if song and song:IsLong() then
				self:visible(true);
			end;
		end;
	};
	LoadActor("_marathon")..{
		Name="Marathon";
		InitCommand=cmd(visible,false);
		OnCommand=function(self)
			local song = GAMESTATE:GetCurrentSong()
			if song and song:IsMarathon() then
				self:visible(true);
			end;
		end;
	};
	CurrentSongChangedMessageCommand=function(self)
		local song = GAMESTATE:GetCurrentSong();
		self:stoptweening();
		if song then
			if song:IsLong() then
				c.Long:visible(true);
				c.Marathon:visible(false);
				self:playcommand("Show");
			elseif song:IsMarathon() then
				c.Long:visible(false);
				c.Marathon:visible(true);
				self:playcommand("Show");
			else
				self:playcommand("Hide");
			end;
		else
			self:playcommand("Hide");
		end;
	end;
};

return t;
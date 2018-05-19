local t = Def.ActorFrame {};
local width = 64;
local height = 40;
local scaling = 1;

t[#t+1] = Def.ActorFrame {
	InitCommand=function(self) t = self:GetChildren(); end;
	BeginCommand=cmd(draworder,2);
	OffCommand=cmd(linear,1;diffusealpha,0);
	Def.Quad{
		OnCommand=cmd(diffusecolor,Color.White;diffusealpha,0;zoomto,width,height);
	};
	Def.Sprite{
		Name="CdTitle";
		InitCommand=cmd();
		SetCommand=function(self)
			local song = GAMESTATE:GetCurrentSong();
			self:stoptweening();
			self:diffusealpha(0);
			self:sleep(.25);
			if song then
				if song:HasCDTitle() then
					self:LoadBackground(song:GetCDTitlePath());
					if self:GetWidth() > self:GetHeight() then
						scaling = width/self:GetWidth();
					else
						scaling = height/self:GetHeight();
					end
					self:zoom(scaling);
					self:SetTextureFiltering(false)
					self:sleep(.25);
					self:diffusealpha(1);
				else
					self:diffusealpha(0);
				end;
			else
				self:diffusealpha(0);
			end;
		end;
	};
	CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
};

return t
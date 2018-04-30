local t = Def.ActorFrame{
};

t[#t+1] = Def.Sprite {
	Texture="_mdancer 4x8",
	InitCommand=function(self)
		self:SetAllStateDelays(0.04)
	end;
};

return t;
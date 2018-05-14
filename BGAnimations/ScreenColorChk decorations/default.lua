local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame {
	LoadActor( "bg" )..{
		InitCommand=cmd(Center;addx,24;addy,8);
	}
};

t[#t+1] = Def.Quad{
	InitCommand=cmd(x,SCREEN_CENTER_X-217;y,SCREEN_TOP+250;zoomto,2,333;diffusecolor,color("#848484"););
};

t[#t+1] = LoadFont("_service")..{
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_TOP+59);
	OnCommand=function(self)
		self:settextf("COLOR CHECK");
	end;
};

t[#t+1] = LoadFont("_service")..{
	InitCommand=cmd(x,SCREEN_CENTER_X-233;y,SCREEN_TOP+111);
	OnCommand=function(self)
		self:settextf("R");
	end;
};

t[#t+1] = LoadFont("_service")..{
	InitCommand=cmd(x,SCREEN_CENTER_X-233;y,SCREEN_TOP+159);
	OnCommand=function(self)
		self:settextf("Y");
	end;
};

t[#t+1] = LoadFont("_service")..{
	InitCommand=cmd(x,SCREEN_CENTER_X-233;y,SCREEN_TOP+207);
	OnCommand=function(self)
		self:settextf("G");
	end;
};

t[#t+1] = LoadFont("_service")..{
	InitCommand=cmd(x,SCREEN_CENTER_X-233;y,SCREEN_TOP+255);
	OnCommand=function(self)
		self:settextf("C");
	end;
};

t[#t+1] = LoadFont("_service")..{
	InitCommand=cmd(x,SCREEN_CENTER_X-233;y,SCREEN_TOP+303);
	OnCommand=function(self)
		self:settextf("B");
	end;
};

t[#t+1] = LoadFont("_service")..{
	InitCommand=cmd(x,SCREEN_CENTER_X-233;y,SCREEN_TOP+351);
	OnCommand=function(self)
		self:settextf("M");
	end;
};

t[#t+1] = LoadFont("_service")..{
	InitCommand=cmd(x,SCREEN_CENTER_X-233;y,SCREEN_TOP+399);
	OnCommand=function(self)
		self:settextf("W");
	end;
};

t[#t+1] = LoadFont("_service")..{
	InitCommand=cmd(x,SCREEN_CENTER_X-107;y,SCREEN_BOTTOM-49);
	OnCommand=function(self)
		self:settextf("^^^^COLORLESS");
	end;
};

t[#t+1] = LoadFont("_service")..{
	InitCommand=cmd(x,SCREEN_CENTER_X+147;y,SCREEN_BOTTOM-49);
	OnCommand=function(self)
		self:settextf("COLORED");
	end;
};

t[#t+1] = LoadFont("_service")..{
	InitCommand=cmd(x,SCREEN_CENTER_X-27;y,SCREEN_BOTTOM-9);
	OnCommand=function(self)
		self:settextf("PRESS 1P START BUTTON = EXIT");
	end;
};

return t
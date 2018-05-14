local t = Def.ActorFrame {};

t[#t+1] = LoadFont("_service")..{
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_TOP+59);
	OnCommand=function(self)
		self:settextf("I/O CHECK");
	end;
};

t[#t+1] = LoadFont("_service")..{
	InitCommand=cmd(x,SCREEN_CENTER_X-201;y,SCREEN_TOP+87);
	OnCommand=function(self)
		self:settextf("PLAYER1");
	end;
};

t[#t+1] = LoadFont("_service")..{
	InitCommand=cmd(x,SCREEN_CENTER_X+103;y,SCREEN_TOP+87);
	OnCommand=function(self)
		self:settextf("PLAYER2");
	end;
};

t[#t+1] = LoadFont("_service")..{
	InitCommand=cmd(x,SCREEN_CENTER_X-261;y,SCREEN_TOP+123);
	OnCommand=function(self)
		self:settextf("LEFT");
		self:horizalign(left);
	end;
};

t[#t+1] = LoadFont("_service")..{
	InitCommand=cmd(x,SCREEN_CENTER_X-261;y,SCREEN_TOP+139);
	OnCommand=function(self)
		self:settextf("RIGHT");
		self:horizalign(left);
	end;
};

t[#t+1] = LoadFont("_service")..{
	InitCommand=cmd(x,SCREEN_CENTER_X-261;y,SCREEN_TOP+155);
	OnCommand=function(self)
		self:settextf("UP");
		self:horizalign(left);
	end;
};

t[#t+1] = LoadFont("_service")..{
	InitCommand=cmd(x,SCREEN_CENTER_X-261;y,SCREEN_TOP+171);
	OnCommand=function(self)
		self:settextf("DOWN");
		self:horizalign(left);
	end;
};

t[#t+1] = LoadFont("_service")..{
	InitCommand=cmd(x,SCREEN_CENTER_X-261;y,SCREEN_TOP+187);
	OnCommand=function(self)
		self:settextf("SELECT L");
		self:horizalign(left);
	end;
};

t[#t+1] = LoadFont("_service")..{
	InitCommand=cmd(x,SCREEN_CENTER_X-261;y,SCREEN_TOP+203);
	OnCommand=function(self)
		self:settextf("SELECT R");
		self:horizalign(left);
	end;
};

t[#t+1] = LoadFont("_service")..{
	InitCommand=cmd(x,SCREEN_CENTER_X-261;y,SCREEN_TOP+219);
	OnCommand=function(self)
		self:settextf("START");
		self:horizalign(left);
	end;
};

t[#t+1] = LoadFont("_service")..{
	InitCommand=cmd(x,SCREEN_CENTER_X+43;y,SCREEN_TOP+123);
	OnCommand=function(self)
		self:settextf("LEFT");
		self:horizalign(left);
	end;
};

t[#t+1] = LoadFont("_service")..{
	InitCommand=cmd(x,SCREEN_CENTER_X+43;y,SCREEN_TOP+139);
	OnCommand=function(self)
		self:settextf("RIGHT");
		self:horizalign(left);
	end;
};

t[#t+1] = LoadFont("_service")..{
	InitCommand=cmd(x,SCREEN_CENTER_X+43;y,SCREEN_TOP+155);
	OnCommand=function(self)
		self:settextf("UP");
		self:horizalign(left);
	end;
};

t[#t+1] = LoadFont("_service")..{
	InitCommand=cmd(x,SCREEN_CENTER_X+43;y,SCREEN_TOP+171);
	OnCommand=function(self)
		self:settextf("DOWN");
		self:horizalign(left);
	end;
};

t[#t+1] = LoadFont("_service")..{
	InitCommand=cmd(x,SCREEN_CENTER_X+43;y,SCREEN_TOP+187);
	OnCommand=function(self)
		self:settextf("SELECT L");
		self:horizalign(left);
	end;
};

t[#t+1] = LoadFont("_service")..{
	InitCommand=cmd(x,SCREEN_CENTER_X+43;y,SCREEN_TOP+203);
	OnCommand=function(self)
		self:settextf("SELECT R");
		self:horizalign(left);
	end;
};

t[#t+1] = LoadFont("_service")..{
	InitCommand=cmd(x,SCREEN_CENTER_X+43;y,SCREEN_TOP+219);
	OnCommand=function(self)
		self:settextf("START");
		self:horizalign(left);
	end;
};

t[#t+1] = LoadFont("_service")..{
	InitCommand=cmd(x,SCREEN_CENTER_X-193;y,SCREEN_TOP+251);
	OnCommand=function(self)
		self:settextf("SERVICE SWITCH");
		self:horizalign(left);
	end;
};

t[#t+1] = LoadFont("_service")..{
	InitCommand=cmd(x,SCREEN_CENTER_X-193;y,SCREEN_TOP+267);
	OnCommand=function(self)
		self:settextf("COIN MECH SWITCH");
		self:horizalign(left);
	end;
};

t[#t+1] = LoadFont("_service")..{
	InitCommand=cmd(x,SCREEN_CENTER_X-193;y,SCREEN_TOP+299);
	OnCommand=function(self)
		self:settextf("TEST SWITCH");
		self:horizalign(left);
	end;
};

--Test items
--P1 Side
t[#t+1] = LoadFont("_service")..{
	InitCommand=cmd(x,SCREEN_CENTER_X-117;y,SCREEN_TOP+123);
	OnCommand=function(self)
		self:settextf("OFF");
		self:horizalign(left);
	end;
	MenuRightP1MessageCommand=function(self)
		self:settextf("ON");
	end;
	MenuLeftP1MessageCommand=function(self)
		self:settextf("OFF");
	end;
};
--P2 Side
--Service

t[#t+1] = LoadFont("_service")..{
	InitCommand=cmd(x,SCREEN_CENTER_X-27;y,SCREEN_BOTTOM-9);
	OnCommand=function(self)
		self:settextf("HOLD 1P START BUTTON = EXIT");
	end;
};

return t
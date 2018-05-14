local perc = 0;
local loadtm = 40;
local timeunit = loadtm/100;
local t = Def.ActorFrame {};

t[#t+1] = LoadFont("_service")..{
	InitCommand=cmd(x,SCREEN_CENTER_X-33;y,SCREEN_TOP+55);
	OnCommand=function(self)
		self:settextf("FLASH ROM CHECK");
	end;
};

t[#t+1] = LoadFont("_service")..{
	InitCommand=cmd(x,SCREEN_CENTER_X-95;y,SCREEN_TOP+87);
	OnCommand=function(self)
		self:settextf("31M:");
	end;
};

t[#t+1] = LoadFont("_service")..{
	InitCommand=cmd(x,SCREEN_CENTER_X-95;y,SCREEN_TOP+103);
	OnCommand=function(self)
		self:settextf("31L:");
	end;
};

t[#t+1] = LoadFont("_service")..{
	InitCommand=cmd(x,SCREEN_CENTER_X-95;y,SCREEN_TOP+119);
	OnCommand=function(self)
		self:settextf("31J:");
	end;
};

t[#t+1] = LoadFont("_service")..{
	InitCommand=cmd(x,SCREEN_CENTER_X-95;y,SCREEN_TOP+135);
	OnCommand=function(self)
		self:settextf("31H:");
	end;
};

t[#t+1] = LoadFont("_service")..{
	InitCommand=cmd(x,SCREEN_CENTER_X-95;y,SCREEN_TOP+151);
	OnCommand=function(self)
		self:settextf("27M:");
	end;
};

t[#t+1] = LoadFont("_service")..{
	InitCommand=cmd(x,SCREEN_CENTER_X-95;y,SCREEN_TOP+167);
	OnCommand=function(self)
		self:settextf("27L:");
	end;
};

t[#t+1] = LoadFont("_service")..{
	InitCommand=cmd(x,SCREEN_CENTER_X-95;y,SCREEN_TOP+183);
	OnCommand=function(self)
		self:settextf("27J:");
	end;
};

t[#t+1] = LoadFont("_service")..{
	InitCommand=cmd(x,SCREEN_CENTER_X-95;y,SCREEN_TOP+199);
	OnCommand=function(self)
		self:settextf("27H:");
	end;
};

t[#t+1] = LoadFont("_service")..{
	InitCommand=cmd(x,SCREEN_CENTER_X+16;y,SCREEN_TOP+87);
	OnCommand=function(self)
		self:settextf("--");
		self:sleep(10);
		self:queuecommand("Update");
	end;
	UpdateCommand=function(self)
		self:diffuse(color("#00FF00"));
		self:settextf("OK");
	end;
};

t[#t+1] = LoadFont("_service")..{
	InitCommand=cmd(x,SCREEN_CENTER_X+16;y,SCREEN_TOP+103);
	OnCommand=function(self)
		self:settextf("--");
		self:sleep(20);
		self:queuecommand("Update");
	end;
	UpdateCommand=function(self)
		self:diffuse(color("#00FF00"));
		self:settextf("OK");
	end;
};

t[#t+1] = LoadFont("_service")..{
	InitCommand=cmd(x,SCREEN_CENTER_X+16;y,SCREEN_TOP+119);
	OnCommand=function(self)
		self:settextf("--");
		self:sleep(30);
		self:queuecommand("Update");
	end;
	UpdateCommand=function(self)
		self:diffuse(color("#00FF00"));
		self:settextf("OK");
	end;
};

t[#t+1] = LoadFont("_service")..{
	InitCommand=cmd(x,SCREEN_CENTER_X+16;y,SCREEN_TOP+135);
	OnCommand=function(self)
		self:settextf("--");
		self:sleep(40);
		self:queuecommand("Update");
	end;
	UpdateCommand=function(self)
		self:diffuse(color("#00FF00"));
		self:settextf("OK");
	end;
};

t[#t+1] = LoadFont("_service")..{
	InitCommand=cmd(x,SCREEN_CENTER_X+16;y,SCREEN_TOP+151);
	OnCommand=function(self)
		self:settextf("--");
		self:sleep(10);
		self:queuecommand("Update");
	end;
	UpdateCommand=function(self)
		self:diffuse(color("#00FF00"));
		self:settextf("OK");
	end;
};

t[#t+1] = LoadFont("_service")..{
	InitCommand=cmd(x,SCREEN_CENTER_X+16;y,SCREEN_TOP+167);
	OnCommand=function(self)
		self:settextf("--");
		self:sleep(20);
		self:queuecommand("Update");
	end;
	UpdateCommand=function(self)
		self:diffuse(color("#00FF00"));
		self:settextf("OK");
	end;
};

t[#t+1] = LoadFont("_service")..{
	InitCommand=cmd(x,SCREEN_CENTER_X+16;y,SCREEN_TOP+183);
	OnCommand=function(self)
		self:settextf("--");
		self:sleep(30);
		self:queuecommand("Update");
	end;
	UpdateCommand=function(self)
		self:diffuse(color("#00FF00"));
		self:settextf("OK");
	end;
};

t[#t+1] = LoadFont("_service")..{
	InitCommand=cmd(x,SCREEN_CENTER_X+16;y,SCREEN_TOP+199);
	OnCommand=function(self)
		self:settextf("--");
		self:sleep(40);
		self:queuecommand("Update");
	end;
	UpdateCommand=function(self)
		self:diffuse(color("#00FF00"));
		self:settextf("OK");
	end;
};

t[#t+1] = LoadFont("_service")..{
	InitCommand=cmd(x,SCREEN_CENTER_X-249;y,SCREEN_TOP+263);
	OnCommand=function(self)
		self:horizalign(left);
		self:settextf("FLASH ROM CHECKING ...");
		self:sleep(40);
		self:queuecommand("Update");
	end;
	UpdateCommand=function(self)
		self:settextf("CHECK COMPLETE.");
	end;
};

t[#t+1] = LoadFont("_service")..{
	InitCommand=cmd(x,SCREEN_CENTER_X+88;y,SCREEN_TOP+279);
	OnCommand=function(self)
		if perc == 100 then
			self:settextf("");
		else
			self:horizalign(right);
			self:settextf(perc.." * Complete");
			self:queuecommand("Incr");
		end;
	end;
	IncrCommand=function(self)
		perc = perc+1;
		self:sleep(timeunit);
		self:queuecommand("On");
	end;
};

t[#t+1] = LoadFont("_service")..{
	InitCommand=cmd(x,SCREEN_CENTER_X-281;y,SCREEN_BOTTOM-53);
	OnCommand=function(self)
		self:horizalign(left);
		self:settextf("HOLD 1P START BUTTON = ABORT CHECK");
		self:sleep(40);
		self:queuecommand("Update");
	end;
	UpdateCommand=function(self)
		self:settextf("HOLD 1P START BUTTON = EXIT");
	end;
};

return t
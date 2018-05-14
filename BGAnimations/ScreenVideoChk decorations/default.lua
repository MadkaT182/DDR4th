local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame {
	LoadActor( "bg" )..{
		OnCommand=cmd(Center);
	}
};

t[#t+1] = Def.Quad{
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_TOP+48;zoomto,268,44;diffusecolor,color("#000000"););
};

t[#t+1] = LoadFont("_service")..{
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_TOP+51);
	OnCommand=function(self)
		self:settextf("SCREEN CHECK");
	end;
};

t[#t+1] = Def.Quad{
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-48;zoomto,460,44;diffusecolor,color("#000000"););
};

t[#t+1] = LoadFont("_service")..{
	InitCommand=cmd(x,SCREEN_CENTER_X+13;y,SCREEN_BOTTOM-45);
	OnCommand=function(self)
		self:settextf("PRESS 1P START BUTTON = EXIT");
	end;
};

return t
-- ScreenGameplay failed
local travelDist = SCREEN_WIDTH*1.9;
local LeftToRight = Def.ActorFrame{
	LoadActor("_LeftToRight");
	Def.Quad{
		InitCommand=cmd(addx,-64;diffuse,color("#000000FF");halign,1;zoomto,travelDist,32);
	};
};

local RightToLeft = Def.ActorFrame{
	LoadActor("_RightToLeft");
	Def.Quad{
		InitCommand=cmd(addx,64;diffuse,color("#000000FF");halign,0;zoomto,travelDist,32);
	};
};

local t = Def.ActorFrame{
	-- LeftToRight x7
	LeftToRight..{
		InitCommand=cmd(x,SCREEN_LEFT-64;y,SCREEN_CENTER_Y-192);
		OnCommand=cmd(linear,1.2;addx,travelDist);
	};
	LeftToRight..{
		InitCommand=cmd(x,SCREEN_LEFT-128;y,SCREEN_CENTER_Y-128);
		OnCommand=cmd(linear,1.2;addx,travelDist);
	};
	LeftToRight..{
		InitCommand=cmd(x,SCREEN_LEFT-192;y,SCREEN_CENTER_Y-64);
		OnCommand=cmd(linear,1.2;addx,travelDist);
	};
	LeftToRight..{
		InitCommand=cmd(x,SCREEN_LEFT-256;y,SCREEN_CENTER_Y);
		OnCommand=cmd(linear,1.2;addx,travelDist);
	};
	LeftToRight..{
		InitCommand=cmd(x,SCREEN_LEFT-320;y,SCREEN_CENTER_Y+64);
		OnCommand=cmd(linear,1.2;addx,travelDist);
	};
	LeftToRight..{
		InitCommand=cmd(x,SCREEN_LEFT-384;y,SCREEN_CENTER_Y+128);
		OnCommand=cmd(linear,1.2;addx,travelDist);
	};
	LeftToRight..{
		InitCommand=cmd(x,SCREEN_LEFT-448;y,SCREEN_CENTER_Y+192);
		OnCommand=cmd(linear,1.2;addx,travelDist);
	};
	-- RightToLeft x8
	RightToLeft..{
		InitCommand=cmd(x,SCREEN_RIGHT+512;y,SCREEN_CENTER_Y-224);
		OnCommand=cmd(linear,1.2;addx,-travelDist);
	};
	RightToLeft..{
		InitCommand=cmd(x,SCREEN_RIGHT+448;y,SCREEN_CENTER_Y-160);
		OnCommand=cmd(linear,1.2;addx,-travelDist);
	};
	RightToLeft..{
		InitCommand=cmd(x,SCREEN_RIGHT+384;y,SCREEN_CENTER_Y-96);
		OnCommand=cmd(linear,1.2;addx,-travelDist);
	};
	RightToLeft..{
		InitCommand=cmd(x,SCREEN_RIGHT+320;y,SCREEN_CENTER_Y-32);
		OnCommand=cmd(linear,1.2;addx,-travelDist);
	};
	RightToLeft..{
		InitCommand=cmd(x,SCREEN_RIGHT+256;y,SCREEN_CENTER_Y+32);
		OnCommand=cmd(linear,1.2;addx,-travelDist);
	};
	RightToLeft..{
		InitCommand=cmd(x,SCREEN_RIGHT+192;y,SCREEN_CENTER_Y+96);
		OnCommand=cmd(linear,1.2;addx,-travelDist);
	};
	RightToLeft..{
		InitCommand=cmd(x,SCREEN_RIGHT+128;y,SCREEN_CENTER_Y+160);
		OnCommand=cmd(linear,1.2;addx,-travelDist);
	};
	RightToLeft..{
		InitCommand=cmd(x,SCREEN_RIGHT+64;y,SCREEN_CENTER_Y+224);
		OnCommand=cmd(linear,1.2;addx,-travelDist);
	};

	LoadActor("_failed")..{
		InitCommand=cmd(Center;diffusealpha,0;zoom,4);
		OnCommand=cmd(sleep,0.5;decelerate,0.6;diffusealpha,1;zoom,1;sleep,2;linear,0.5;diffusealpha,0);
	};
};

return t;
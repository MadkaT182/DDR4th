local t = Def.ActorFrame{
	LoadFont("_green gradient")..{
		Name="ThemeName";
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-150;settext,"Dance Dance Revolution 5th Mix theme for StepMania 5";diffuse,color("#00CCFF"));
	};
	LoadFont("_green gradient")..{
		Name="ThemeVersion";
		InitCommand=cmd(x,SCREEN_CENTER_X-260;y,SCREEN_CENTER_Y-120;halign,0;settext,themeVersion;diffuse,color("#FF8800"));
	};
	LoadFont("_green gradient")..{
		Name="ThemeDate";
		InitCommand=cmd(x,SCREEN_CENTER_X-260;y,SCREEN_CENTER_Y-106;halign,0;settext,themeDate;diffuse,color("#88FF00"));
	};
	LoadFont("_green gradient")..{
		Name="Presented";
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-60;settext,"Presented by freem\nBased off of work done by PatrickIIDX";diffuse,color("#00CCFF"));
	};
	LoadFont("_green gradient")..{
		Name="Warning";
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;settext,"It is illegal to use this theme in\nan arcade for monetary purposes.";diffuseshift;effectperiod,0.25;effectcolor1,color("0.75,0,0,1");effectcolor2,color("1,0,0,1");strokecolor,color("0.15,0,0,1"));
	};
	LoadFont("_green gradient")..{
		Name="FX";
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;settext,"It is illegal to use this theme in\nan arcade for monetary purposes.";diffusealpha,0.25;blend,Blend.Add;glowshift;effectperiod,0.25;effectcolor1,color("1,1,1,0");effectcolor2,color("1,1,1,0.75");glowmode,'GlowMode_Inner');
	};
};

-- bottom scrolling section
--[[
local charIcons = {};
-- todo: search Graphics\_char icons\ for "_base" files, then get the names and
-- put them in charIcons.

local CharScroller = Def.ActorFrame{
	Def.ActorScroller{
		
	};
};
--]]

return t;
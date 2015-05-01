local gc = Var("GameCommand");
local name = gc:GetName()
local text = gc:GetText()

local itemColors = {
	EditSongs = color("#FFEF00"),
	Export = color("#EFFF00"), 
	EditCourses = color("#9CFF00"),
	Exit = color("#FFB500"),
};

local t = Def.ActorFrame {
	LoadActor("_"..name)..{
		GainFocusCommand=cmd(diffuse,color("1,1,1,1"));
		LoseFocusCommand=cmd(diffuse,color("0.5,0.5,0.5,1"));
	};
	LoadFont("_2070polyester round 24px")..{
		InitCommand=cmd(y,-3;uppercase,true;settext,text;);
		GainFocusCommand=cmd(diffuse,itemColors[name];strokecolor,color("#00297B"));
		LoseFocusCommand=cmd(diffuse,BoostColor(itemColors[name],0.5);strokecolor,BoostColor(color("#00297B"),0.5));
	};
	LoadActor("_glow")..{
		InitCommand=cmd(blend,Blend.Add;diffusealpha,0.5;diffuseshift;effectcolor1,color("1,1,1,0.5");effectcolor2,color("1,1,1,0"));
		GainFocusCommand=cmd(visible,true);
		LoseFocusCommand=cmd(visible,false);
	};
};

return t;
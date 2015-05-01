local text = ...
assert(text)

local t = Def.ActorFrame{
	LoadActor("_header");
	LoadFont("_2070polyester round 24px")..{
		InitCommand=cmd(x,130;y,1;zoom,0.475;uppercase,true;settext,text;diffuse,color("#FFB53A"));
	};
};

return t;
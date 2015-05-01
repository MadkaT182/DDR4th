local t = Def.ActorFrame{
	LoadActor(THEME:GetPathG("_diet menu","header"));
	LoadFont("_2070polyester round 24px")..{
		InitCommand=cmd(x,130;y,1;zoom,0.475;uppercase,true;settext,"Diet Diary";diffuse,color("#FFB53A"));
	};
};

return t;
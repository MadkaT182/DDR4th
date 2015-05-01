return Def.ActorFrame{
	LoadActor(THEME:GetPathB("_edit", "bg"));
	LoadActor("_frame")..{
		InitCommand=cmd(x,SCREEN_CENTER_X-73;y,SCREEN_CENTER_Y+10);
	};
	LoadActor("_arrow 1x6")..{
		Name="UpArrow";
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-139);
	};
	LoadActor("_arrow 1x6")..{
		Name="DownArrow";
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y+149;zoomy,-1);
	};
	LoadFont("_2070polyester round 24px") .. {
		InitCommand=cmd(x,SCREEN_CENTER_X-232;y,SCREEN_CENTER_Y-108;zoomy,18/24;zoomx,16.25/24;rotationz,-90;uppercase,true;settext,"Contents";diffuse,color("#004090");strokecolor,color("0,0,0,0");halign,1);
	};
};
-- temporary screen cancel.
-- todo: use stars from 5th mix home version (how the hell do I do that?!)
return Def.Quad{
	InitCommand=cmd(Center;FullScreen;diffuse,color("0,0,0,1");cropbottom,1;fadebottom,1);
	OnCommand=cmd(decelerate,0.5;cropbottom,0;fadebottom,0);
};
local ARFix = 53;

if IsUsingWideScreen() == true then
	ARFix = 0;
end;

return Def.ActorFrame {
	LoadActor( "starpink" )..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-191);
	};
	Def.Quad{
		OnCommand=cmd(x,SCREEN_WIDTH+278-ARFix;y,SCREEN_CENTER_Y-191;zoomto,SCREEN_WIDTH*1.5,32;diffusecolor,Color.Black);
	};
	LoadActor( "starpink" )..{
		OnCommand=cmd(x,SCREEN_CENTER_X+78;y,SCREEN_CENTER_Y-127);
	};
	Def.Quad{
		OnCommand=cmd(x,SCREEN_WIDTH+356-ARFix;y,SCREEN_CENTER_Y-127;zoomto,SCREEN_WIDTH*1.5,32;diffusecolor,Color.Black);
	};
	LoadActor( "starpink" )..{
		OnCommand=cmd(x,SCREEN_CENTER_X+158;y,SCREEN_CENTER_Y-63);
	};
	Def.Quad{
		OnCommand=cmd(x,SCREEN_WIDTH+436-ARFix;y,SCREEN_CENTER_Y-63;zoomto,SCREEN_WIDTH*1.5,32;diffusecolor,Color.Black);
	};
	LoadActor( "starpink" )..{
		OnCommand=cmd(x,SCREEN_CENTER_X+238;y,SCREEN_CENTER_Y+1);
	};
	Def.Quad{
		OnCommand=cmd(x,SCREEN_WIDTH+516-ARFix;y,SCREEN_CENTER_Y+1;zoomto,SCREEN_WIDTH*1.5,32;diffusecolor,Color.Black);
	};
	LoadActor( "starpink" )..{
		OnCommand=cmd(x,SCREEN_CENTER_X+158;y,SCREEN_CENTER_Y+65);
	};
	Def.Quad{
		OnCommand=cmd(x,SCREEN_WIDTH+436-ARFix;y,SCREEN_CENTER_Y+65;zoomto,SCREEN_WIDTH*1.5,32;diffusecolor,Color.Black);
	};
	LoadActor( "starpink" )..{
		OnCommand=cmd(x,SCREEN_CENTER_X+78;y,SCREEN_CENTER_Y+129);
	};
	Def.Quad{
		OnCommand=cmd(x,SCREEN_WIDTH+356-ARFix;y,SCREEN_CENTER_Y+129;zoomto,SCREEN_WIDTH*1.5,32;diffusecolor,Color.Black);
	};
	LoadActor( "starpink" )..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+193);
	};
	Def.Quad{
		OnCommand=cmd(x,SCREEN_WIDTH+278-ARFix;y,SCREEN_CENTER_Y+193;zoomto,SCREEN_WIDTH*1.5,32;diffusecolor,Color.Black);
	};
};
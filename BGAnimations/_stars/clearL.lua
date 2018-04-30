local ARFix = 53;

if IsUsingWideScreen() == true then
	ARFix = 0;
end;

return Def.ActorFrame {
	LoadActor( "starpink" )..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-223;zoomx,-1);
	};
	Def.Quad{
		OnCommand=cmd(x,-277+ARFix;y,SCREEN_CENTER_Y-223;zoomto,SCREEN_WIDTH*1.5,32;diffusecolor,Color.Black);
	};
	LoadActor( "starpink" )..{
		OnCommand=cmd(x,SCREEN_CENTER_X-80;y,SCREEN_CENTER_Y-159;zoomx,-1);
	};
	Def.Quad{
		OnCommand=cmd(x,-357+ARFix;y,SCREEN_CENTER_Y-159;zoomto,SCREEN_WIDTH*1.5,32;diffusecolor,Color.Black);
	};
	LoadActor( "starpink" )..{
		OnCommand=cmd(x,SCREEN_CENTER_X-160;y,SCREEN_CENTER_Y-95;zoomx,-1);
	};
	Def.Quad{
		OnCommand=cmd(x,-437+ARFix;y,SCREEN_CENTER_Y-95;zoomto,SCREEN_WIDTH*1.5,32;diffusecolor,Color.Black);
	};
	LoadActor( "starpink" )..{
		OnCommand=cmd(x,SCREEN_CENTER_X-240;y,SCREEN_CENTER_Y-31;zoomx,-1);
	};
	Def.Quad{
		OnCommand=cmd(x,-517+ARFix;y,SCREEN_CENTER_Y-31;zoomto,SCREEN_WIDTH*1.5,32;diffusecolor,Color.Black);
	};
	LoadActor( "starpink" )..{
		OnCommand=cmd(x,SCREEN_CENTER_X-240;y,SCREEN_CENTER_Y+33;zoomx,-1);
	};
	Def.Quad{
		OnCommand=cmd(x,-517+ARFix;y,SCREEN_CENTER_Y+33;zoomto,SCREEN_WIDTH*1.5,32;diffusecolor,Color.Black);
	};
	LoadActor( "starpink" )..{
		OnCommand=cmd(x,SCREEN_CENTER_X-160;y,SCREEN_CENTER_Y+97;zoomx,-1);
	};
	Def.Quad{
		OnCommand=cmd(x,-437+ARFix;y,SCREEN_CENTER_Y+97;zoomto,SCREEN_WIDTH*1.5,32;diffusecolor,Color.Black);
	};
	LoadActor( "starpink" )..{
		OnCommand=cmd(x,SCREEN_CENTER_X-80;y,SCREEN_CENTER_Y+161;zoomx,-1);
	};
	Def.Quad{
		OnCommand=cmd(x,-357+ARFix;y,SCREEN_CENTER_Y+161;zoomto,SCREEN_WIDTH*1.5,32;diffusecolor,Color.Black);
	};
	LoadActor( "starpink" )..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+225;zoomx,-1);
	};
	Def.Quad{
		OnCommand=cmd(x,-277+ARFix;y,SCREEN_CENTER_Y+225;zoomto,SCREEN_WIDTH*1.5,32;diffusecolor,Color.Black);
	};
};
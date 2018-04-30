local ARFix = 54;

if IsUsingWideScreen() == true then
	ARFix = 0;
end;

return Def.ActorFrame {
	LoadActor( "stard" )..{
		OnCommand=cmd(x,SCREEN_CENTER_X-140;y,SCREEN_CENTER_Y-225);
	};
	Def.Quad{
		OnCommand=cmd(x,SCREEN_WIDTH+124-ARFix;y,SCREEN_CENTER_Y-225;zoomto,SCREEN_WIDTH*1.5,30;diffusecolor,Color.Black);
	};
	LoadActor( "stard" )..{
		OnCommand=cmd(x,SCREEN_CENTER_X-100;y,SCREEN_CENTER_Y-165);
	};
	Def.Quad{
		OnCommand=cmd(x,SCREEN_WIDTH+164-ARFix;y,SCREEN_CENTER_Y-165;zoomto,SCREEN_WIDTH*1.5,30;diffusecolor,Color.Black);
	};
	LoadActor( "stard" )..{
		OnCommand=cmd(x,SCREEN_CENTER_X-60;y,SCREEN_CENTER_Y-105);
	};
	Def.Quad{
		OnCommand=cmd(x,SCREEN_WIDTH+204-ARFix;y,SCREEN_CENTER_Y-105;zoomto,SCREEN_WIDTH*1.5,30;diffusecolor,Color.Black);
	};
	LoadActor( "stard" )..{
		OnCommand=cmd(x,SCREEN_CENTER_X-20;y,SCREEN_CENTER_Y-45);
	};
	Def.Quad{
		OnCommand=cmd(x,SCREEN_WIDTH+244-ARFix;y,SCREEN_CENTER_Y-45;zoomto,SCREEN_WIDTH*1.5,30;diffusecolor,Color.Black);
	};
	LoadActor( "stard" )..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+15);
	};
	Def.Quad{
		OnCommand=cmd(x,SCREEN_WIDTH+264-ARFix;y,SCREEN_CENTER_Y+15;zoomto,SCREEN_WIDTH*1.5,30;diffusecolor,Color.Black);
	};
	LoadActor( "stard" )..{
		OnCommand=cmd(x,SCREEN_CENTER_X-40;y,SCREEN_CENTER_Y+75);
	};
	Def.Quad{
		OnCommand=cmd(x,SCREEN_WIDTH+224-ARFix;y,SCREEN_CENTER_Y+75;zoomto,SCREEN_WIDTH*1.5,30;diffusecolor,Color.Black);
	};
	LoadActor( "stard" )..{
		OnCommand=cmd(x,SCREEN_CENTER_X-80;y,SCREEN_CENTER_Y+135);
	};
	Def.Quad{
		OnCommand=cmd(x,SCREEN_WIDTH+184-ARFix;y,SCREEN_CENTER_Y+135;zoomto,SCREEN_WIDTH*1.5,30;diffusecolor,Color.Black);
	};
	LoadActor( "stard" )..{
		OnCommand=cmd(x,SCREEN_CENTER_X-120;y,SCREEN_CENTER_Y+195);
	};
	Def.Quad{
		OnCommand=cmd(x,SCREEN_WIDTH+144-ARFix;y,SCREEN_CENTER_Y+195;zoomto,SCREEN_WIDTH*1.5,30;diffusecolor,Color.Black);
	};
};
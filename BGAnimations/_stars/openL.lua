local ARFix = 53;

if IsUsingWideScreen() == true then
	ARFix = 0;
end;

return Def.ActorFrame {
	LoadActor( "starb" )..{
		OnCommand=cmd(x,SCREEN_CENTER_X+120;y,SCREEN_CENTER_Y-195);
	};
	Def.Quad{
		OnCommand=cmd(x,-143+ARFix;y,SCREEN_CENTER_Y-195;zoomto,SCREEN_WIDTH*1.5,30;diffusecolor,Color.Black);
	};
	LoadActor( "starb" )..{
		OnCommand=cmd(x,SCREEN_CENTER_X+80;y,SCREEN_CENTER_Y-135);
	};
	Def.Quad{
		OnCommand=cmd(x,-183+ARFix;y,SCREEN_CENTER_Y-135;zoomto,SCREEN_WIDTH*1.5,30;diffusecolor,Color.Black);
	};
	LoadActor( "starb" )..{
		OnCommand=cmd(x,SCREEN_CENTER_X+40;y,SCREEN_CENTER_Y-75);
	};
	Def.Quad{
		OnCommand=cmd(x,-223+ARFix;y,SCREEN_CENTER_Y-75;zoomto,SCREEN_WIDTH*1.5,30;diffusecolor,Color.Black);
	};
	LoadActor( "starb" )..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-15);
	};
	Def.Quad{
		OnCommand=cmd(x,-263+ARFix;y,SCREEN_CENTER_Y-15;zoomto,SCREEN_WIDTH*1.5,30;diffusecolor,Color.Black);
	};
	LoadActor( "starb" )..{
		OnCommand=cmd(x,SCREEN_CENTER_X+20;y,SCREEN_CENTER_Y+45);
	};
	Def.Quad{
		OnCommand=cmd(x,-243+ARFix;y,SCREEN_CENTER_Y+45;zoomto,SCREEN_WIDTH*1.5,30;diffusecolor,Color.Black);
	};
	LoadActor( "starb" )..{
		OnCommand=cmd(x,SCREEN_CENTER_X+60;y,SCREEN_CENTER_Y+105);
	};
	Def.Quad{
		OnCommand=cmd(x,-203+ARFix;y,SCREEN_CENTER_Y+105;zoomto,SCREEN_WIDTH*1.5,30;diffusecolor,Color.Black);
	};
	LoadActor( "starb" )..{
		OnCommand=cmd(x,SCREEN_CENTER_X+100;y,SCREEN_CENTER_Y+165);
	};
	Def.Quad{
		OnCommand=cmd(x,-163+ARFix;y,SCREEN_CENTER_Y+165;zoomto,SCREEN_WIDTH*1.5,30;diffusecolor,Color.Black);
	};
	LoadActor( "starb" )..{
		OnCommand=cmd(x,SCREEN_CENTER_X+140;y,SCREEN_CENTER_Y+225);
	};
	Def.Quad{
		OnCommand=cmd(x,-123+ARFix;y,SCREEN_CENTER_Y+225;zoomto,SCREEN_WIDTH*1.5,30;diffusecolor,Color.Black);
	};
};
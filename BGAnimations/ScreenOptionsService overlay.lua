local t = Def.ActorFrame{
	LoadFont("_service")..{
		Name="Header";
		InitCommand=cmd(CenterX;y,SCREEN_TOP+23;settext,"MAIN MENU");
	};

	Def.ActorFrame{
		Name="Help";
		InitCommand=cmd(x,SCREEN_CENTER_X-263;y,SCREEN_BOTTOM-82);
		LoadFont("_service")..{
			InitCommand=cmd(halign,0;uppercase,true;settext,"Press 1P Left/Right = Select Item");
		};
		LoadFont("_service")..{
			InitCommand=cmd(y,16;halign,0;uppercase,true;settext,"Press 1P Start Button = Do Check");
		};
	};

	LoadFont("_service")..{
		Name="Version";
		InitCommand=cmd(x,SCREEN_CENTER_X+320;y,SCREEN_BOTTOM-9;halign,1;uppercase,true;settext,"VER:"..themeVersion);
	};
};

return t;
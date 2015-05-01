-- ScreenSelectStyle/Solo (partially converted; some items need a y shift of -12)
local masterPlayer = GAMESTATE:GetMasterPlayerNumber() == PLAYER_1 and "P1" or "P2"

local t = Def.ActorFrame{
	LoadActor(THEME:GetPathG("_pad","solo"))..{
		InitCommand=cmd(x,SCREEN_CENTER_X+160;y,SCREEN_CENTER_Y+71;cropbottom,1);
		OnCommand=cmd(linear,0.5;cropbottom,0);
		OffCommand=cmd(linear,0.5;cropbottom,1);
		GainFocusCommand=cmd(diffuse,color("1,1,1,1"));
		LoseFocusCommand=cmd(diffuse,color("0.25,0.25,0.25,1"));
	};
	LoadActor(THEME:GetPathG("","_dancers/dancer"..masterPlayer))..{
		InitCommand=cmd(x,SCREEN_CENTER_X+160;y,SCREEN_CENTER_Y-25;cropbottom,1);
		OnCommand=cmd(linear,0.5;cropbottom,0);
		OffCommand=cmd(linear,0.5;cropbottom,1);
		GainFocusCommand=cmd(diffuse,color("1,1,1,1");play);
		LoseFocusCommand=cmd(diffuse,color("0.55,0.55,0.55,1");pause);
	};

	Def.ActorFrame{
		Name="StageBubbleFrame";
		InitCommand=cmd(x,SCREEN_CENTER_X+240;y,SCREEN_CENTER_Y-1);
		GainFocusCommand=cmd(linear,0.2;y,SCREEN_CENTER_Y-96);
		LoseFocusCommand=cmd(linear,0.2;y,SCREEN_CENTER_Y-1);
		LoadActor(THEME:GetPathG("_stage bubble","left"))..{
			OffCommand=cmd(linear,0.5;cropbottom,1);
			GainFocusCommand=cmd(bob;effectmagnitude,0,-10,0;diffuse,color("1,1,1,1"););
			LoseFocusCommand=cmd(stopeffect;diffuse,color("0.5,0.5,0.5,1"));
		};
		LoadFont("ScreenSelectStyle NumStages")..{
			Text=PREFSMAN:GetPreference("SongsPerPlay");
			InitCommand=cmd(x,-25;y,-9;);
			OffCommand=cmd(sleep,0.25;diffusealpha,0);
			GainFocusCommand=cmd(bob;effectmagnitude,0,-10,0;diffuse,color("1,1,1,1"););
			LoseFocusCommand=cmd(stopeffect;diffuse,color("0.5,0.5,0.5,1"));
		};
		Def.Quad{
			InitCommand=cmd(x,-25;y,2;zoomto,22,20;valign,1;diffuse,color("#9CFF00"));
			OnCommand=cmd(linear,0.5;zoomy,0);
			OffCommand=cmd(linear,0.25;zoomy,10;sleep,0.01;cropbottom,0.6;linear,0.25;zoomy,20;cropbottom,1);
			GainFocusCommand=cmd(bob;effectmagnitude,0,10,0;diffuse,color("#9CFF00"));
			LoseFocusCommand=cmd(stopeffect;diffuse,color("#4A7B00"));
		};
	};

	LoadActor("_label")..{
		InitCommand=cmd(x,SCREEN_CENTER_X-176;y,SCREEN_CENTER_Y+156);
		OffCommand=cmd(linear,0.5;cropbottom,1);
		GainFocusCommand=cmd(visible,true);
		LoseFocusCommand=cmd(visible,false);
	};
	
};

return t;
-- ScreenSelectStyle/Versus
local masterPlayer = GAMESTATE:GetMasterPlayerNumber() == PLAYER_1 and "P1" or "P2"
local secondPlayer = GAMESTATE:GetMasterPlayerNumber() == PLAYER_1 and "P2" or "P1"

local t = Def.ActorFrame{
	LoadActor(THEME:GetPathG("_pad","double"))..{
		OnCommand=cmd(x,SCREEN_LEFT-140;y,SCREEN_CENTER_Y+80;sleep,0.5;linear,0.25;x,SCREEN_CENTER_X+20);
		GainFocusCommand=cmd(linear,0.2;diffuse,color("1,1,1,1"));
		LoseFocusCommand=cmd(linear,0.2;diffuse,color("0.5,0.5,0.5,1"));
	};
	LoadActor(THEME:GetPathG("","_dancers/dancer"..masterPlayer))..{
		OnCommand=cmd(x,SCREEN_CENTER_X-32;y,SCREEN_TOP-100;sleep,0.8;linear,0.1;y,SCREEN_CENTER_Y-12);
		GainFocusCommand=cmd(linear,0.2;diffuse,color("1,1,1,1");play);
		LoseFocusCommand=cmd(linear,0.2;diffuse,color("#580830");pause);
	};
	LoadActor(THEME:GetPathG("","_dancers/dancer"..secondPlayer))..{
		OnCommand=cmd(x,SCREEN_CENTER_X+72;y,SCREEN_TOP-100;sleep,0.8;linear,0.1;y,SCREEN_CENTER_Y-12);
		GainFocusCommand=cmd(linear,0.2;diffuse,color("1,1,1,1");play);
		LoseFocusCommand=cmd(linear,0.2;diffuse,color("#580830");pause);
	};
	Def.ActorFrame{
		Name="StageBubbleFrame";
		InitCommand=cmd(x,SCREEN_CENTER_X+66;y,SCREEN_CENTER_Y+108);
		LoadActor(THEME:GetPathG("_stage bubble","left"))..{
			InitCommand=cmd(cropbottom,1);
			OnCommand=cmd(linear,0.5;cropbottom,0);
		};
		LoadFont("ScreenSelectStyleBlue NumStages")..{
			Text=PREFSMAN:GetPreference("SongsPerPlay");
			InitCommand=cmd(x,-58;y,-1;);
		};
	};
	LoadActor("_label")..{
		InitCommand=cmd(y,SCREEN_CENTER_Y-148);
		OnCommand=function(self)
			if GAMESTATE:GetNumPlayersEnabled() == 1 then
				self:diffusealpha(0):sleep(1.25):diffusealpha(1);
				self:x(SCREEN_CENTER_X-320);
				self:linear(0.2);
				self:x(SCREEN_CENTER_X-130);
			end
		end;
		OffCommand=cmd(linear,0.5;faderight,10);
		GainFocusCommand=function(self)
				self:visible(true)
				self:x(SCREEN_CENTER_X-320);
				self:linear(0.2);
				self:x(SCREEN_CENTER_X-130);
		end;
		LoseFocusCommand=cmd(visible,false);
		};
	};

return t;
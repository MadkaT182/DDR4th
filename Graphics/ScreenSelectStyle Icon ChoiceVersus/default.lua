-- ScreenSelectStyle/Versus
local masterPlayer = GAMESTATE:GetMasterPlayerNumber() == PLAYER_1 and "P1" or "P2"
local secondPlayer = GAMESTATE:GetMasterPlayerNumber() == PLAYER_1 and "P2" or "P1"

local t = Def.ActorFrame{
	LoadActor(THEME:GetPathG("_pad","double"))..{
		InitCommand=cmd(x,SCREEN_CENTER_X-4;y,SCREEN_CENTER_Y+80;cropbottom,1);
		OnCommand=cmd(linear,0.5;cropbottom,0);
		OffCommand=cmd(linear,0.5;cropbottom,1);
		GainFocusCommand=cmd(diffuse,color("1,1,1,1"));
		LoseFocusCommand=cmd(diffuse,color("0.25,0.25,0.25,1"));
	};
	LoadActor(THEME:GetPathG("","_dancers/dancer"..masterPlayer))..{
		InitCommand=cmd(x,SCREEN_CENTER_X-48;y,SCREEN_CENTER_Y-17;cropbottom,1);
		OnCommand=cmd(linear,0.5;cropbottom,0);
		OffCommand=cmd(linear,0.5;cropbottom,1);
		GainFocusCommand=cmd(diffuse,color("1,1,1,1");play);
		LoseFocusCommand=cmd(diffuse,color("0.55,0.55,0.55,1");pause);
	};
	LoadActor(THEME:GetPathG("","_dancers/dancer"..secondPlayer))..{
		InitCommand=cmd(x,SCREEN_CENTER_X+39;y,SCREEN_CENTER_Y-15;cropbottom,1);
		OnCommand=cmd(linear,0.5;cropbottom,0);
		OffCommand=cmd(linear,0.5;cropbottom,1);
		GainFocusCommand=cmd(diffuse,color("1,1,1,1");play);
		LoseFocusCommand=cmd(diffuse,color("0.5,0.5,0.5,1");pause);
	};

	-- join
	LoadActor(THEME:GetPathG("_selstyle","join "..secondPlayer))..{
		InitCommand=cmd(x,SCREEN_CENTER_X+40;y,SCREEN_CENTER_Y-87;diffuseshift;effectcolor1,color("1,1,1,1");effectcolor2,color("0,0,0,1");effectperiod,0.5;cropbottom,1);
		BeginCommand=function(self)
			-- don't show in Home mode.
			if GAMESTATE:GetCoinMode() == 'CoinMode_Home' then
				self:visible(false)
			end;
			-- don't show if Joint Premium is on
			if PREFSMAN:GetPreference("Premium") == "Premium_2PlayersFor1Credit" then
				self:visible(false)
			end
		end;
		OnCommand=cmd(linear,0.5;cropbottom,0);
		OffCommand=cmd(linear,0.5;cropbottom,1);
		PlayerJoinedMessageCommand=cmd(playcommand,"Off");
	};

	Def.ActorFrame{
		Name="StageBubbleFrame";
		InitCommand=cmd(x,SCREEN_CENTER_X+66;y,SCREEN_CENTER_Y+108);
		LoadActor(THEME:GetPathG("_stage bubble","right"))..{
			InitCommand=cmd(cropbottom,1);
			OnCommand=cmd(linear,0.5;cropbottom,0);
			OffCommand=cmd(linear,0.5;cropbottom,1);
		};
		LoadFont("ScreenSelectStyle NumStages")..{
			Text=PREFSMAN:GetPreference("SongsPerPlay");
			InitCommand=cmd(x,-58;y,-1;);
			OffCommand=cmd(sleep,0.25;diffusealpha,0);
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
		InitCommand=cmd(x,SCREEN_CENTER_X-145;y,SCREEN_CENTER_Y-148);
		OnCommand=function(self)
			if GAMESTATE:GetNumPlayersEnabled() == 1 then
				self:cropbottom(1);
				self:linear(0.5);
				self:cropbottom(0);
			end
		end;
		OffCommand=cmd(linear,0.5;cropbottom,1);
		GainFocusCommand=cmd(visible,true);
		LoseFocusCommand=cmd(visible,false);
	};
	
};

return t;
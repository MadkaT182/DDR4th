-- ScreenSelectStyle/Single
local masterPlayer = GAMESTATE:GetMasterPlayerNumber() == PLAYER_1 and "P1" or "P2"
local unjoinedPlayer = GAMESTATE:GetMasterPlayerNumber() == PLAYER_1 and "P2" or "P1"

local t = Def.ActorFrame{
	LoadActor(THEME:GetPathG("_pad","single"))..{
		OnCommand=cmd(x,SCREEN_LEFT-100;y,SCREEN_CENTER_Y+120;sleep,0.75;linear,0.1;x,SCREEN_CENTER_X-210);
		GainFocusCommand=cmd(diffuse,color("1,1,1,1"));
		LoseFocusCommand=cmd(diffuse,color("0.25,0.25,0.25,1"));
	};
	LoadActor(THEME:GetPathG("","_dancers/dancer"..masterPlayer))..{
		BeginCommand=cmd(playcommand,"CheckNumPlayers");
		OnCommand=cmd(x,SCREEN_CENTER_X-210;y,SCREEN_TOP-100;sleep,0.8;linear,0.1;y,SCREEN_CENTER_Y+25);
		GainFocusCommand=cmd(linear,0.2;diffuse,color("1,1,1,1");play);
		LoseFocusCommand=cmd(linear,0.2;diffuse,color("#580830");pause);
		PlayerJoinedMessageCommand=cmd(playcommand,"CheckNumPlayers");
		CheckNumPlayersCommand=function(self,param)
			if GAMESTATE:GetNumPlayersEnabled() > 1 then
				self:visible(false)
				-- reload metrics to disable going back to Single
				THEME:ReloadMetrics()
			end
		end;
	};
	Def.ActorFrame{
		Name="StageBubbleFrame";
		InitCommand=cmd(x,SCREEN_CENTER_X-187;y,SCREEN_CENTER_Y+158);
		LoadActor(THEME:GetPathG("_stage bubble","right"))..{
		};
		LoadFont("ScreenSelectStyle NumStages")..{
			Text=PREFSMAN:GetPreference("SongsPerPlay");
			InitCommand=cmd(x,-59;y,-1;);
		};
	};
	
	LoadActor("_label")..{
		InitCommand=cmd(x,SCREEN_CENTER_X-130;y,SCREEN_CENTER_Y-148);
		OnCommand=function(self)
			if GAMESTATE:GetNumPlayersEnabled() == 1 then
				self:diffusealpha(0):sleep(0.5):diffusealpha(1);
				self:addx(-190);
				self:linear(0.2);
				self:addx(190);
			end
		end;
		GainFocusCommand=function(self)
				self:visible(true)
				self:addx(-190);
				self:linear(0.2);
				self:addx(190);
		end;
		LoseFocusCommand=cmd(visible,false);
	};
};

return t;
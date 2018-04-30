local t = Def.ActorFrame {};

--GRADEP1---
if GAMESTATE:IsPlayerEnabled(PLAYER_1) then
	t[#t+1] = Def.ActorFrame {
		LoadActor("Grade_AA_Tier")..{
			InitCommand=cmd(x,SCREEN_CENTER_X-258;y,SCREEN_CENTER_Y+105;zoom,0);
			OnCommand=function(self)
				if(STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P1"):GetGrade()=="Grade_Tier01") then
					(cmd(sleep,2;zoom,1;diffusealpha,0;linear,0.5;diffusealpha,1))(self);
				end;
			end;
			OffCommand=cmd(linear,0.2;zoom,0);
		};

		LoadActor("Grade_AA_Tier")..{
			InitCommand=cmd(x,SCREEN_CENTER_X-258;y,SCREEN_CENTER_Y+105;zoom,0);
			OnCommand=function(self)
				if(STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P1"):GetGrade()=="Grade_Tier02") then
					(cmd(sleep,2;zoom,1;diffusealpha,0;linear,0.5;diffusealpha,1))(self);
				end;
			end;
			OffCommand=cmd(linear,0.2;zoom,0);
		};

		LoadActor("Grade_A_Tier")..{
			InitCommand=cmd(x,SCREEN_CENTER_X-258;y,SCREEN_CENTER_Y+105;zoom,0);
			OnCommand=function(self)
				if(STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P1"):GetGrade()=="Grade_Tier03") then
					(cmd(sleep,2;zoom,1;diffusealpha,0;linear,0.5;diffusealpha,1))(self);
				end;
			end;
			OffCommand=cmd(linear,0.2;zoom,0);
		};

		LoadActor("Grade_B_Tier")..{
			InitCommand=cmd(x,SCREEN_CENTER_X-258;y,SCREEN_CENTER_Y+105;zoom,0);
			OnCommand=function(self)
				if(STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P1"):GetGrade()=="Grade_Tier04") then
					(cmd(sleep,2;zoom,1;diffusealpha,0;linear,0.5;diffusealpha,1))(self);
				end;
			end;
			OffCommand=cmd(linear,0.2;zoom,0);
		};

		LoadActor("Grade_C_Tier")..{
			InitCommand=cmd(x,SCREEN_CENTER_X-258;y,SCREEN_CENTER_Y+105;zoom,0);
			OnCommand=function(self)
				if(STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P1"):GetGrade()=="Grade_Tier05") then
					(cmd(sleep,2;zoom,1;diffusealpha,0;linear,0.5;diffusealpha,1))(self);
				end;
			end;
			OffCommand=cmd(linear,0.2;zoom,0);
		};

		LoadActor("Grade_D_Tier")..{
			InitCommand=cmd(x,SCREEN_CENTER_X-258;y,SCREEN_CENTER_Y+105;zoom,0);
			OnCommand=function(self)
				if(STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P1"):GetGrade()=="Grade_Tier06") then
					(cmd(sleep,2;zoom,1;diffusealpha,0;linear,0.5;diffusealpha,1))(self);
				end;
			end;
			OffCommand=cmd(linear,0.2;zoom,0);
		};

		LoadActor("Grade_D_Tier")..{
			InitCommand=cmd(x,SCREEN_CENTER_X-258;y,SCREEN_CENTER_Y+105;zoom,0);
			OnCommand=function(self)
				if(STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P1"):GetGrade()=="Grade_Failed") then
					(cmd(sleep,2;zoom,1;diffusealpha,0;linear,0.5;diffusealpha,1))(self);
				end;
			end;
			OffCommand=cmd(linear,0.2;zoom,0);
		};
		--FullCombo Overlay
		-- LoadActor("star")..{
		-- 	InitCommand=cmd(x,SCREEN_CENTER_X-258;y,SCREEN_CENTER_Y+105;zoom,0);
		-- 	OnCommand=function(self)
		-- 	local staw = STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P1"):GetStageAward();
		-- 		if staw =="StageAward_SingleDigitW3" or staw =="StageAward_OneW3" or staw =="StageAward_FullComboW3" or staw =="StageAward_SingleDigitW2" or staw =="StageAward_OneW2" or staw =="StageAward_FullComboW2" or staw =="StageAward_FullComboW1" then
		-- 			(cmd(linear,0.2;zoom,1;wag))(self);
		-- 		end;
		-- 	end;
		-- 	OffCommand=cmd(linear,0.2;zoom,0);
		-- };
	};
end

--GRADEP2---
if GAMESTATE:IsPlayerEnabled(PLAYER_2) then
	t[#t+1] = Def.ActorFrame {
		LoadActor("Grade_AA_Tier")..{
			InitCommand=cmd(x,SCREEN_CENTER_X+43;y,SCREEN_CENTER_Y+105;zoom,0);
			OnCommand=function(self)
				if(STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P2"):GetGrade()=="Grade_Tier01") then
					(cmd(sleep,2;zoom,1;diffusealpha,0;linear,0.5;diffusealpha,1))(self);
				end;
			end;
			OffCommand=cmd(linear,0.2;zoom,0);
		};

		LoadActor("Grade_AA_Tier")..{
			InitCommand=cmd(x,SCREEN_CENTER_X+43;y,SCREEN_CENTER_Y+105;zoom,0);
			OnCommand=function(self)
				if(STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P2"):GetGrade()=="Grade_Tier02") then
					(cmd(sleep,2;zoom,1;diffusealpha,0;linear,0.5;diffusealpha,1))(self);
				end;
			end;
			OffCommand=cmd(linear,0.2;zoom,0);
		};

		LoadActor("Grade_A_Tier")..{
			InitCommand=cmd(x,SCREEN_CENTER_X+43;y,SCREEN_CENTER_Y+105;zoom,0);
			OnCommand=function(self)
				if(STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P2"):GetGrade()=="Grade_Tier03") then
					(cmd(sleep,2;zoom,1;diffusealpha,0;linear,0.5;diffusealpha,1))(self);
				end;
			end;
			OffCommand=cmd(linear,0.2;zoom,0);
		};

		LoadActor("Grade_B_Tier")..{
			InitCommand=cmd(x,SCREEN_CENTER_X+43;y,SCREEN_CENTER_Y+105;zoom,0);
			OnCommand=function(self)
				if(STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P2"):GetGrade()=="Grade_Tier04") then
					(cmd(sleep,2;zoom,1;diffusealpha,0;linear,0.5;diffusealpha,1))(self);
				end;
			end;
			OffCommand=cmd(linear,0.2;zoom,0);
		};

		LoadActor("Grade_C_Tier")..{
			InitCommand=cmd(x,SCREEN_CENTER_X+43;y,SCREEN_CENTER_Y+105;zoom,0);
			OnCommand=function(self)
				if(STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P2"):GetGrade()=="Grade_Tier05") then
					(cmd(sleep,2;zoom,1;diffusealpha,0;linear,0.5;diffusealpha,1))(self);
				end;
			end;
			OffCommand=cmd(linear,0.2;zoom,0);
		};

		LoadActor("Grade_D_Tier")..{
			InitCommand=cmd(x,SCREEN_CENTER_X+43;y,SCREEN_CENTER_Y+105;zoom,0);
			OnCommand=function(self)
				if(STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P2"):GetGrade()=="Grade_Tier06") then
					(cmd(sleep,2;zoom,1;diffusealpha,0;linear,0.5;diffusealpha,1))(self);
				end;
			end;
			OffCommand=cmd(linear,0.2;zoom,0);
		};

		LoadActor("Grade_D_Tier")..{
			InitCommand=cmd(x,SCREEN_CENTER_X+43;y,SCREEN_CENTER_Y+105;zoom,0);
			OnCommand=function(self)
				if(STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P2"):GetGrade()=="Grade_Failed") then
					(cmd(sleep,2;zoom,1;diffusealpha,0;linear,0.5;diffusealpha,1))(self);
				end;
			end;
			OffCommand=cmd(linear,0.2;zoom,0);
		};
		--FullCombo Overlay
		-- LoadActor("star")..{
		-- 	InitCommand=cmd(x,SCREEN_CENTER_X+43;y,SCREEN_CENTER_Y+105;zoom,0);
		-- 	OnCommand=function(self)
		-- 	local staw = STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P2"):GetStageAward();
		-- 		if staw =="StageAward_SingleDigitW3" or staw =="StageAward_OneW3" or staw =="StageAward_FullComboW3" or staw =="StageAward_SingleDigitW2" or staw =="StageAward_OneW2" or staw =="StageAward_FullComboW2" or staw =="StageAward_FullComboW1" then
		-- 			(cmd(linear,0.2;zoom,1;wag))(self);
		-- 		end;
		-- 	end;
		-- 	OffCommand=cmd(linear,0.2;zoom,0);
		-- };
	};
end

return t;
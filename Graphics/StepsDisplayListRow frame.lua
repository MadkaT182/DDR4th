local CustomDifficultyToState = {
	Beginner = 0,
	Basic = 1,
	Trick = 2,
	Maniac = 3,
	SManiac = 4,
	Edit = 5
}

local DifficultyToState = {
	Difficulty_Beginner = 0,
	Difficulty_Easy = 1,
	Difficulty_Medium = 2,
	Difficulty_Hard = 3,
	Difficulty_Challenge = 4,
	Difficulty_Edit = 5,
}

local t = Def.ActorFrame{
	LoadActor(THEME:GetPathG("ScreenSelectMusic", "StepsDisplayList/_cursor p1"))..{
		Name="FrameP1";
		InitCommand=cmd(x,-100;player,PLAYER_1;animate,false;diffuse,color("0.5,0.5,0.5,1"););
		SetCommand=function(self,param)
			local curdiff = param.CustomDifficulty;
			local state = CustomDifficultyToState[curdiff] or CustomDifficultyToState["Edit"];
			self:setstate(state);
		end;
		CurrentStepsP1ChangedMessageCommand=cmd(playcommand,"UpdateVisibility");
		UpdateVisibilityCommand=function(self)
			local steps = GAMESTATE:GetCurrentSteps(PLAYER_1)
			if steps then
				local p1Diff = steps:GetDifficulty();
				local matchState = DifficultyToState[p1Diff];
				self:visible(self:GetState() ~= matchState)
			else
				self:visible(false)
			end
		end;
	};

	LoadActor(THEME:GetPathG("ScreenSelectMusic", "StepsDisplayList/_cursor p2"))..{
		Name="FrameP2";
		InitCommand=cmd(x,100;player,PLAYER_2;animate,false;diffuse,color("0.5,0.5,0.5,1"););
		SetCommand=function(self,param)
			local curdiff = param.CustomDifficulty;
			local state = CustomDifficultyToState[curdiff] or CustomDifficultyToState["Edit"];
			self:setstate(state);
		end;
		CurrentStepsP2ChangedMessageCommand=cmd(playcommand,"UpdateVisibility");
		UpdateVisibilityCommand=function(self)
			local steps = GAMESTATE:GetCurrentSteps(PLAYER_2)
			if steps then
				local p2Diff = steps:GetDifficulty();
				local matchState = DifficultyToState[p2Diff];
				self:visible(self:GetState() ~= matchState)
			else
				self:visible(false)
			end
		end;
	};
};

return t;
local DifficultyToState = {
	Difficulty_Beginner = 0,
	Difficulty_Easy = 1,
	Difficulty_Medium = 2,
	Difficulty_Hard = 3,
	Difficulty_Challenge = 4,
	Difficulty_Edit = 5,
}

local t = Def.ActorFrame{
	Def.Sprite{
		InitCommand=cmd(animate,false;);
		SetNetFrameMessageCommand=function(self,param)
			self:player(param.Player);
			if GAMESTATE:IsHumanPlayer(param.Player) then
				local playerName = param.Player == PLAYER_1 and "p1" or "p2"
				self:Load(THEME:GetPathG("ScreenSelectMusic","StepsDisplayList/_cursor "..playerName));
			end
		end;
		ChangeNetFrameMessageCommand=function(self,param)
			local pn = param.Player;
			local steps = GAMESTATE:GetCurrentSteps(pn)
			if steps then
				local curdiff = steps:GetDifficulty();
				local state = DifficultyToState[curdiff] or DifficultyToState["Edit"];
				self:setstate(state);
			end;
		end
	};
};

return t;
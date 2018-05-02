function LoadSteps(self,player)
	local difficultyStates = {
		Difficulty_Beginner	 = 0,
		Difficulty_Easy		 = 2,
		Difficulty_Medium	 = 4,
		Difficulty_Hard		 = 6,
		Difficulty_Challenge = 8,
		Difficulty_Edit		 = 10,
	};
	local selection;
	if GAMESTATE:IsCourseMode() then
		-- get steps of current course entry
		selection = GAMESTATE:GetCurrentTrail(player);
		local entry = selection:GetTrailEntry(GAMESTATE:GetLoadingCourseSongIndex()+1)
		selection = entry:GetSteps()
	else
		selection = GAMESTATE:GetCurrentSteps(player);
	end;
	local diff = selection:GetDifficulty()
	local state = difficultyStates[diff] or 10;
	if player == PLAYER_2 then state = state + 1; end;
	return state;
end;

local t = Def.ActorFrame{};

for player in ivalues(GAMESTATE:GetHumanPlayers()) do
t[#t+1] = Def.ActorFrame{
	LoadActor(THEME:GetPathG("StepsDisplayGameplay","frame"))..{
	InitCommand=function(self)
		local po = GAMESTATE:GetPlayerState(player):GetCurrentPlayerOptions();
		self:x(player == PLAYER_1 and -208 or 208);
		if po:Reverse() ~= 0 then
			self:y(SCREEN_TOP+88);
		else
			self:y(SCREEN_BOTTOM-88);
		end;
		self:pause();
		self:setstate(LoadSteps(self,player));
	end;
	};
};
end

return t;
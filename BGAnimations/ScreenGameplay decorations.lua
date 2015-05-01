local t = Def.ActorFrame{};

t[#t+1] = StandardDecorationFromFileOptional("StageDisplay","StageDisplay");
t[#t+1] = StandardDecorationFromFileOptional("EditName","EditName");

-- I hate theme-based custom scoring so fucking much
if( not GAMESTATE:IsCourseMode() ) then
	t[#t+1] = Def.Actor{
		JudgmentMessageCommand = function(self, params)
			Scoring[GetUserPref("UserPrefScoringMode")](params, 
				STATSMAN:GetCurStageStats():GetPlayerStageStats(params.Player))
		end;
	};
end;

return t;
local stages = Def.ActorFrame {
};


for _, s in ipairs(Stage) do
	if PREFSMAN:GetPreference("SongsPerPlay") == GAMESTATE:GetCurrentStageIndex()+1 then
		stages[#stages+1] = LoadActor("_stage Stage_final") .. {
			SetCommand=function(self)
				self:visible( GAMESTATE:GetCurrentStage() == "Stage_Final" );
				self:y(-10);
			end;
		}
	elseif s == 'Stage_Demo' then
		stages[#stages+1] = LoadActor("_stage " .. s) .. {
			SetCommand=function(self, params)
				self:visible( params.StageToShow == s );
			end;
		}
	else
		stages[#stages+1] = LoadActor("_stage " .. s) .. {
			SetCommand=function(self, params)
				self:visible( params.StageToShow == s );
				self:y(-10);
			end;
		}
	end
end

stages[#stages+1] = LoadActor("_stage Frame") .. {
	OnCommand=cmd(y,10);
	Condition=not GAMESTATE:IsDemonstration();
}

return stages;

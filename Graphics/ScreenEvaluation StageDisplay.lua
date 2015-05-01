local stages = Def.ActorFrame {
	BeginCommand=cmd(playcommand,"Set";);
	CurrentSongChangedMessageCommand=cmd(finishtweening;playcommand,"Set";);
};

local ScreenName = Var "LoadingScreen";

function MakeBitmapText()
	return LoadFont("_green solid") .. {
		InitCommand=cmd(uppercase,true;diffuse,color("#CEFF00");strokecolor,color("#5208B5"));
	};
end

for s in ivalues(Stage) do
	stages[#stages+1] = MakeBitmapText() .. {
		SetCommand=function(self, params)
			local curStage = GAMESTATE:GetCurrentStage();
			self:visible( curStage == s );
			if GAMESTATE:IsEventMode() then
				local iStage = GAMESTATE:GetCurrentStageIndex()
				self:settext( FormatNumberAndSuffix(iStage).." STAGE" );
			else
				self:settext( StageToLocalizedString(curStage).." STAGE" );
			end;
		end;
	}
end

return stages;

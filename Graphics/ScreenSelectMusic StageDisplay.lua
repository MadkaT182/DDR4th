function MakeBitmapText()
	return LoadFont("_2070polyester round 24px") .. {
		InitCommand=cmd(zoom,0.55;uppercase,true);
	};
end

local t = Def.ActorFrame {
	BeginCommand=cmd(playcommand,"Set";);
	CurrentSongChangedMessageCommand=cmd(finishtweening;playcommand,"Set";);
	MakeBitmapText()..{
		SetCommand=function(self)
			local curStage = GAMESTATE:GetCurrentStage();
			local curStageNum = GAMESTATE:GetCurrentStageIndex(); -- 0-based
			local maxStages = PREFSMAN:GetPreference("SongsPerPlay")

			local song = GAMESTATE:GetCurrentSong()
			if song then
				-- check how many stages this song is
				local songStages = 1;
				if song:IsLong() then songStages = 2
				elseif song:IsMarathon() then songStages = 3
				end
				local totalStages = curStageNum+songStages

				if totalStages == maxStages then
					curStage = 'Stage_Final'
				else
					if curStage == 'Stage_Event' then
						local stageStr = FormatNumberAndSuffix(curStageNum+1)
						curStage = 'Stage_'..stageStr
					end
				end

				self:diffuse( StageToColor(curStage) );
				self:settext( StageToLocalizedString(curStage) )
			else
				if curStage == 'Stage_Event' then
					local stageStr = FormatNumberAndSuffix(curStageNum+1)
					curStage = 'Stage_'..stageStr
				end
				self:diffuse( StageToColor(curStage) );
				self:settext( StageToLocalizedString(curStage) )
			end
		end
	};
};

--[[
for s in ivalues(Stage) do
	stages[#stages+1] = MakeBitmapText() .. {
		SetCommand=function(self, params)
			local curStage = GAMESTATE:GetCurrentStage();
			-- todo: check for Long Version/Marathon and set to "final" accordingly.
			self:visible( curStage == s );

			local stageColor, stageText;
			if GAMESTATE:IsEventMode() then
				local iStage = GAMESTATE:GetCurrentStageIndex()+1
				stageText = FormatNumberAndSuffix(iStage)
				if iStage < 3 then
					stageColor = StageToColor('Stage_'..stageText)
				else
					stageColor = StageToColor('Stage_Next')
				end;
			else
				stageText = StageToLocalizedString(curStage);
				stageColor = StageToColor(curStage);
			end;
			self:settext( stageText );
			self:diffuse( stageColor );
			self:strokecolor(color("#007BC6"))
			--self:strokecolor(color("#319CC6"))
		end;
	}
end
--]]

return t;

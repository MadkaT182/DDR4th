local t = Def.ActorFrame{
	SetMessageCommand=function(self,params)
		if params.Song then
			-- check if there are edits; if so, spin the edit icon
			local curStyle = GAMESTATE:GetCurrentStyle()
			local curStepType = curStyle:GetStepsType()
			local icon = self:GetParent():GetChild("WheelNotifyIcon")
			if params.Song:HasStepsTypeAndDifficulty(curStepType,'Difficulty_Edit') then
				icon:spin();
				icon:effectmagnitude(0,250,0);
			else
				icon:stopeffect();
				icon:rotationy(0);
			end;
		end;
	end;
};

return t;
local t = Def.ActorFrame{
	BeginCommand=function(self)
		self:playcommand("Set")
	end;
	SetCommand=function(self)
		local dotC = self:GetChildren()
		-- check to see if current song has edits
		local song = GAMESTATE:GetCurrentSong()
		if song then
			local curStyle = GAMESTATE:GetCurrentStyle()
			local stepsType = curStyle:GetStepsType()
			if song:HasEdits(stepsType) then
				-- check how many edits.
				local allSteps = song:GetAllSteps()
				local editCount = 0
				for i,s in pairs(allSteps) do
					if s:IsAnEdit() and s:GetStepsType() == stepsType then
						editCount = editCount + 1
					end;
				end;
				dotC.Dot1:visible(editCount >= 1)
				dotC.Dot2:visible(editCount >= 2)
				dotC.Dot3:visible(editCount >= 3)
				dotC.Dot4:visible(editCount >= 4)
			else
				dotC.Dot1:visible(false)
				dotC.Dot2:visible(false)
				dotC.Dot3:visible(false)
				dotC.Dot4:visible(false)
			end;
		else
			dotC.Dot1:visible(false)
			dotC.Dot2:visible(false)
			dotC.Dot3:visible(false)
			dotC.Dot4:visible(false)
		end;
	end;
	CurrentSongChangedMessageCommand=cmd(playcommand,"Set");

	LoadActor("_edit dot")..{
		Name="Dot1";
		InitCommand=cmd(y,-29;visible,false);
		OnCommand=cmd(glowshift;effectperiod,0.5;effectoffset,0.3;effectcolor1,color("#FFFF9CFF");effectcolor2,color("#FFFF9C66"););
	};

	LoadActor("_edit dot")..{
		Name="Dot2";
		InitCommand=cmd(y,-10;visible,false);
		OnCommand=cmd(glowshift;effectperiod,0.5;effectoffset,0.2;effectcolor1,color("#FFFF9CFF");effectcolor2,color("#FFFF9C66"););
	};

	LoadActor("_edit dot")..{
		Name="Dot3";
		InitCommand=cmd(y,9;visible,false);
		OnCommand=cmd(glowshift;effectperiod,0.5;effectoffset,0.1;effectcolor1,color("#FFFF9CFF");effectcolor2,color("#FFFF9C66"););
	};

	LoadActor("_edit dot")..{
		Name="Dot4";
		InitCommand=cmd(y,28;visible,false);
		OnCommand=cmd(glowshift;effectperiod,0.5;effectcolor1,color("#FFFF9CFF");effectcolor2,color("#FFFF9C66"););
	};
};

return t;
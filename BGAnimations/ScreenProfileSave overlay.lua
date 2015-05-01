return Def.ActorFrame{
	LoadActor(THEME:GetPathB("","_moveon"))..{
		InitCommand=cmd(Center;);
	};
	Def.Actor{
		BeginCommand=function(self)
			if SCREENMAN:GetTopScreen():HaveProfileToSave() then self:sleep(1); end;
			self:queuecommand("Load");
		end;
		LoadCommand=function() SCREENMAN:GetTopScreen():Continue(); end;
	};
};
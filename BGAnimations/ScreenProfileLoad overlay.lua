return Def.ActorFrame{
	LoadActor(THEME:GetPathB("","_moveon"))..{
		InitCommand=cmd(Center;);
	};
	Def.Actor{
		BeginCommand=function(self)
			if SCREENMAN:GetTopScreen():HaveProfileToLoad() then
				self:linear(1);
			end;
			self:queuecommand("Load");
		end;
		LoadCommand=function()
			SCREENMAN:GetTopScreen():Continue();
		end;
	};
};
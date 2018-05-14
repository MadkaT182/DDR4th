local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame {
	CodeMessageCommand = function(self, params)
		if params.Name == 'Link' then
			SCREENMAN:GetTopScreen():SetNextScreenName('ScreenStyleLink');
			SCREENMAN:GetTopScreen():PostScreenMessage('SM_GoToNextScreen',0);
		end
	end;
};

return t;
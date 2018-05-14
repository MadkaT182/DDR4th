local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame {
	CodeMessageCommand = function(self, params)
		if params.Name == 'Link' then
			SCREENMAN:GetTopScreen():PostScreenMessage('SM_GoToPrevScreen',0);
		end
	end;
};

return t;
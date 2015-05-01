return Def.ActorFrame{
	-- only run these commands if the sort is correct
	SortOrderChangedMessageCommand=function(self)
		local sortOrder = GAMESTATE:GetSortOrder()
		local label = self:GetChild("Label")
		if sortOrder == 'SortOrder_Title' or sortOrder == 'SortOrder_Artist' then
			label:visible(true)
		else
			label:visible(false)
		end
	end;
	LoadFont("_sort")..{
		Name="Label";
		Text="A";
		SetMessageCommand=function(self,param)
			local sortText = param.Text
			if sortText == "Other" then sortText = " "
			elseif sortText == "0-9" then sortText = "-"
			end
			self:settext(sortText)
		end;
	};
};
function StageToColor( stage )
	local colors = {
		Stage_1st		= color("#52E7FF"),
		Stage_2nd		= color("#00DE4A"),
		Stage_3rd		= color("#DEFF29"),
		Stage_4th		= color("#DEFF29"),
		Stage_5th		= color("#DEFF29"),
		Stage_6th		= color("#DEFF29"),
		Stage_Next		= color("#DEFF29"),
		Stage_Final		= color("#FF186B"),
		Stage_Event		= color("#00F8F8"),
	}
	return colors[stage] or color("#FFFFFF");
end

function PlayerColor( pn )
	if pn == PLAYER_1 then return color("#00F0B1") end
	if pn == PLAYER_2 then return color("#F08100") end
	return color("1,1,1,1")
end

CustomDifficultyColor = {
	Beginner	= color("#39FFFF"),			-- light blue
	Basic		= color("#EFE600"),			-- yellow
	Trick		= color("#F639AC"),			-- pink
	Maniac		= color("#08DE18"),			-- green
	SManiac		= color("#2D0ADC"),			-- todo: dark blue
	Edit		= color("0.8,0.8,0.8,1"),	-- grey
};

function CustomDifficultyToColor( sCustomDifficulty )
	return CustomDifficultyColor[sCustomDifficulty] or color("#FFFFFF")
end

StageColor = {
	Stage_1st		= color("#52E7FF"),
	Stage_2nd		= color("#00DE4A"),
	Stage_3rd		= color("#DEFF29"),
	Stage_4th		= color("#DEFF29"),
	Stage_5th		= color("#DEFF29"),
	Stage_6th		= color("#DEFF29"),
	Stage_Next		= color("#DEFF29"),
	Stage_Final		= color("#FF186B"),

	Stage_Event		= color("#00FFFF"),
	Stage_Demo		= color("#00FFFF"),

	Stage_Extra1	= color("#FFFFFF"),
	Stage_Extra2	= color("#FFFFFF"),
	Stage_Nonstop	= color("#FFFFFF"),
	Stage_Oni		= color("#FFFFFF"),
	Stage_Endless	= color("#FFFFFF")
};

function StageToColor( stage )
	return StageColor[stage] or color("#FFFFFF")
end
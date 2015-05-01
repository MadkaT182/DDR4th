function LoadStepsDisplayGameplayFrame(self,player)
	local difficultyStates = {
		Difficulty_Beginner	 = 0,
		Difficulty_Easy		 = 1,
		Difficulty_Medium	 = 2,
		Difficulty_Hard		 = 3,
		Difficulty_Challenge = 4,
		Difficulty_Edit		 = 5,
	};
	local selection;
	if GAMESTATE:IsCourseMode() then
		selection = GAMESTATE:GetCurrentTrail(player);
	else
		selection = GAMESTATE:GetCurrentSteps(player);
	end;
	local state = difficultyStates[selection:GetDifficulty()] or 5;
	return state;
end;

-- tiles
-- function by shakesoda
local function GetAspect()
	return math.floor(PREFSMAN:GetPreference("DisplayAspectRatio") * 10) / 10;
end;

local AspectRatios = {
	FourThree = { X = 4, Y = 3 },
	SixteenTen = { X = 16, Y = 10 },
	SixteenNine = { X = 16, Y = 9 },
};

function GetTileCoordX()
	local squareCoord = 4;
	local aspectType;
	-- 16/9
	if GetAspect() >= 1.7 then aspectType = "SixteenNine";
	-- 16/10
	elseif GetAspect() == 1.6 then aspectType = "SixteenTen";
	-- assume 4/3 otherwise
	else aspectType = "FourThree";
	end;

	squareCoord = AspectRatios[aspectType].X

	return squareCoord;
end;

function GetTileCoordY()
	local squareCoord = 4;
	local aspectType;
	-- 16/9
	if GetAspect() >= 1.7 then aspectType = "SixteenNine";
	-- 16/10
	elseif GetAspect() == 1.6 then aspectType = "SixteenTen";
	-- assume 4/3 otherwise
	else aspectType = "FourThree";
	end;

	squareCoord = AspectRatios[aspectType].Y

	return squareCoord;
end;

-- GetCharAnimPath(sPath)
-- Easier access to Characters folder (taken from ScreenHowToPlay.cpp)
function GetCharAnimPath(sPath) return "/Characters/"..sPath end

-- GetGraphicType()
-- Used for picking Arcade/Home mode graphics based on current settings.
function GetGraphicType() return GAMESTATE:GetCoinMode() == 'CoinMode_Home' and "CS" or "AC" end

-- NormalizeCharID(sCharID)
-- Normalizes a character ID by replacing '.' with '-'.
--[[ See this comment from sm-ssc\src\AttackDisplay.cpp:
"If we pass a period to THEME->GetPathTo, it'll think we're looking for a
specific file and not search." --]]
function NormalizeCharID(sCharID)
	return string.gsub(sCharID, "%.", "-")
end

function AnyPlayerUsingEdit()
	for pn in ivalues(GAMESTATE:GetHumanPlayers()) do
		local steps = GAMESTATE:GetCurrentSteps(pn)
		if steps:GetDifficulty() == 'Difficulty_Edit' then
			return true
		end
	end
	return false
end

function PlayingSameEdit()
	-- only one human player? then yeah.
	if #GAMESTATE:GetHumanPlayers() < 2 then return true end

	local desc = {};
	for pn in ivalues(GAMESTATE:GetHumanPlayers()) do
		local steps = GAMESTATE:GetCurrentSteps(pn)
		if steps:GetDifficulty() == 'Difficulty_Edit' then
			desc[pn] = steps:GetDescription()
		end
	end
	return desc[PLAYER_1] == desc[PLAYER_2]
end
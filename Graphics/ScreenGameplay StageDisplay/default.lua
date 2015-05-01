local curStage = GAMESTATE:GetCurrentStage()
local stageIdx = GAMESTATE:GetCurrentStageIndex()+1
local stageText, stageColor;
if GAMESTATE:IsEventMode() then
	stageText = FormatNumberAndSuffix(stageIdx)
	if stageIdx < 3 then
		stageColor = StageToColor('Stage_'..stageText)
	else
		stageColor = StageToColor('Stage_Next')
	end;
else
	stageText = ToEnumShortString(curStage)
	stageColor = StageToColor(curStage);
end;

if GAMESTATE:IsDemonstration() then
	stageText = "DEMO";
end;

local singleStage = Def.ActorFrame{
	LoadActor("_frame single");
	LoadFont("_arial black 20px")..{
		InitCommand=cmd(uppercase,true;y,-4;settext,stageText;diffuse,stageColor;strokecolor,color("#00316B"));
	};
};

local doubleStage = Def.ActorFrame{
	LoadActor("_frame double")..{ InitCommand=cmd(y,-1); };
	LoadFont("_stagefont double")..{
		InitCommand=cmd(y,-4;zoom,2;settext,string.sub(stageText,1,3);diffuse,stageColor;strokecolor,color("#00316B"));
	};
};

local bUseDoubleStage = GAMESTATE:GetCurrentStyle():GetStyleType() == 'StyleType_OnePlayerTwoSides'

return bUseDoubleStage and doubleStage or singleStage;
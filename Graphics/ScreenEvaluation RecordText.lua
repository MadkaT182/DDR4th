local Player = ...
assert(Player,"RecordText needs Player")
local stats = STATSMAN:GetCurStageStats():GetPlayerStageStats(Player);
local pRecord = stats:GetPersonalHighScoreIndex()
local mRecord = stats:GetMachineHighScoreIndex()
local hasPersonalRecord = pRecord ~= -1
local hasMachineRecord  = mRecord ~= -1

return LoadFont("_green gradient")..{
	Text="It's New Record!";
	InitCommand=cmd(diffuse,color("#F07101");strokecolor,color("#5000B0");glowshift;effectcolor1,color("1,1,1,0");effectcolor2,color("1,1,1,0.25"));
	BeginCommand=cmd(visible,hasPersonalRecord or hasMachineRecord;);
};
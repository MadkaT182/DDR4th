--local t = Def.ActorFrame{};
local t = LoadFallbackB();

t[#t+1] = StandardDecorationFromFile("BPMDisplay","BPMDisplay");
t[#t+1] = StandardDecorationFromFileOptional("StageDisplay","StageDisplay");
t[#t+1] = StandardDecorationFromFile("SortDisplay","SortDisplay");
t[#t+1] = StandardDecorationFromFileOptional("StepsDisplayList","StepsDisplayList");
t[#t+1] = StandardDecorationFromFileOptional("Edits","Edits");
t[#t+1] = StandardDecorationFromFile( "Balloon", "Balloon" );

for pn in ivalues(GAMESTATE:GetHumanPlayers()) do
	local optIcons = LoadActor( THEME:GetPathG( Var "LoadingScreen", "OptionIcons" ), pn );
	t[#t+1] = StandardDecorationFromTable( "OptionIcons" .. ToEnumShortString(pn), optIcons );
end

return t;
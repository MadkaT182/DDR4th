local t = Def.ActorFrame {};
t[#t+1] = StandardDecorationFromFileOptional("Header","Header");
t[#t+1] = StandardDecorationFromFileOptional("Footer","Footer");
t[#t+1] = StandardDecorationFromFileOptional("StyleIcon","StyleIcon");
t[#t+1] = StandardDecorationFromFileOptional("OnlineIcon","OnlineIcon");
--t[#t+1] = StandardDecorationFromFileOptional( "Help", "Help" );

if ShowStandardDecoration("CharacterIcon") then
	for pn in ivalues(GAMESTATE:GetHumanPlayers()) do
		local charIcon = LoadActor( THEME:GetPathG( Var "LoadingScreen", "CharacterIcon" ), pn );
		t[#t+1] = StandardDecorationFromTable( "CharacterIcon" .. ToEnumShortString(pn), charIcon );
	end
end;
return t
local Player = ...
assert(Player)
local char = GAMESTATE:GetCharacter(Player)
local charID = char:GetCharacterID();

-- xxx: if there's a dot in the character's name (X.alice), StepMania gets confused.
charID = string.gsub(charID, "%.", "-");

local t = Def.ActorFrame{
	LoadActor("_base");
	LoadActor(THEME:GetPathG("ScreenWithMenuElements","CharacterIcon/"..charID.."_base"));
	LoadActor(THEME:GetPathG("ScreenWithMenuElements","CharacterIcon/"..charID.."_diffuse"))..{
		InitCommand=cmd(diffuse,PlayerColor(Player));
	};
};

--[[
if FILEMAN:DoesFileExist(THEME:GetPathG("ScreenWithMenuElements","CharacterIcon/"..charID)) then
	t[#t+1] = LoadActor(THEME:GetPathG("ScreenWithMenuElements","CharacterIcon/"..charID))..{
		InitCommand=cmd(diffuse,PlayerColor(Player));
	};
end
--]]

return t;
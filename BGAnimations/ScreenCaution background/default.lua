local lang = "us";
local t = Def.ActorFrame {};

if THEME:GetCurLanguage() == "ja" then
	lang = "jp";
end;

t[#t+1] = Def.ActorFrame {
	LoadActor( "caution"..lang )..{
		OnCommand=cmd(Center;);
	};
};

return t;
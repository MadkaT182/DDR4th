local t = Def.ActorFrame{};
	if ThemePrefs.Get("ALTMUSCR") and not ThemePrefs.Get("GENRESCR") then
		t[#t+1] = LoadActor("Disk");
	else
		t[#t+1] = LoadActor("Banner");
	end
return t;

local delay = 0.35;

return Def.Actor { OnCommand=cmd(sleep,delay); OffCommand=cmd(sleep,delay); };

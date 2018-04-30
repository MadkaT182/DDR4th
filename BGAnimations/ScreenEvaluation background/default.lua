local t = Def.ActorFrame {};
local MarvEnabled = PREFSMAN:GetPreference("AllowW1");

if MarvEnabled == "AllowW1_Everywhere" then
	t[#t+1] = Def.ActorFrame {
		LoadActor( "marvbg" )..{
			OnCommand=cmd(Center;zoomtowidth,SCREEN_WIDTH);
		};
	};
else
	t[#t+1] = Def.ActorFrame {
		LoadActor( "normalbg" )..{
			OnCommand=cmd(Center;zoomtowidth,SCREEN_WIDTH);
		};
	};
end;

t[#t+1] = Def.ActorFrame {
	LoadActor( "resulthead" )..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_TOP+26);
	};
	LoadActor( "resfooter" )..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-18);
	};
};

return t;
local character = CHARMAN:GetCharacter("Yuni")

local t = Def.ActorFrame{
	Def.Quad{
		InitCommand=cmd(Center;FullScreen;diffuse,color("#000063"));
	};
	Def.ActorFrame{
		InitCommand=cmd(CenterX;);
		--[[
		LoadActor(THEME:GetPathB("ScreenSelectCharacter","overlay/_icon blank"))..{
			InitCommand=cmd(y,SCREEN_CENTER_Y-80);
		};
		--]]
		Def.Model{
			Materials = character:GetModelPath(),
			Meshes = character:GetModelPath(),
			Bones = character:GetRestAnimationPath(),
			--InitCommand=cmd(x,-4;y,SCREEN_CENTER_Y+64;zoom,10;rotationy,180;cullmode,'CullMode_None';rate,0;position,0.575);
			InitCommand=cmd(y,SCREEN_CENTER_Y*2.5;zoom,32;rotationy,180;cullmode,'CullMode_None';rate,0;position,0.575;);
		};
	};
};

return t;
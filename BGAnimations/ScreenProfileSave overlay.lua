local lang = "us";
local t = Def.ActorFrame {};

if THEME:GetCurLanguage() == "ja" then
	lang = "jp";
end;

if GAMESTATE:GetCoinMode() == 'CoinMode_Pay' then
	t[#t+1] = Def.ActorFrame{
		Def.Quad{
			InitCommand=cmd(FullScreen;diffuse,color("#000000"));
		};
	};
else
	t[#t+1] = Def.ActorFrame{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+116;);
		LoadActor(THEME:GetPathG("System","Data/frame"));
		LoadActor(THEME:GetPathG("System","Data/messages/save_wait_"..lang))..{
			OnCommand=cmd(y,-13;sleep,2;diffusealpha,0);
		};
		LoadActor(THEME:GetPathG("System","Data/messages/save_done_"..lang))..{
			OnCommand=cmd(diffusealpha,0;y,-21;sleep,2;diffusealpha,1;sleep,3;diffusealpha,0);
		};
	};
end;

t[#t+1] = Def.Actor {
	BeginCommand=function(self)
		if SCREENMAN:GetTopScreen():HaveProfileToSave() then
			if IsHome() then
				self:sleep(5);
			else
				self:sleep(1);
			end;
		end;
		self:queuecommand("Load");
	end;
	LoadCommand=function() SCREENMAN:GetTopScreen():Continue(); end;
};

return t;
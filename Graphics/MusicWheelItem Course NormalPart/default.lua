local songs;
local Trail;
local mp = GAMESTATE:GetMasterPlayerNumber();
local t = Def.ActorFrame {
	InitCommand=function(self) c = self:GetChildren(); end;
	Def.ActorFrame{
		LoadFont("MusicWheelItem Course")..{
			InitCommand=cmd();
			SetCommand=function(self,param)
				if param.Course then
					self:settext(param.Course:GetDisplayFullTitle());
					self:maxwidth(239);
					self:diffuse(color("#88F830"));
				end
			end
		};

	};
};

for i=1,4 do
	t[#t+1] = Def.Sprite {
		Name="Banner"..i;
		InitCommand=cmd(y,i*90);
	};
end



-- if mp ~= 'PlayerNumber_Invalid' then
-- 	t[#t+1] = Def.ActorFrame {
-- 		SetCommand=function(self,param)
-- 			if param.Course then			
-- 				local Trail = GAMESTATE:GetCurrentTrail(mp);
-- 				if Trail then
-- 					c.Banner1:LoadBanner(THEME:GetPathG("Common fallback","banner"));
-- 				end
-- 			end
-- 		end;
-- 	}
-- end;



-- --Course:GetAllTrails
-- --GameState:GetCurrentTrail

-- for i=1,4 do
-- 	t[#t+1] = Def.ActorFrame {
-- 		-- LoadActor(THEME:GetPathG("Common fallback","banner"))..{
-- 		-- 	InitCommand=cmd(y,i*90);
-- 		-- };
-- 		Def.Sprite {
-- 			RefreshCommand=function(self)
-- 				self:songs[i]:GetSong();
-- 			end;
-- 		};
-- 	};
-- end

return t;
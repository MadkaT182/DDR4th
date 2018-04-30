local t = Def.ActorFrame {};

-- LUA Based LifeMeter bar (by Ov3rHell3XoduZ/MadkaT)
for pn in ivalues(GAMESTATE:GetEnabledPlayers()) do
	t[#t+1] = Def.ActorFrame{
		LoadActor("LifeMeterBar under")..{
			Name="LifeMeter Frame";
			InitCommand=cmd(y,SCREEN_TOP+22;valign,0);
			OnCommand=function(self) if pn == PLAYER_1 then self:x(SCREEN_CENTER_X-191):zoomx(1) else self:x(SCREEN_CENTER_X+190):zoomx(-1) end end;
			LifeChangedMessageCommand=function(self,params)
				if (params.Player == pn) then
					local life = string.format("%.1f",params.LifeMeter:GetLife() * 10)
					local pills = (string.format("%.1f",life * 2.9 / 17)) * 10
					if pills == 17 then
					self:stopeffect()
					self:glowshift():effectperiod(0.1):effectcolor1(1,1,1,0.4):effectcolor2(1,1,1,0)
					elseif pills < 4 then
					self:stopeffect()
					self:diffuseshift():effectperiod(0.5):effectcolor1(color("#F80000CC")):effectcolor2(color("#F80000"))
					else
					self:stopeffect()
					end
				end;
			end;
		};
	};
end

for pn in ivalues(GAMESTATE:GetEnabledPlayers()) do
	for i = 1,17 do
		t[#t+1] = Def.Sprite{
			BeginCommand=cmd(y,SCREEN_TOP+41;diffusealpha,0.35);
			InitCommand=function(self) if pn == PLAYER_1 then self:x(SCREEN_CENTER_X-294+12*i) else self:x(SCREEN_CENTER_X+292-12*i) end end;
			OnCommand=function(self)
				self:Load(THEME:GetCurrentThemeDirectory().."BGAnimations/_lifebar/LifeMeterBar over 17x1.png")
				self:pause()
				self:setstate(-1 + i)
			end;
		};
		t[#t+1] = Def.Sprite{
			BeginCommand=cmd(y,SCREEN_TOP+41;);
			InitCommand=function(self) if pn == PLAYER_1 then self:x(SCREEN_CENTER_X-294+12*i) else self:x(SCREEN_CENTER_X+292-12*i) end end;
			OnCommand=function(self)
				self:sleep(i / 20)
				self:queuecommand("Anim")
			end;
			AnimCommand=function(self)
				self:sleep(0.866)
				self:accelerate(0.066)
				self:addy(-8)
				self:sleep(0.066)
				self:accelerate(0.066)
				self:addy(8)
				self:queuecommand("Anim")
			end;
			LifeChangedMessageCommand=function(self,params)
				self:Load(THEME:GetCurrentThemeDirectory().."BGAnimations/_lifebar/LifeMeterBar over 17x1.png")
				self:pause()

				if (params.Player == pn) then
					local life = string.format("%.1f",params.LifeMeter:GetLife() * 10)
					local pills = (string.format("%.1f",life * 2.9 / 17)) * 10
					self:setstate(-1 + i)
					if pills >= i then self:visible(true) else self:visible(false) end
					if pills == 17 then self:glowshift():effectperiod(0.1):effectcolor1(1,1,1,0.4):effectcolor2(1,1,1,0) else self:stopeffect() end
				end;
			end;
		};
	end
end

return t;
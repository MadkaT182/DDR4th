-- _missing overlay - used on screens that aren't complete yet.
return Def.ActorFrame{
	LoadFont("_2070polyester round 24px")..{
		InitCommand=cmd(Center;diffuse,HSV(48,0.9,1);strokecolor,HSV(0,0.9,0.45);diffusebottomedge,HSV(24,0.9,1);shadowlength,3;shadowcolor,HSV(0,0.9,0.45));
		BeginCommand=function(self)
			local TopScreen = SCREENMAN:GetTopScreen();
			if TopScreen then
				local screenName = TopScreen:GetName()
				self:settext(screenName.."\nis UNDER CONSTRUCTION");
			end;
		end;
	};
};
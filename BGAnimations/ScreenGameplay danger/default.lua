local t = Def.ActorFrame{
	OnCommand=cmd(addx,-64;addy,-64;diffusealpha,0;diffuseblink;effectcolor1,1,1,1,1;effectcolor2,1,1,1,0);
	ShowDangerAllMessageCommand=cmd(stoptweening;diffusealpha,1);
	HideDangerAllMessageCommand=cmd(stoptweening;diffusealpha,0);
}
for j = 1,4 do
	for i = 1,7 do
		t[#t+1] = Def.ActorFrame {
			LoadActor("dangerbg")..{
				InitCommand=cmd(addx,i*128;addy,j*128);
			};
		};
	end;
end;
t[#t+1] = Def.ActorFrame{
	OnCommand=cmd(addx,64;addy,64);
	Def.Quad{
		OnCommand=cmd(Center;diffusecolor,Color.Black;zoomto,SCREEN_WIDTH,64);
	};
	Def.Sprite {
		Texture="dangerfg";
		OnCommand=function(self)
			self:Center();
			self:SetAllStateDelays(1);
		end;
	};
};
return t;
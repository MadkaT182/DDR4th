local t = Def.ActorFrame {
	Def.ActorFrame {
		Name="SystemMessage";
		Def.Quad {
			Name="Background";
			InitCommand=cmd(y,SCREEN_TOP;zoomto,SCREEN_WIDTH,30;align,0,0;diffuse,color("0,0,0,0.45");addy,-100);
			OnCommand=cmd(finishtweening;linear,0.5;addy,100);
			OffCommand=cmd(sleep,3;linear,0.5;addy,-100);
		};
		LoadFont("_arial black 20px") .. {
			Name="Text";
			InitCommand=cmd(x,SCREEN_CENTER_X-310;y,SCREEN_TOP+8;align,0,0;zoom,0.8;maxwidth,608;shadowlength,1;addy,-100);
			OnCommand=cmd(finishtweening;linear,0.5;addy,100);
			OffCommand=cmd(sleep,3;linear,0.5;addy,-100);
		};
		Def.Quad{
			Name="Line";
			InitCommand=cmd(y,SCREEN_TOP+30;zoomto,SCREEN_WIDTH,2;align,0,0;diffuse,color("#21D6F7");diffuseleftedge,color("#FFFFFF");addy,-100);
			OnCommand=cmd(finishtweening;linear,0.5;addy,100);
			OffCommand=cmd(sleep,3;linear,0.5;addy,-100);
		};
		SystemMessageMessageCommand=function(self, params)
			self:GetChild("Text"):settext( params.Message );
			self:playcommand( "On" );
			if params.NoAnimate then
				self:finishtweening();
			end
			self:playcommand( "Off" );
		end;
		HideSystemMessageMessageCommand=cmd(finishtweening);
	};
};
t[#t+1] = LoadActor(THEME:GetPathB("ScreenSystemLayer","aux"));
return t;

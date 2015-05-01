local t = Def.ActorFrame{
	InitCommand=cmd(Center);
	LoadFont("_arial black 20px")..{
		InitCommand=cmd(x,-256;y,-108;zoom,0.75;wrapwidthpixels,672;align,0,0;diffuse,color("#EEEEEE");strokecolor,color("#222222"));
		BeginCommand=function(self)
			self:settext("This is the DDR 4th Mix Theme based off the DDR 4th Mix Theme by PatrickDDRX. Enjoy this theme");
		end
	};
	LoadFont("_2070polyester square 24px")..{
		InitCommand=cmd(x,244;y,136;halign,1;diffuse,color("#00C0FF");strokecolor,color("#006088"));
		BeginCommand=function(self)
			self:settext("-freem");
		end
	};
};

return t;
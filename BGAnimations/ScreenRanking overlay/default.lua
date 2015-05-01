-- ScreenRanking Overlay

--[[
[Ranking Pages]
[A] 1-3 feet
[B] 4-6 feet
[C] 7-9 feet

Each item has to tween on for the page and off for the page.
--]]
local numBullets = 5
local curType = " "

local t = Def.ActorFrame{
	Name="RankingController";
	OnCommand=function(self)
		self:queuecommand("Page1");
		self:sleep(9)
		self:queuecommand("RankingPageOff")
		self:sleep(0.5)
		self:queuecommand("Page2");
		self:sleep(9)
		self:queuecommand("RankingPageOff")
		self:sleep(0.5)
		self:queuecommand("Page3");
		self:sleep(9)
		self:queuecommand("RankingPageOff")
	end;
	Page1Command=cmd(playcommand,"RankingPageOn",{Type="A"};);
	Page2Command=cmd(playcommand,"RankingPageOn",{Type="B"};);
	Page3Command=cmd(playcommand,"RankingPageOn",{Type="C"};);
	RankingPageOnCommand=function(self,param)
		curType = param.Type;
		self:GetChild("RankingType"..param.Type):playcommand("Show")
		self:GetChild("StyleSingle"):playcommand("Show")
		self:GetChild("StyleDouble"):playcommand("Show")
		for i=1,numBullets do
			self:GetChild("Bullet"..i):playcommand("Show")
		end;
	end;
	RankingPageOffCommand=function(self)
		self:GetChild("RankingType"..curType):playcommand("Hide")
		self:GetChild("StyleSingle"):playcommand("Hide")
		self:GetChild("StyleDouble"):playcommand("Hide")
		for i=1,numBullets do
			self:GetChild("Bullet"..i):playcommand("Hide")
		end;
	end;

	-- ranking type
	LoadActor("_type a")..{
		Name="RankingTypeA";
		InitCommand=cmd(x,SCREEN_CENTER_X+112;y,SCREEN_TOP+47);
		ShowCommand=cmd(zoomx,0;decelerate,0.5;zoomx,1);
		HideCommand=cmd(decelerate,0.5;zoomx,0);
	};
	LoadActor("_type b")..{
		Name="RankingTypeB";
		InitCommand=cmd(x,SCREEN_CENTER_X+112;y,SCREEN_TOP+47;zoomx,0);
		ShowCommand=cmd(zoomx,0;decelerate,0.5;zoomx,1);
		HideCommand=cmd(decelerate,0.5;zoomx,0);
	};
	LoadActor("_type c")..{
		Name="RankingTypeC";
		InitCommand=cmd(x,SCREEN_CENTER_X+112;y,SCREEN_TOP+47;zoomx,0);
		ShowCommand=cmd(zoomx,0;decelerate,0.5;zoomx,1);
		HideCommand=cmd(decelerate,0.5;zoomx,0);
	};

	-- feet
	LoadActor("_foot glow")..{
		InitCommand=cmd(x,SCREEN_CENTER_X+180;y,SCREEN_TOP+56;blend,Blend.Add);
		OnCommand=cmd(diffuseshift;effectperiod,0.5;effectoffset,0.5;effectcolor1,color("1,1,1,0.1");effectcolor2,color("1,1,1,0.5"));
	};
	LoadActor("_foot base")..{
		InitCommand=cmd(x,SCREEN_CENTER_X+180;y,SCREEN_TOP+56;diffuse,color("0.52,0.52,0.52,1"));
	};
	LoadActor("_foot glow")..{
		InitCommand=cmd(x,SCREEN_CENTER_X+180;y,SCREEN_TOP+56;blend,Blend.Add);
		OnCommand=cmd(diffuseshift;effectperiod,0.5;effectcolor1,color("1,1,1,0.5");effectcolor2,color("1,1,1,0.1"));
	};

	-- side frame
	Def.ActorFrame{
		InitCommand=cmd(x,SCREEN_CENTER_X-286);
		-- todo: slide in and out
		OnCommand=cmd(addx,-SCREEN_CENTER_X/2;linear,0.5;addx,SCREEN_CENTER_X/2);
		OffCommand=cmd(linear,0.5;addx,-SCREEN_CENTER_X/2);

		LoadActor("_frame widetop")..{
			InitCommand=cmd(x,-40;y,SCREEN_CENTER_Y-148;);
		};
		LoadActor("_frame top")..{
			InitCommand=cmd(y,SCREEN_CENTER_Y-148);
		};
		LoadActor("_frame vert")..{
			InitCommand=cmd(y,SCREEN_CENTER_Y+48;zoomy,82;customtexturerect,0,0,1,16);
		};
		LoadActor("_frame vert")..{
			InitCommand=cmd(x,-40;y,SCREEN_CENTER_Y+48;zoomx,-1;zoomy,82;customtexturerect,0,0,1,16);
		};
		LoadActor("_frame bottom")..{
			InitCommand=cmd(y,SCREEN_CENTER_Y+228);
		};
		LoadActor("_frame bottom")..{
			InitCommand=cmd(x,-40;y,SCREEN_CENTER_Y+228;zoomx,-1);
		};
	};

	-- Style Headers
	LoadActor("_style single")..{
		Name="StyleSingle";
		InitCommand=cmd(x,SCREEN_CENTER_X-110;y,SCREEN_CENTER_Y-128;zoom,0);
		ShowCommand=cmd(linear,0.25;zoomy,0.04;linear,0.2;zoomx,1;linear,0.5;zoomy,1);
		HideCommand=cmd(linear,0.25;zoomy,0.04;linear,0.25;zoomx,0);
	};
	LoadActor("_style double")..{
		Name="StyleDouble";
		InitCommand=cmd(x,SCREEN_CENTER_X+162;y,SCREEN_CENTER_Y-128;zoom,0);
		ShowCommand=cmd(linear,0.25;zoomy,0.04;linear,0.2;zoomx,1;linear,0.5;zoomy,1);
		HideCommand=cmd(linear,0.25;zoomy,0.04;linear,0.25;zoomx,0);
	};

	-- bullets
	LoadActor("_bullet 1")..{
		Name="Bullet1";
		InitCommand=cmd(x,SCREEN_CENTER_X-290;y,SCREEN_CENTER_Y-50);
		ShowCommand=cmd(zoomx,0;linear,0.5;zoomx,1);
		HideCommand=cmd(linear,0.5;zoomx,0);
	};
	LoadActor("_bullet 2")..{
		Name="Bullet2";
		InitCommand=cmd(x,SCREEN_CENTER_X-290;y,SCREEN_CENTER_Y-2);
		ShowCommand=cmd(zoomx,0;sleep,0.1;linear,0.5;zoomx,1);
		HideCommand=cmd(sleep,0.1;linear,0.5;zoomx,0);
	};
	LoadActor("_bullet 3")..{
		Name="Bullet3";
		InitCommand=cmd(x,SCREEN_CENTER_X-290;y,SCREEN_CENTER_Y+46);
		ShowCommand=cmd(zoomx,0;sleep,0.2;linear,0.5;zoomx,1);
		HideCommand=cmd(sleep,0.2;linear,0.5;zoomx,0);
	};
	LoadActor("_bullet 4")..{
		Name="Bullet4";
		InitCommand=cmd(x,SCREEN_CENTER_X-290;y,SCREEN_CENTER_Y+94);
		ShowCommand=cmd(zoomx,0;sleep,0.3;linear,0.5;zoomx,1);
		HideCommand=cmd(sleep,0.3;linear,0.5;zoomx,0);
	};
	LoadActor("_bullet 5")..{
		Name="Bullet5";
		InitCommand=cmd(x,SCREEN_CENTER_X-290;y,SCREEN_CENTER_Y+142);
		ShowCommand=cmd(zoomx,0;sleep,0.4;linear,0.5;zoomx,1);
		HideCommand=cmd(sleep,0.4;linear,0.5;zoomx,0);
	};

	LoadActor(THEME:GetPathB("_missing","overlay"));
};

return t;
-- ScreenGallery
--[[ The gallery process consists of three screens:
1) The main menu.
Contains the page list, as well as selected page's status with other info.

2) Page section. (ScreenGalleryPage)
Shows 12 items at a time. You can move up, down, left, or right.
Moving left or right at the edges will switch pages.
Pressing Start on an item will take you to screen 3...

3) The gallery item. (ScreenGalleryPage as well)
Not much to do here. Press Select to toggle the gallery item's information.
--]]
local boxColors = {
	Locked = color("#424242"),
	Unlocked = color("#FFFFFF"),
	Huh = color("#FF62FF"),
}
local boxSize = { x=16, y=12 }

local t = Def.ActorFrame{
	MenuStartP1MessageCommand=cmd(playcommand,"ProcessStart");
	MenuStartP2MessageCommand=cmd(playcommand,"ProcessStart");
	ProcessStartCommand=function(self)
		SCREENMAN:GetTopScreen():PostScreenMessage("SM_BeginFadingOut",0);
	end;

	LoadActor("pagelist");

	LoadFont("_gallery text")..{
		Name="TotalLabel";
		Text="TOTAL 0/228";
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+88;halign,0;);
	};

	LoadActor(THEME:GetPathB("_missing","overlay"));

	-- explanation frame section
	LoadActor(THEME:GetPathG("","_gallery/_explanation frame"))..{
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y+147);
	};
	Def.ActorFrame{
		InitCommand=cmd(x,SCREEN_CENTER_X+210;y,SCREEN_CENTER_Y+141);

		-- row 1
		Def.Quad{ Name="Item1"; InitCommand=cmd(zoomto,boxSize.x,boxSize.y;diffuse,boxColors.Unlocked); };
		Def.Quad{ Name="Item2"; InitCommand=cmd(x,18;zoomto,boxSize.x,boxSize.y;diffuse,boxColors.Locked); };
		Def.Quad{ Name="Item3"; InitCommand=cmd(x,36;zoomto,boxSize.x,boxSize.y;diffuse,boxColors.Locked); };
		Def.Quad{ Name="Item4"; InitCommand=cmd(x,54;zoomto,boxSize.x,boxSize.y;diffuse,boxColors.Locked); };
		-- row 2
		Def.Quad{ Name="Item5"; InitCommand=cmd(y,14;zoomto,boxSize.x,boxSize.y;diffuse,boxColors.Unlocked); };
		Def.Quad{ Name="Item6"; InitCommand=cmd(x,18;y,14;zoomto,boxSize.x,boxSize.y;diffuse,boxColors.Locked); };
		Def.Quad{ Name="Item7"; InitCommand=cmd(x,36;y,14;zoomto,boxSize.x,boxSize.y;diffuse,boxColors.Locked); };
		Def.Quad{ Name="Item8"; InitCommand=cmd(x,54;y,14;zoomto,boxSize.x,boxSize.y;diffuse,boxColors.Locked); };
		-- row 3
		Def.Quad{ Name="Item9"; InitCommand=cmd(y,28;zoomto,boxSize.x,boxSize.y;diffuse,boxColors.Unlocked); };
		LoadActor(THEME:GetPathG("","_gallery/_small new"))..{ Name="New9"; InitCommand=cmd(y,28;); };
		Def.Quad{ Name="Item10"; InitCommand=cmd(x,18;y,28;zoomto,boxSize.x,boxSize.y;diffuse,boxColors.Locked); };
		Def.Quad{ Name="Item11"; InitCommand=cmd(x,36;y,28;zoomto,boxSize.x,boxSize.y;diffuse,boxColors.Locked); };
		Def.Quad{ Name="Item12"; InitCommand=cmd(x,54;y,28;zoomto,boxSize.x,boxSize.y;diffuse,boxColors.Huh); };
	};

	LoadActor(THEME:GetPathG("","_help/_gallery pages"))..{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-34;addy,100;);
		OnCommand=cmd(diffuseblink;effectperiod,1.056;linear,0.25;addy,-100;);
		OffCommand=cmd(linear,0.25;addy,100;);
	};
};

return t;
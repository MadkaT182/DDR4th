local subPageName = getenv("InfoSubPage")
local itemIndex = getenv("InfoIndex")
local itemCount = getenv("NumInfoItems")

local t = Def.ActorFrame{
	LoadFont("_arial black 20px")..{
		Text=subPageName;
		InitCommand=cmd(x,SCREEN_CENTER_X-252;y,SCREEN_CENTER_Y-151;halign,0;zoom,0.75);
	};
	LoadFont("_green gradient")..{
		Name="IndexText";
		InitCommand=cmd(x,SCREEN_CENTER_X+222;y,SCREEN_CENTER_Y-129;queuecommand,"Set";diffuseblink;effectcolor1,color("0.35,1,0,1");effectcolor2,color("#EFB500");effectperiod,0.25);
		SetCommand=function(self)
			self:settext(itemIndex.."/"..itemCount);
		end;
	};
};

if FILEMAN:DoesFileExist(THEME:GetPathG("_info","subpages/"..subPageName)) then
	t[#t+1] = LoadActor(THEME:GetPathG("_info","subpages/"..subPageName));
end

return t;
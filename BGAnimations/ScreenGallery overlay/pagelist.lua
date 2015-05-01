-- ScreenGallery pagelist -- all the heavy lifting goes here
-- state varables

local numPages = 19
local function MakePageItem(pageNum)
	local firstItem = 1 + ((pageNum-1)*12)
	local endItem = pageNum * 12
	return Def.ActorFrame{
		Name="Item"..pageNum;
		--LoadFont("_2070polyester round 24px")..{
		--diffuse,color("#4AFF4A");strokecolor,color("#00096B");zoom,14/24
		LoadFont("_gallery text")..{
			Name="Label";
			Text=string.format("PAGE %2i <%3i - %3i>",pageNum,firstItem,endItem);
			InitCommand=cmd(halign,0;);
		};
	};
end

local galleryPages = {}
for i=1,numPages do
	galleryPages[i] = MakePageItem(i)
end

local t = Def.ActorFrame{
	-- handle inputs
	MenuInputMessageCommand=function(self,param)
		if param.Input == "Start" then
			-- press start toupee!
		else
			-- direction
			if param.Input == "Up" then
				
			elseif param.Input == "Down" then
				
			elseif param.Input == "Left" then
				
			elseif param.Input == "Right" then
				
			end
		end
	end;
	MenuUpP1MessageCommand=function(self) MESSAGEMAN:Broadcast("MenuInput", { Player = PLAYER_1, Input = "Up", }); end;
	MenuUpP2MessageCommand=function(self) MESSAGEMAN:Broadcast("MenuInput", { Player = PLAYER_2, Input = "Up", }); end;
	MenuDownP1MessageCommand=function(self) MESSAGEMAN:Broadcast("MenuInput", { Player = PLAYER_1, Input = "Down", }); end;
	MenuDownP2MessageCommand=function(self) MESSAGEMAN:Broadcast("MenuInput", { Player = PLAYER_2, Input = "Down", }); end;
	MenuLeftP1MessageCommand=function(self) MESSAGEMAN:Broadcast("MenuInput", { Player = PLAYER_1, Input = "Left", }); end;
	MenuLeftP2MessageCommand=function(self) MESSAGEMAN:Broadcast("MenuInput", { Player = PLAYER_2, Input = "Left", }); end;
	MenuRightP1MessageCommand=function(self) MESSAGEMAN:Broadcast("MenuInput", { Player = PLAYER_1, Input = "Right", }); end;
	MenuRightP2MessageCommand=function(self) MESSAGEMAN:Broadcast("MenuInput", { Player = PLAYER_2, Input = "Right", }); end;

	-- actorscroller
	Def.ActorScroller{
		InitCommand=cmd(x,SCREEN_CENTER_X-288;y,SCREEN_CENTER_Y-120);
		children = galleryPages;
		SecondsPerItem=0;
		NumItemsToDraw=numPages*2;
		TransformFunction=function(self, offset, itemIndex, numItems)
			-- split items after 10 into another column
			local xOffset = 0
			if itemIndex > 9 then
				xOffset = 288
			end
			self:x(xOffset)
			if itemIndex < 10 then
				self:y(itemIndex*20)
			else
				self:y((itemIndex - 10) * 20)
			end
		end
	};
};

return t;
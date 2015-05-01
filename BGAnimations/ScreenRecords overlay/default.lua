-- ScreenRecords overlay

-- this is a two part menu:
-- 1) pick a group
-- 2) go through songs and check shit out.

-- possible menu states: 'Menustate_GroupList', 'Menustate_SongList'
local MenuState = 'Menustate_GroupList'
local curSongGroup = ""
local curIndex = 1;

local songGroups = SONGMAN:GetSongGroupNames();

local function MakeGroupItem(groupName)
	return Def.ActorFrame{
		LoadActor("_entry bg");
		LoadFont("_2070polyester round 24px")..{
			Text=SONGMAN:ShortenGroupName(groupName);
			InitCommand=cmd(x,-64;halign,0;zoom,0.6667;maxwidth,172;diffuse,color("1,1,0,1");strokecolor,color("0.35,0.35,0,1"));
		};
	};
end;

local groupList = {};
for i=1,#songGroups do
	groupList[#groupList+1] = MakeGroupItem(songGroups[i])
end;

local t = Def.ActorFrame{
	Def.ActorScroller{
		SecondsPerItem=0;
		NumItemsToDraw=14;
		InitCommand=cmd(x,SCREEN_CENTER_X-150;y,SCREEN_CENTER_Y-144);
		TransformFunction=function(self,offset,itemIndex,numItems)
			self:y(offset * 32);
		end;
		children = groupList;
	};

	LoadActor(THEME:GetPathB("_missing","overlay"));
};

return t;
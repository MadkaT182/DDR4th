-- ScreenMusicScroll overlay: all the songs in the world
local allSongs = SONGMAN:GetAllSongs();

local function MakeSongItem(song)
	return LoadFont("_song scroll")..{
		Text=song:GetTranslitFullTitle();
		InitCommand=cmd(diffuse,SONGMAN:GetSongColor(song));
	};
end;

-- todo: sort songs by alphabet
local function SongSort(s1, s2)
	-- write me
end

local scrollerChildren = {};
for song in ivalues(allSongs) do
	scrollerChildren[#scrollerChildren+1] = Def.ActorFrame{ MakeSongItem(song); };
end;

local t = Def.ActorFrame{
	Def.ActorScroller{
		SecondsPerItem=0.125;
		NumItemsToDraw=36;
		InitCommand=cmd(CenterX;y,SCREEN_BOTTOM-88);
		OnCommand=cmd(ScrollThroughAllItems);
		TransformFunction=function(self,offset,itemIndex,numItems)
			self:y(offset * 44);
		end;
		children = scrollerChildren;
	};
};

return t;
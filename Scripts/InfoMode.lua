-- functions for Information Mode-related stuff

infoPages = {
	{ Name = "Introduction",		SubPage="Introduction" },
	{ Name = "Theme Version Info",	Screen = "ScreenThemeVersionInfo", Color = color("#8BFF8B") },
	-- quick debugging:
	--[[
	{ Name = "Model Test",			Screen = "ScreenModelTest" },
	{ Name = "HowToPlay",			Screen = "ScreenHowToPlay" },
	{ Name = "Demonstration",		Screen = "ScreenDemonstration" },
	{ Name = "Ranking",				Screen = "ScreenRanking" },
	{ Name = "Music Scroll",		Screen = "ScreenMusicScroll" },
	--]]
}

-- everything below here doesn't really work, lol
function ReadInfoFile(name,data)
	local infoDef = { Name = nil, Screen = nil, SubPage = nil };
	-- Valid tags:
	-- #TITLE: Sets title
	-- #SCREEN: Sets the screen to go to (optional)
	-- The rest is assumed to be the text.
	local lines = split("\r\n",data);
	for i=1,#lines do
		local thisLine = lines[i]
		if string.find(thisLine,"#TITLE:") then
			local title = string.sub(lines[i],8)
			infoDef.Name = title;
		end;
		if string.find(thisLine,"#SCREEN:") then
			local screen = string.sub(lines[i],9)
			infoDef.Screen = screen;
		end;
	end;
	if not infoDef.Screen then
		infoDef.SubPage = name;
	end
	return infoDef;
end;

-- GetInfoPages()
-- Returns a table of 
function GetInfoPages()
	-- search theme's "Other" directory
	local infoFiles = FILEMAN:GetDirListing(ThemeDir.."/Other/*.info")

	local ret = { }
	local Name, Screen, SubPage;
	local pathBase = ThemeDir.."/Other/"
	if #infoFiles > 0 then
		for i=1,#infoFiles do
			-- read infofile
			local thisInfo = File.Read(pathBase..infoFiles[i])
			if thisInfo then
				local infoName = string.sub(infoFiles[i],1,string.len(infoFiles[i])-5)
				ret[#ret+1] = ReadInfoFile(infoName,thisInfo)
			end
		end;
	end
	return ret;
end

function ReadInfoFileBody(name)
	local pathBase = ThemeDir.."/Other/"
	local thisInfo = File.Read(pathBase..name)
	if thisInfo then
		local lines;
		join("\n",lines)
		for i=1,#lines do
			if not string.find(lines[i],"#TITLE:") and not string.find(lines[i],"#SCREEN:") then
				-- assumes info is all on one line
				return lines[i]
			end
		end
	end;
end

function GetInfoFile(name)
	
end;
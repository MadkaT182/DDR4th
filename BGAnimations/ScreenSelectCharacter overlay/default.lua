local Characters = CHARMAN:GetAllCharacters();

local charInfo = {
	PlayerNumber_P1 = {
		Index = 1,
		CharID = Characters[Index],
		Finished = not GAMESTATE:IsHumanPlayer(PLAYER_1)
	};
	PlayerNumber_P2 = {
		Index = 1,
		CharID = Characters[Index],
		Finished = not GAMESTATE:IsHumanPlayer(PLAYER_2)
	};
};

local t = Def.ActorFrame{
	BeginCommand=function(self)
		-- no characters? get out of here.
		if #Characters == 0 then
			SCREENMAN:GetTopScreen():PostScreenMessage('SM_GoToNextScreen',0);
		end
	end;
	Def.Actor{
		Name="InputController";
		MenuInputMessageCommand=function(self,param)
			if GAMESTATE:IsHumanPlayer(param.Player) and not charInfo[param.Player].Finished then
				-- this is just a simple screen with one thing to change.
				-- a refreshing pace from SOMS2's super hellhole of an options menu.
				if param.Input == "Start" then
					Trace(param.Player.." pressed start");
					-- set character
					GAMESTATE:SetCharacter(param.Player,charInfo[param.Player].CharID)
					charInfo[param.Player].Finished = true;
					MESSAGEMAN:Broadcast("CharacterSelected",{ Player = param.Player });

					if charInfo[PLAYER_1].Finished and charInfo[PLAYER_2].Finished then
						SCREENMAN:GetTopScreen():PostScreenMessage("SM_BeginFadingOut",0.1);
					end
				elseif param.Input == "Back" then
					local AllowCancel = false;
					if GAMESTATE:IsHumanPlayer(PLAYER_1) then
						AllowCancel = not charInfo[PLAYER_1].Finished
					else
						AllowCancel = true
					end
					if GAMESTATE:IsHumanPlayer(PLAYER_2) then
						AllowCancel = not charInfo[PLAYER_2].Finished
					else
						AllowCancel = true
					end
					if AllowCancel then
						SCREENMAN:GetTopScreen():Cancel();
					end
				else
					-- directions. much better.
					local idx = charInfo[param.Player].Index
					local ignore = false
					if param.Input == "Up" then
						-- index -4
						if (idx - 3) < 1 then
							-- go to #Characters minus some stuff
						else
							charInfo[param.Player].Index = idx - 34
						end
					elseif param.Input == "Down" then
						-- index +4
						if (idx + 3) > #Characters then
							-- go to 1 plus some stuff
						else
							charInfo[param.Player].Index = idx + 4
						end
					elseif param.Input == "Left" then
						-- index -1
						if idx > 1 then
							charInfo[param.Player].Index = idx - 1
						else
							charInfo[param.Player].Index = #Characters
						end
					elseif param.Input == "Right" then
						-- index +1
						if idx < #Characters then
							charInfo[param.Player].Index = idx + 1
						else
							charInfo[param.Player].Index = 1
						end
					else
						Trace("Input = ".. param.Input);
						ignore = true; -- don't handle unknowns
					end;
					if not ignore then
						MESSAGEMAN:Broadcast("MoveScroller",{Input = param.Input, Player = param.Player});
					end
				end;
			end
		end;
		--MenuUpP1MessageCommand=function(self) MESSAGEMAN:Broadcast("MenuInput", { Player = PLAYER_1, Input = "Up", }); end;
		--MenuUpP2MessageCommand=function(self) MESSAGEMAN:Broadcast("MenuInput", { Player = PLAYER_2, Input = "Up", }); end;
		--MenuDownP1MessageCommand=function(self) MESSAGEMAN:Broadcast("MenuInput", { Player = PLAYER_1, Input = "Down", }); end;
		--MenuDownP2MessageCommand=function(self) MESSAGEMAN:Broadcast("MenuInput", { Player = PLAYER_2, Input = "Down", }); end;
		MenuLeftP1MessageCommand=function(self) MESSAGEMAN:Broadcast("MenuInput", { Player = PLAYER_1, Input = "Left", }); end;
		MenuLeftP2MessageCommand=function(self) MESSAGEMAN:Broadcast("MenuInput", { Player = PLAYER_2, Input = "Left", }); end;
		MenuRightP1MessageCommand=function(self) MESSAGEMAN:Broadcast("MenuInput", { Player = PLAYER_1, Input = "Right", }); end;
		MenuRightP2MessageCommand=function(self) MESSAGEMAN:Broadcast("MenuInput", { Player = PLAYER_2, Input = "Right", }); end;
		-- via codes
		CodeMessageCommand=function(self,param)
			MESSAGEMAN:Broadcast("MenuInput", { Player = param.PlayerNumber, Input = param.Name, })
		end;
	};

	LoadActor("absenceDisplay");
	LoadActor("nameFrames");

	LoadActor("_explanation")..{
		InitCommand=cmd(x,SCREEN_CENTER_X-101;y,SCREEN_CENTER_Y-168;cropbottom,1);
		OnCommand=cmd(linear,0.5;cropbottom,0);
		OffCommand=cmd(linear,0.5;cropbottom,1);
	};

	LoadActor(THEME:GetPathG("","_help/_lr-start "..GetGraphicType()))..{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-34;addy,100;);
		OnCommand=cmd(diffuseblink;effectperiod,1.056;linear,0.25;addy,-100;);
		OffCommand=cmd(linear,0.25;addy,100;);
	};
};

local charIcon = function(char,player)
	local charID = NormalizeCharID(char:GetCharacterID())

	local ret = Def.ActorFrame{
		Name="Icon-"..charID;
		BeginCommand=cmd(playcommand,"LoseFocus");
		GainFocusCommand=function(self)
			self:GetChild("Selector"):playcommand("GainFocus");
			self:GetChild("IconBase"):playcommand("GainFocus");
			self:GetChild("CharBase"):playcommand("GainFocus");
			if self:GetChild("CharDiffuse") then
				self:GetChild("CharDiffuse"):playcommand("GainFocus");
			end
		end;
		LoseFocusCommand=function(self)
			self:GetChild("Selector"):playcommand("LoseFocus");
			self:GetChild("IconBase"):playcommand("LoseFocus");
			self:GetChild("CharBase"):playcommand("LoseFocus");
			if self:GetChild("CharDiffuse") then
				self:GetChild("CharDiffuse"):playcommand("LoseFocus");
			end
		end;
		CharacterSelectedMessageCommand=function(self,param)
			if param.Player == player then
				local p = string.sub(self:GetName(),6);
				if NormalizeCharID(charInfo[param.Player].CharID) ~= p then
					self:playcommand("OffUnfocused");
				end
			end
		end;
		OffUnfocusedCommand=function(self)
			self:GetChild("StarBase"):playcommand("OffUnfocused");
			--self:GetChild("StarDiffuse"):playcommand("OffUnfocused");
			self:GetChild("IconBase"):playcommand("OffUnfocused");
		end;

		-- add icon base
		LoadActor(THEME:GetPathB("ScreenSelectCharacter","overlay/_icon blank"))..{
			Name="IconBase";
			OnCommand=cmd(zoomx,0;linear,0.25;zoomx,1);
			GainFocusCommand=cmd(diffuse,color("1,1,1,1"));
			LoseFocusCommand=cmd(diffuse,color("0.5,0.5,0.5,1"));
			OffUnfocusedCommand=cmd(zoomx,1;linear,0.25;zoomx,0;);
		};
	};

	-- doesn't work how I'd like. too many missing files
	--[[
	local diffuseFile = THEME:GetPathG("_char","icons/"..charID.."_diffuse",true)
	if string.find(diffuseFile, "_missing") then
		ret[#ret+1] = LoadActor(THEME:GetPathG("_char","icons/"..charID))..{
			Name="CharBase";
			GainFocusCommand=cmd(diffuse,color("1,1,1,1"));
			LoseFocusCommand=cmd(diffuse,color("0.5,0.5,0.5,1"));
		};
	else
		-- add char diffuse
		ret[#ret+1] = LoadActor(THEME:GetPathG("_char","icons/"..charID.."_diffuse"))..{
			Name="CharDiffuse";
			InitCommand=cmd(diffuse,PlayerColor(player));
			GainFocusCommand=cmd(diffuse,PlayerColor(player));
			LoseFocusCommand=cmd(diffuse,BoostColor(PlayerColor(player),0.5));
		};
		-- add char base
		ret[#ret+1] = LoadActor(THEME:GetPathG("_char","icons/"..charID.."_base"))..{
			Name="CharBase";
			GainFocusCommand=cmd(diffuse,color("1,1,1,1"));
			LoseFocusCommand=cmd(diffuse,color("0.5,0.5,0.5,1"));
		};
	end;
	--]]
	-- does not work how I'd like
	local diffuseFile = THEME:GetPathG("_char","icons/"..charID.."_diffuse",true)
	local hasDiffuse = string.find(diffuseFile, "_missing")
	-- xxx: bad hack
	local hasTwoPart = {
		-- 5th mix characters
		["(5th) 2mb"]		= true,
		["(5th) Afro"]		= true,
		["(5th) Alice"]		= true,
		["(5th) Baby-Lon"]	= true,
		["(5th) Charmy"]	= true,
		["(5th) Emi"]		= true,
		["(5th) Janet"]		= true,
		["(5th) Johnny"]	= true,
		["(5th) Maho"]		= true,
		["(5th) Naoki"]		= true,
		["(5th) Nmr"]		= true,
		["(5th) Princess Zukin"] = true,
		["(5th) Rage"]		= true,
		["(5th) Robo2001"]		= true,
		["(5th) Spike"]		= true,
		["(5th) U1"]		= true,
		-- other ddr character icons
		-- [todo; some pain]
		-- custom ddr character icons
		-- [todo; re-editing some 5th mix icons :)]
		-- custom character icons
		-- [todo; the worst part]
		-- redirs
		["Emi"]				= true,
		["X-alice"]			= true,
		["X-emi"]			= true,
		["X-ura-emi"]		= true,
	};
	local twoPart = hasTwoPart[charID]

	if twoPart then
		-- add char diffuse
		ret[#ret+1] = LoadActor(THEME:GetPathG("_char","icons/"..charID.."_diffuse"))..{
			Name="CharDiffuse";
			InitCommand=cmd(diffuse,PlayerColor(player));
			OnCommand=cmd(zoomx,0;linear,0.25;zoomx,1);
			GainFocusCommand=cmd(diffuse,PlayerColor(player));
			LoseFocusCommand=cmd(diffuse,BoostColor(PlayerColor(player),0.5));
		};
		-- add char base
		ret[#ret+1] = LoadActor(THEME:GetPathG("_char","icons/"..charID.."_base"))..{
			Name="CharBase";
			OnCommand=cmd(zoomx,0;linear,0.25;zoomx,1);
			GainFocusCommand=cmd(diffuse,color("1,1,1,1"));
			LoseFocusCommand=cmd(diffuse,color("0.5,0.5,0.5,1"));
		};
	else
		ret[#ret+1] = LoadActor(THEME:GetPathG("_char","icons/"..charID))..{
			Name="CharBase";
			OnCommand=cmd(zoomx,0;linear,0.25;zoomx,1);
			GainFocusCommand=cmd(diffuse,color("1,1,1,1"));
			LoseFocusCommand=cmd(diffuse,color("0.5,0.5,0.5,1"));
		};
	end;

	-- add focus
	ret[#ret+1] = LoadActor(THEME:GetPathB("ScreenSelectCharacter","overlay/_icon add"))..{
		Name="Selector";
		InitCommand=cmd(blend,Blend.Add;visible,false;diffusealpha,0.5);
		OnCommand=cmd(zoomx,0;linear,0.25;zoomx,1);
		GainFocusCommand=cmd(diffuseshift;visible,true);
		LoseFocusCommand=cmd(stopeffect;visible,false);
		CharacterSelectedMessageCommand=function(self,param)
			if param.Player == player and charID ~= NormalizeCharID(charInfo[param.Player].CharID) then
				self:visible(false)
			end;
		end;
	};
	ret[#ret+1] = LoadActor(THEME:GetPathB("ScreenSelectCharacter","overlay/_icon star full"))..{
		Name="StarBase";
		InitCommand=cmd(diffusealpha,0);
		OffUnfocusedCommand=cmd(zoomx,0;diffusealpha,1;linear,0.25;zoomx,1;);
	};
	--[[
	ret[#ret+1] = LoadActor(THEME:GetPathB("ScreenSelectCharacter","overlay/_icon star diffuse"))..{
		Name="StarDiffuse";
		InitCommand=cmd(diffusecolor,PlayerColor(player);diffusealpha,0);
		OffUnfocusedCommand=cmd(zoomx,0;diffusealpha,1;linear,0.25;zoomx,1;);
	};
	--]]

	return ret;
end;

local charsP1 = {};
local charsP2 = {};
for char in ivalues(Characters) do
	charsP1[#charsP1+1] = charIcon(char,PLAYER_1)
	charsP2[#charsP2+1] = charIcon(char,PLAYER_2)
end;

local xSplit = 0;
local ySplit = 0;
-- xxx: think of a better way to handle this
local limits = {
	{ Min = 0, Max = 9, DestIndex = 0 },
	{ Min = 8, Max = 17, DestIndex = 8 },
	{ Min = 16, Max = 25, DestIndex = 16 },
	{ Min = 24, Max = 33, DestIndex = 24 },
	{ Min = 32, Max = 41, DestIndex = 32 },
	{ Min = 40, Max = 49, DestIndex = 40 },
	{ Min = 48, Max = 56, DestIndex = 48 },
};
--[[
layout

<< ## ## ##
## ## ## ##

## ## ## ##
## ## ## >>

index table
<< __ __ __ __ __ __ >>
 0  1  2  3  4  5  6  7
<<Max __ __ __ __ __ >>
 8  9 10 11 12 13 14 15
16 17 18 19 20 21 22 23
24 25 26 27 28 29 30 31
32 33 34 35 36 37 38 39
40 41 42 43 44 45 46 47
48 49 50 51 52 53 54 55

if curIndex == 0 then
	-- special hardcoded instance to show at beginning
	self:SetCurrentAndDestinationItem(curIndex-1);
elseif curIndex % 8 == 0 then
	-- every 8 is a new row.
	local factor = curIndex / 8;
	self:SetCurrentAndDestinationItem(curIndex-1 + (factor*8));
else
	if curIndex+1 % 8 == 0 then
		-- going backwards, perhaps.
		local factor = curIndex+1 / 8;
		self:SetCurrentAndDestinationItem(curIndex-1 + (factor*8));
	end
end

the problem here is figuring out the >> column.
--]]
local p1Icons = Def.ActorScroller{
	SecondsPerItem=0;
	NumItemsToDraw=16;
	children = charsP1;
	InitCommand=cmd(x,SCREEN_LEFT;y,SCREEN_TOP;SetLoop,true;SetCurrentAndDestinationItem,0;player,PLAYER_1);
	TransformFunction=function(self, offset, itemIndex, numItems)
		xSplit = (offset > 3) and 4 or 0
		ySplit = (offset > 3) and 1 or 0

		if offset < 0 or offset > 8 then
			-- hide items that shouldn't be on screen
			self:x(-SCREEN_WIDTH)
		else
			self:x((SCREEN_CENTER_X-268)+((offset-xSplit)*71));
		end;
		self:y((SCREEN_CENTER_Y+45)+(ySplit*88))
	end;
	OnCommand=function(self)
		local curIndex = charInfo[PLAYER_1].Index
		local curIcon = NormalizeCharID(Characters[curIndex]:GetCharacterID())
		self:GetChild("Icon-"..curIcon):playcommand("GainFocus");
		MESSAGEMAN:Broadcast("CharacterChanged",{Player = PLAYER_1, Character = Characters[curIndex]})
	end;
	MoveScrollerMessageCommand=function(self,param)
		if param.Player == PLAYER_1 then
			local curIndex = charInfo[param.Player].Index
			charInfo[param.Player].CharID = NormalizeCharID(Characters[curIndex]:GetCharacterID())

			local prevIndex = -1;
			if param.Input == "Up" then
				-- -4
				prevIndex = curIndex + 4;
			elseif param.Input == "Down" then
				-- +4
				prevIndex = curIndex - 4;
			elseif param.Input == "Left" then
				-- -1
				if curIndex == #Characters then
					prevIndex = 1
				else
					prevIndex = curIndex + 1;
				end;
			elseif param.Input == "Right" then
				-- +1
				if curIndex == 1 then
					prevIndex = #Characters
				else
					prevIndex = curIndex - 1;
				end;
			end;

			-- scroller
			-- broken going backwards:
			--[[
			if curIndex % 9 == 0 then
				self:SetCurrentAndDestinationItem(curIndex - 1);
			elseif prevIndex % 9 == 0 then
				self:SetCurrentAndDestinationItem(curIndex - 8);
			end
			--]]
			for info in ivalues(limits) do
				if curIndex > info.Min and curIndex < info.Max then
					self:SetCurrentAndDestinationItem(info.DestIndex);
				end
			end;

			-- update name in top frame
			MESSAGEMAN:Broadcast("CharacterChanged",{Player = param.Player, Character = Characters[curIndex]})

			-- GainFocus/LoseFocus
			local prevChar = Characters[prevIndex];
			if prevChar then
				local prevIcon = NormalizeCharID(prevChar:GetCharacterID())
				self:GetChild("Icon-"..prevIcon):playcommand("LoseFocus");
			end
			local curChar = Characters[curIndex];
			if curChar then
				local curIcon = NormalizeCharID(curChar:GetCharacterID())
				self:GetChild("Icon-"..curIcon):playcommand("GainFocus");
			end;
		end;
	end;
};

local p2Icons = Def.ActorScroller{
	SecondsPerItem=0;
	NumItemsToDraw=16;
	children = charsP2;
	InitCommand=cmd(x,SCREEN_LEFT;y,SCREEN_TOP;SetLoop,true;SetCurrentAndDestinationItem,0;player,PLAYER_2);
	TransformFunction=function(self, offset, itemIndex, numItems)
		xSplit = (offset > 3) and 4 or 0
		ySplit = (offset > 3) and 1 or 0

		if offset < 0 or offset > 8 then
			-- hide items that shouldn't be on screen
			self:x(SCREEN_WIDTH*2)
		else
			self:x((SCREEN_CENTER_X+66)+((offset-xSplit)*71));
		end;
		self:y((SCREEN_CENTER_Y+5)+(ySplit*88))
	end;
	OnCommand=function(self)
		local curIndex = charInfo[PLAYER_2].Index
		local curIcon = NormalizeCharID(Characters[curIndex]:GetCharacterID())
		self:GetChild("Icon-"..curIcon):playcommand("GainFocus");
		MESSAGEMAN:Broadcast("CharacterChanged",{Player = PLAYER_2, Character = Characters[curIndex]})
	end;
	MoveScrollerMessageCommand=function(self,param)
		if param.Player == PLAYER_2 then
			local curIndex = charInfo[param.Player].Index
			charInfo[param.Player].CharID = NormalizeCharID(Characters[curIndex]:GetCharacterID())

			local prevIndex = -1;
			if param.Input == "Up" then
				-- -4
				prevIndex = curIndex + 4;
			elseif param.Input == "Down" then
				-- +4
				prevIndex = curIndex - 4;
			elseif param.Input == "Left" then
				-- -1
				if curIndex == #Characters then
					prevIndex = 1
				else
					prevIndex = curIndex + 1;
				end;
			elseif param.Input == "Right" then
				-- +1
				if curIndex == 1 then
					prevIndex = #Characters
				else
					prevIndex = curIndex - 1;
				end;
			end;

			for info in ivalues(limits) do
				if curIndex > info.Min and curIndex < info.Max then
					self:SetCurrentAndDestinationItem(info.DestIndex);
				end
			end;

			MESSAGEMAN:Broadcast("CharacterChanged",{Player = param.Player, Character = Characters[curIndex]})
			local prevChar = Characters[prevIndex];
			if prevChar then
				local prevIcon = NormalizeCharID(prevChar:GetCharacterID())
				self:GetChild("Icon-"..prevIcon):playcommand("LoseFocus");
			end

			local curChar = Characters[curIndex];
			if curChar then
				local curIcon = NormalizeCharID(curChar:GetCharacterID())
				self:GetChild("Icon-"..curIcon):playcommand("GainFocus");
			end;
		end;
	end;
};

t[#t+1] = p1Icons;
t[#t+1] = p2Icons;

return t;
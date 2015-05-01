local Player = ...
assert(Player,"Needs a Player passed in.")

--[[
This is a recreation of DDR 5th Mix's options icon display.

There are three groups of mods:
* Mirror, Left, Right, Shuffle
* Hidden, Sudden, Stealth
* Little, Flat
--]]

local IconPositions = {
	Appearance = {
		PlayerNumber_P1 = 0,
		PlayerNumber_P2 = 58
	},
	Turns = {
		PlayerNumber_P1 = 29,
		PlayerNumber_P2 = 29
	},
	Other = {
		PlayerNumber_P1 = 58,
		PlayerNumber_P2 = 0
	}
};

local AppearanceOptions = {
	"hidden", "hiddenoffset",
	"sudden", "suddenoffset",
	"stealth", "blink", "randomvanish"
};

local TurnOptions = {
	"mirror", "left", "right",
	"shuffle", "softshuffle", "supershuffle"
};

local t = Def.ActorFrame{
	Def.Sprite{
		Name="Appearance";
		InitCommand=cmd(player,Player;x,IconPositions.Appearance[Player]);
		OnCommand=cmd(playcommand,"Update");
		UpdateCommand=function(self)
			-- check for Hidden, Sudden, Stealth.
			local playerMods = GAMESTATE:GetPlayerState(Player):GetPlayerOptionsString('ModsLevel_Preferred')
			playerMods = split(", ", playerMods)
			local loadPath = THEME:GetPathG("","_blank");
			for i=1,#playerMods do
				local input = string.lower(playerMods[i])
				if input == "hidden" then
					loadPath = THEME:GetPathG("ScreenSelectMusic","OptionIcons/_hidden.png")
				elseif input == "hiddenoffset" then
					loadPath = THEME:GetPathG("ScreenSelectMusic","OptionIcons/_hiddenoffset")
				elseif input == "sudden" then
					loadPath = THEME:GetPathG("ScreenSelectMusic","OptionIcons/_sudden.png")
				elseif input == "suddenoffset" then
					loadPath = THEME:GetPathG("ScreenSelectMusic","OptionIcons/_suddenoffset")
				elseif input == "stealth" then
					loadPath = THEME:GetPathG("ScreenSelectMusic","OptionIcons/_stealth")
				elseif input == "blink" then
					loadPath = THEME:GetPathG("ScreenSelectMusic","OptionIcons/_blink")
				elseif input == "randomvanish" then
					loadPath = THEME:GetPathG("ScreenSelectMusic","OptionIcons/_randomvanish")
				end
			end
			self:Load(loadPath);
		end;
		PlayerOptionsChangedMessageCommand=function(self,param)
			if param.PlayerNumber == Player then
				self:playcommand("Update");
			end;
		end;
	};
	Def.Sprite{
		Name="Turns";
		InitCommand=cmd(player,Player;x,IconPositions.Turns[Player]);
		OnCommand=cmd(playcommand,"Update");
		UpdateCommand=function(self)
			-- check for Mirror, Left, Right, Shuffle
			local playerMods = GAMESTATE:GetPlayerState(Player):GetPlayerOptionsString('ModsLevel_Preferred')
			playerMods = split(", ", playerMods)
			local loadPath = THEME:GetPathG("","_blank");
			for i=1,#playerMods do
				local input = string.lower(playerMods[i])
				for j=1,#TurnOptions do
					if TurnOptions[j] == input then
						loadPath = THEME:GetPathG("ScreenSelectMusic","OptionIcons/_"..input)
					end
				end;
			end
			self:Load(loadPath);
		end;
		PlayerOptionsChangedMessageCommand=function(self,params)
			if params.PlayerNumber == Player then
				self:playcommand("Update");
			end;
		end;
	};
	Def.Sprite{
		Name="Other";
		InitCommand=cmd(player,Player;x,IconPositions.Other[Player]);
		OnCommand=cmd(playcommand,"Update");
		UpdateCommand=function(self)
			-- check for Little, Flat
			local playerMods = GAMESTATE:GetPlayerState(Player):GetPlayerOptionsString('ModsLevel_Preferred')
			playerMods = split(", ", playerMods)
			local loadPath = THEME:GetPathG("","_blank");
			for i=1,#playerMods do
				local input = string.lower(playerMods[i])
				if input == "little" then
					loadPath = THEME:GetPathG("ScreenSelectMusic","OptionIcons/_little")
				elseif input == "flat" then
					loadPath = THEME:GetPathG("ScreenSelectMusic","OptionIcons/_flat")
				end;
			end
			self:Load(loadPath);
		end;
		PlayerOptionsChangedMessageCommand=function(self,params)
			if params.PlayerNumber == Player then
				self:playcommand("Update");
			end;
		end;
	};
};

return t;
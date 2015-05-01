-- ScreenDietMenu overlay
local MenuState = {
	PlayerNumber_P1 = {
		CurIndex = 6,
		Finished = not GAMESTATE:IsHumanPlayer(PLAYER_1),
		Weight = 200,
		Goal = nil,
		Course = nil,
	},
	PlayerNumber_P2 = {
		CurIndex = 6,
		Finished = not GAMESTATE:IsHumanPlayer(PLAYER_2),
		Weight = 200,
		Goal = nil,
		Course = nil,
	},
	NonstopMode = false,
};

local courses = { "easy", "normal", "diet" }

-- Note: Player 2 can only access the date if they are the master player.
local masterPlayer = GAMESTATE:GetMasterPlayerNumber()

local t = Def.ActorFrame{
	MenuInputMessageCommand=function(self,param)
		if GAMESTATE:IsHumanPlayer(param.Player) and not MenuState[param.Player].Finished then
			if param.Input == "Start" then
				-- check stuff
				if MenuState[param.Player].CurIndex == 6 then
					-- player is done
					--MenuState[param.Player].Finished = true
				end
			elseif param.Input == "Select" then
				-- toggle Nonstop
				MESSAGEMAN:Broadcast("ChangeNonstopStatus");
			else
				-- direction
				local curIndex = MenuState[param.Player].CurIndex
				local ignore = false
				-- todo: handle secondary player (can't go to option 5)
				if param.Input == "Up" then
					if curIndex > 1 then
						if param.Player ~= GAMESTATE:GetMasterPlayerNumber() then
							if curIndex == 6 then
								MenuState[param.Player].CurIndex = 4
							else
								MenuState[param.Player].CurIndex = curIndex - 1
							end
						else
							MenuState[param.Player].CurIndex = curIndex - 1
						end
						
					end
				elseif param.Input == "Down" then
					if curIndex < 6 then
						if param.Player ~= GAMESTATE:GetMasterPlayerNumber() then
							if curIndex == 4 then
								MenuState[param.Player].CurIndex = 6
							else
								MenuState[param.Player].CurIndex = curIndex + 1
							end
						else
							MenuState[param.Player].CurIndex = curIndex + 1
						end
					end
				else
					-- pass left/right to current line
					ignore = true;
					MESSAGEMAN:Broadcast("PlayerChangedOption",{Player = param.Player, Direction = param.Input})
				end;
				if not ignore then
					MESSAGEMAN:Broadcast("PlayerChangedFocus",{Player = param.Player});
				end
			end;
		end;
	end;
	MenuUpP1MessageCommand=function(self) MESSAGEMAN:Broadcast("MenuInput", { Player = PLAYER_1, Input = "Up", }); end;
	MenuUpP2MessageCommand=function(self) MESSAGEMAN:Broadcast("MenuInput", { Player = PLAYER_2, Input = "Up", }); end;
	MenuDownP1MessageCommand=function(self) MESSAGEMAN:Broadcast("MenuInput", { Player = PLAYER_1, Input = "Down", }); end;
	MenuDownP2MessageCommand=function(self) MESSAGEMAN:Broadcast("MenuInput", { Player = PLAYER_2, Input = "Down", }); end;
	MenuLeftP1MessageCommand=function(self) MESSAGEMAN:Broadcast("MenuInput", { Player = PLAYER_1, Input = "Left", }); end;
	MenuLeftP2MessageCommand=function(self) MESSAGEMAN:Broadcast("MenuInput", { Player = PLAYER_2, Input = "Left", }); end;
	MenuRightP1MessageCommand=function(self) MESSAGEMAN:Broadcast("MenuInput", { Player = PLAYER_1, Input = "Right", }); end;
	MenuRightP2MessageCommand=function(self) MESSAGEMAN:Broadcast("MenuInput", { Player = PLAYER_2, Input = "Right", }); end;
	MenuStartP1MessageCommand=function(self) MESSAGEMAN:Broadcast("MenuInput", { Player = PLAYER_1, Input = "Start", }); end;
	MenuStartP2MessageCommand=function(self) MESSAGEMAN:Broadcast("MenuInput", { Player = PLAYER_2, Input = "Start", }); end;
	-- codes
	CodeMessageCommand=function(self,param)
		MESSAGEMAN:Broadcast("MenuInput", { Player = param.PlayerNumber, Input = param.Name, })
	end;

	-- begin labels
	Def.ActorFrame{
		Name="ItemLabels";
		Def.ActorFrame{
			Name="WeightLabel";
			InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-148;visible,false);
			GainFocusCommand=cmd(bob;effectmagnitude,0,-5,0;visible,true;);
			LoseFocusCommand=cmd(stopeffect;visible,false);
			PlayerChangedFocusMessageCommand=function(self,params)
				if MenuState[params.Player].CurIndex == 1 then
					self:playcommand("GainFocus");
					if params.Player == PLAYER_1 then
						self:GetChild("Left"):playcommand("GainFocus")
					elseif params.Player == PLAYER_2 then
						self:GetChild("Right"):playcommand("GainFocus")
					end
				else
					self:playcommand("LoseFocus");
					if params.Player == PLAYER_1 then
						self:GetChild("Left"):playcommand("LoseFocus")
					elseif params.Player == PLAYER_2 then
						self:GetChild("Right"):playcommand("LoseFocus")
					end
				end;
			end;

			LoadActor("_label weight");
			LoadActor("_label left")..{
				Name="Left";
				InitCommand=cmd(x,-81;y,-1;halign,0;visible,false);
				GainFocusCommand=cmd(visible,GAMESTATE:IsPlayerEnabled(PLAYER_1));
				LoseFocusCommand=cmd(visible,false);
			};
			LoadActor("_label right")..{
				Name="Right";
				InitCommand=cmd(x,81;y,-1;halign,1;visible,false);
				GainFocusCommand=cmd(visible,GAMESTATE:IsPlayerEnabled(PLAYER_2));
				LoseFocusCommand=cmd(visible,false);
			};
		};
		Def.ActorFrame{
			Name="MenuLabel";
			InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-96;visible,false);
			GainFocusCommand=cmd(bob;effectmagnitude,0,-5,0;visible,true);
			LoseFocusCommand=cmd(stopeffect;visible,false);
			PlayerChangedFocusMessageCommand=function(self,params)
				if MenuState[params.Player].CurIndex == 2 then
					self:playcommand("GainFocus");
					if params.Player == PLAYER_1 then
						self:GetChild("Left"):playcommand("GainFocus")
					elseif params.Player == PLAYER_2 then
						self:GetChild("Right"):playcommand("GainFocus")
					end
				else
					self:playcommand("LoseFocus");
					if params.Player == PLAYER_1 then
						self:GetChild("Left"):playcommand("LoseFocus")
					elseif params.Player == PLAYER_2 then
						self:GetChild("Right"):playcommand("LoseFocus")
					end
				end;
			end;

			LoadActor("_label menu");
			LoadActor("_label left")..{
				Name="Left";
				InitCommand=cmd(x,-81;y,-1;halign,0;visible,false);
				GainFocusCommand=cmd(visible,GAMESTATE:IsPlayerEnabled(PLAYER_1));
				LoseFocusCommand=cmd(visible,false);
			};
			LoadActor("_label right")..{
				Name="Right";
				InitCommand=cmd(x,81;y,-1;halign,1;visible,false);
				GainFocusCommand=cmd(visible,GAMESTATE:IsPlayerEnabled(PLAYER_2));
				LoseFocusCommand=cmd(visible,false);
			};
		};
		Def.ActorFrame{
			Name="GoalLabel";
			InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-40;visible,false);
			GainFocusCommand=cmd(bob;effectmagnitude,0,-5,0;visible,true);
			LoseFocusCommand=cmd(stopeffect;visible,false);
			PlayerChangedFocusMessageCommand=function(self,params)
				if MenuState[params.Player].CurIndex == 3 then
					self:playcommand("GainFocus");
					if params.Player == PLAYER_1 then
						self:GetChild("Left"):playcommand("GainFocus")
					elseif params.Player == PLAYER_2 then
						self:GetChild("Right"):playcommand("GainFocus")
					end
				else
					self:playcommand("LoseFocus");
					if params.Player == PLAYER_1 then
						self:GetChild("Left"):playcommand("LoseFocus")
					elseif params.Player == PLAYER_2 then
						self:GetChild("Right"):playcommand("LoseFocus")
					end
				end;
			end;

			LoadActor("_label goal");
			LoadActor("_label left")..{
				Name="Left";
				InitCommand=cmd(x,-81;y,-1;halign,0;visible,false);
				GainFocusCommand=cmd(visible,GAMESTATE:IsPlayerEnabled(PLAYER_1));
				LoseFocusCommand=cmd(visible,false);
			};
			LoadActor("_label right")..{
				Name="Right";
				InitCommand=cmd(x,81;y,-1;halign,1;visible,false);
				GainFocusCommand=cmd(visible,GAMESTATE:IsPlayerEnabled(PLAYER_2));
				LoseFocusCommand=cmd(visible,false);
			};
		};
		Def.ActorFrame{
			Name="CourseLabel";
			InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y+20;visible,false);
			GainFocusCommand=cmd(bob;effectmagnitude,0,-5,0;visible,true);
			LoseFocusCommand=cmd(stopeffect;visible,false);
			PlayerChangedFocusMessageCommand=function(self,params)
				if MenuState[params.Player].CurIndex == 4 then
					self:playcommand("GainFocus");
					if params.Player == PLAYER_1 then
						self:GetChild("Left"):playcommand("GainFocus")
					elseif params.Player == PLAYER_2 then
						self:GetChild("Right"):playcommand("GainFocus")
					end
				else
					self:playcommand("LoseFocus");
					if params.Player == PLAYER_1 then
						self:GetChild("Left"):playcommand("LoseFocus")
					elseif params.Player == PLAYER_2 then
						self:GetChild("Right"):playcommand("LoseFocus")
					end
				end;
			end;

			LoadActor("_label course");
			LoadActor("_label left")..{
				Name="Left";
				InitCommand=cmd(x,-81;y,-1;halign,0;visible,false);
				GainFocusCommand=cmd(visible,GAMESTATE:IsPlayerEnabled(PLAYER_1));
				LoseFocusCommand=cmd(visible,false);
			};
			LoadActor("_label right")..{
				Name="Right";
				InitCommand=cmd(x,81;y,-1;halign,1;visible,false);
				GainFocusCommand=cmd(visible,GAMESTATE:IsPlayerEnabled(PLAYER_2));
				LoseFocusCommand=cmd(visible,false);
			};
		};
	};
	-- end labels

	Def.ActorFrame{
		Name="ItemsP1";

		-- weight
		Def.ActorFrame{
			Name="Item1Frame";
			InitCommand=cmd(x,SCREEN_CENTER_X-182;y,SCREEN_CENTER_Y-144);
			PlayerChangedFocusMessageCommand=function(self,params)
				if params.Player == PLAYER_1 then
					if MenuState[params.Player].CurIndex == 1 then
						self:GetChild("Frame"):playcommand("GainFocus");
						self:GetChild("LeftArrow"):playcommand("GainFocus");
						self:GetChild("RightArrow"):playcommand("GainFocus");
					else
						self:GetChild("Frame"):playcommand("LoseFocus");
						self:GetChild("LeftArrow"):playcommand("LoseFocus");
						self:GetChild("RightArrow"):playcommand("LoseFocus");
					end
				end;
			end;
			LoadActor("_frame item")..{
				Name="Frame";
				OnCommand=cmd(queuecommand,"LoseFocus");
				GainFocusCommand=cmd(linear,0.125;diffuse,color("1,1,1,1");diffuseshift;effectcolor2,color("1,1,1,1");effectcolor1,color("0.75,0.75,0.75,1"));
				LoseFocusCommand=cmd(stoptweening;stopeffect;decelerate,0.25;diffuse,color("0.5,0.5,0.5,1"));
			};
			LoadActor("_arrow unfocus")..{
				Name="LeftArrow";
				InitCommand=cmd(x,-90;y,-4;);
				GainFocusCommand=function(self) self:Load(THEME:GetPathB("ScreenDietMenu","overlay/_arrow focus")) end;
				LoseFocusCommand=function(self) self:Load(THEME:GetPathB("ScreenDietMenu","overlay/_arrow unfocus")) end;
			};
			LoadActor("_arrow unfocus")..{
				Name="RightArrow";
				InitCommand=cmd(x,86;y,-4;zoomx,-1;);
				GainFocusCommand=function(self) self:Load(THEME:GetPathB("ScreenDietMenu","overlay/_arrow focus")) end;
				LoseFocusCommand=function(self) self:Load(THEME:GetPathB("ScreenDietMenu","overlay/_arrow unfocus")) end;
			};
		};
		-- menu
		Def.ActorFrame{
			Name="Item2Frame";
			InitCommand=cmd(x,SCREEN_CENTER_X-182;y,SCREEN_CENTER_Y-88);
			PlayerChangedFocusMessageCommand=function(self,params)
				if params.Player == PLAYER_1 then
					if MenuState[params.Player].CurIndex == 2 then
						self:GetChild("Frame"):playcommand("GainFocus");
						self:GetChild("LeftArrow"):playcommand("GainFocus");
						self:GetChild("RightArrow"):playcommand("GainFocus");
					else
						self:GetChild("Frame"):playcommand("LoseFocus");
						self:GetChild("LeftArrow"):playcommand("LoseFocus");
						self:GetChild("RightArrow"):playcommand("LoseFocus");
					end
				end;
			end;
			LoadActor("_frame item")..{
				Name="Frame";
				OnCommand=cmd(queuecommand,"LoseFocus");
				GainFocusCommand=cmd(linear,0.125;diffuse,color("1,1,1,1");diffuseshift;effectcolor2,color("1,1,1,1");effectcolor1,color("0.75,0.75,0.75,1"));
				LoseFocusCommand=cmd(stoptweening;stopeffect;decelerate,0.25;diffuse,color("0.5,0.5,0.5,1"));
			};
			LoadActor("_arrow unfocus")..{
				Name="LeftArrow";
				InitCommand=cmd(x,-90;y,-4;);
				GainFocusCommand=function(self) self:Load(THEME:GetPathB("ScreenDietMenu","overlay/_arrow focus")) end;
				LoseFocusCommand=function(self) self:Load(THEME:GetPathB("ScreenDietMenu","overlay/_arrow unfocus")) end;
			};
			LoadActor("_arrow unfocus")..{
				Name="RightArrow";
				InitCommand=cmd(x,86;y,-4;zoomx,-1;);
				GainFocusCommand=function(self) self:Load(THEME:GetPathB("ScreenDietMenu","overlay/_arrow focus")) end;
				LoseFocusCommand=function(self) self:Load(THEME:GetPathB("ScreenDietMenu","overlay/_arrow unfocus")) end;
			};

			Def.Sprite{
				Name="MenuType";
				InitCommand=cmd(x,-8;y,-5);
				BeginCommand=function(self)
					self:Load(THEME:GetPathB("ScreenDietMenu","overlay/_menu none"))
				end;
			};
		};
		-- goal
		Def.ActorFrame{
			Name="Item3Frame";
			InitCommand=cmd(x,SCREEN_CENTER_X-182;y,SCREEN_CENTER_Y-32);
			PlayerChangedFocusMessageCommand=function(self,params)
				if params.Player == PLAYER_1 then
					if MenuState[params.Player].CurIndex == 3 then
						self:GetChild("Frame"):playcommand("GainFocus");
						self:GetChild("LeftArrow"):playcommand("GainFocus");
						self:GetChild("RightArrow"):playcommand("GainFocus");
					else
						self:GetChild("Frame"):playcommand("LoseFocus");
						self:GetChild("LeftArrow"):playcommand("LoseFocus");
						self:GetChild("RightArrow"):playcommand("LoseFocus");
					end
				end;
			end;
			LoadActor("_frame item")..{
				Name="Frame";
				OnCommand=cmd(queuecommand,"LoseFocus");
				GainFocusCommand=cmd(linear,0.125;diffuse,color("1,1,1,1");diffuseshift;effectcolor2,color("1,1,1,1");effectcolor1,color("0.75,0.75,0.75,1"));
				LoseFocusCommand=cmd(stoptweening;stopeffect;decelerate,0.25;diffuse,color("0.5,0.5,0.5,1"));
			};
			LoadActor("_arrow unfocus")..{
				Name="LeftArrow";
				InitCommand=cmd(x,-90;y,-4;);
				GainFocusCommand=function(self) self:Load(THEME:GetPathB("ScreenDietMenu","overlay/_arrow focus")) end;
				LoseFocusCommand=function(self) self:Load(THEME:GetPathB("ScreenDietMenu","overlay/_arrow unfocus")) end;
			};
			LoadActor("_arrow unfocus")..{
				Name="RightArrow";
				InitCommand=cmd(x,86;y,-4;zoomx,-1;);
				GainFocusCommand=function(self) self:Load(THEME:GetPathB("ScreenDietMenu","overlay/_arrow focus")) end;
				LoseFocusCommand=function(self) self:Load(THEME:GetPathB("ScreenDietMenu","overlay/_arrow unfocus")) end;
			};
			-- thing
		};
		-- course
		Def.ActorFrame{
			Name="Item4Frame";
			InitCommand=cmd(x,SCREEN_CENTER_X-182;y,SCREEN_CENTER_Y+28);
			PlayerChangedFocusMessageCommand=function(self,params)
				if params.Player == PLAYER_1 then
					if MenuState[params.Player].CurIndex == 4 then
						self:GetChild("Frame"):playcommand("GainFocus");
						self:GetChild("LeftArrow"):playcommand("GainFocus");
						self:GetChild("RightArrow"):playcommand("GainFocus");
					else
						self:GetChild("Frame"):playcommand("LoseFocus");
						self:GetChild("LeftArrow"):playcommand("LoseFocus");
						self:GetChild("RightArrow"):playcommand("LoseFocus");
					end
				end;
			end;
			LoadActor("_frame course")..{
				Name="Frame";
				OnCommand=cmd(queuecommand,"LoseFocus");
				GainFocusCommand=cmd(linear,0.125;diffuse,color("1,1,1,1");diffuseshift;effectcolor2,color("1,1,1,1");effectcolor1,color("0.75,0.75,0.75,1"));
				LoseFocusCommand=cmd(stoptweening;stopeffect;decelerate,0.25;diffuse,color("0.5,0.5,0.5,1"));
			};
			LoadActor("_arrow unfocus")..{
				Name="LeftArrow";
				InitCommand=cmd(x,-90;y,-8;);
				GainFocusCommand=function(self) self:Load(THEME:GetPathB("ScreenDietMenu","overlay/_arrow focus")) end;
				LoseFocusCommand=function(self) self:Load(THEME:GetPathB("ScreenDietMenu","overlay/_arrow unfocus")) end;
			};
			LoadActor("_arrow unfocus")..{
				Name="RightArrow";
				InitCommand=cmd(x,86;y,-8;zoomx,-1;);
				GainFocusCommand=function(self) self:Load(THEME:GetPathB("ScreenDietMenu","overlay/_arrow focus")) end;
				LoseFocusCommand=function(self) self:Load(THEME:GetPathB("ScreenDietMenu","overlay/_arrow unfocus")) end;
			};

			Def.Sprite{
				Name="CourseType";
				InitCommand=cmd(y,-9);
				BeginCommand=function(self)
					self:Load(THEME:GetPathB("ScreenDietMenu","overlay/_course easy"))
				end;
				PlayerChangedOptionMessageCommand=function(self,param)
					if param.Player == PLAYER_1 then
						if MenuState[param.Player].CurIndex == 4 then
							if MenuState[param.Player].Course == nil then
								MenuState[param.Player].Course = 1
							end
							local courseIdx = MenuState[param.Player].Course

							-- handle switch
							if param.Direction == "Right" then
								-- +1
								courseIdx = courseIdx + 1
								if courseIdx > #courses then
									courseIdx = 1
								end
							elseif param.Direction == "Left" then
								-- -1
								courseIdx = courseIdx - 1
								if courseIdx < 1 then
									courseIdx = #courses
								end
							end
							MenuState[param.Player].Course = courseIdx
							self:Load( THEME:GetPathB("ScreenDietMenu","overlay/_course "..courses[courseIdx]) )
						end
					end
				end
			};
			-- todo: stars
		};

		Def.Sprite{
			Name="ConfirmButton";
			InitCommand=cmd(x,SCREEN_CENTER_X-212;y,SCREEN_CENTER_Y+134);
			BeginCommand=function(self)
				self:Load(THEME:GetPathB("ScreenDietMenu","overlay/_button ok"))
			end;
			OnCommand=cmd(queuecommand,"GainFocus");
			GainFocusCommand=cmd(linear,0.125;diffuse,color("1,1,1,1");glowshift;effectcolor1,color("1,1,1,0.25");effectcolor2,color("1,1,1,0.5"););
			LoseFocusCommand=cmd(stoptweening;stopeffect;decelerate,0.25;diffuse,color("0.5,0.5,0.5,1"));
			PlayerChangedFocusMessageCommand=function(self,params)
				if params.Player == PLAYER_1 then
					if MenuState[params.Player].CurIndex == 6 then
						self:playcommand("GainFocus");
					else
						self:playcommand("LoseFocus");
					end
				end;
			end;
		};

		-- unjoined "press start"
		LoadActor("_press start")..{
			Name="UnjoinedStart";
			InitCommand=cmd(x,SCREEN_CENTER_X-196;y,SCREEN_CENTER_Y-24;playcommand,"Update");
			OnCommand=cmd(diffuseshift;effectcolor1,color("1,1,1,1");effectcolor2,color("1,1,1,0"));
			UpdateCommand=cmd(visible,not GAMESTATE:IsPlayerEnabled(PLAYER_1));
			PlayerJoinedMessageCommand=function(self,param)
				if param.Player == PLAYER_1 then
					self:playcommand("Update")
				end
			end;
			PlayerUnjoinedMessageCommand=function(self,param)
				if param.Player == PLAYER_1 then
					self:playcommand("Update")
				end
			end;
		};
	};

	Def.ActorFrame{
		Name="ItemsP2";
		-- todo: copy everything after making it for P1

		-- unjoined "press start"
		LoadActor("_press start")..{
			Name="UnjoinedStart";
			InitCommand=cmd(x,SCREEN_CENTER_X+196;y,SCREEN_CENTER_Y-24;playcommand,"Update");
			OnCommand=cmd(diffuseshift;effectcolor1,color("1,1,1,1");effectcolor2,color("0.5,0.5,0.5,1");effectperiod,1.5);
			UpdateCommand=cmd(visible,not GAMESTATE:IsPlayerEnabled(PLAYER_2));
			PlayerJoinedMessageCommand=function(self,param)
				if param.Player == PLAYER_2 then
					self:playcommand("Update")
				end
			end;
			PlayerUnjoinedMessageCommand=function(self,param)
				if param.Player == PLAYER_2 then
					self:playcommand("Update")
				end
			end;
		};
	};

	Def.ActorFrame{
		Name="DateSection";
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y+92);
		PlayerChangedFocusMessageCommand=function(self,params)
			if params.Player == GAMESTATE:GetMasterPlayerNumber() then
				if MenuState[params.Player].CurIndex == 5 then
					self:GetChild("Frame"):playcommand("GainFocus");
					self:GetChild("LeftArrow"):playcommand("GainFocus");
					self:GetChild("RightArrow"):playcommand("GainFocus");
				else
					self:GetChild("Frame"):playcommand("LoseFocus");
					self:GetChild("LeftArrow"):playcommand("LoseFocus");
					self:GetChild("RightArrow"):playcommand("LoseFocus");
				end
			end;
		end;

		LoadActor("_frame date")..{
			Name="Frame";
			OnCommand=cmd(queuecommand,"LoseFocus");
			GainFocusCommand=cmd(linear,0.125;diffuse,color("1,1,1,1");diffuseshift;effectcolor2,color("1,1,1,1");effectcolor1,color("0.75,0.75,0.75,1"));
			LoseFocusCommand=cmd(stoptweening;stopeffect;decelerate,0.25;diffuse,color("0.5,0.5,0.5,1"));
		};
		LoadActor("_arrow unfocus")..{
			Name="LeftArrow";
			InitCommand=cmd(x,-130;y,4;);
			GainFocusCommand=function(self) self:Load(THEME:GetPathB("ScreenDietMenu","overlay/_arrow focus")) end;
			LoseFocusCommand=function(self) self:Load(THEME:GetPathB("ScreenDietMenu","overlay/_arrow unfocus")) end;
		};
		LoadActor("_arrow unfocus")..{
			Name="RightArrow";
			InitCommand=cmd(x,126;y,4;zoomx,-1;);
			GainFocusCommand=function(self) self:Load(THEME:GetPathB("ScreenDietMenu","overlay/_arrow focus")) end;
			LoseFocusCommand=function(self) self:Load(THEME:GetPathB("ScreenDietMenu","overlay/_arrow unfocus")) end;
		};

		-- tepmorary:
		LoadFont("_2070polyester square 24px")..{
			InitCommand=cmd(y,2;zoom,0.55;uppercase,true;settext,"Under Construction";strokecolor,color("#313963"));
		};
	};

	LoadActor("_nonstop play")..{
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y+152;diffuse,color("0.5,0.5,0.5,1"));
		ChangeNonstopStatusMessageCommand=function(self)
			-- swap nonstop mode and color it accordingly
			MenuState.NonstopMode = not MenuState.NonstopMode;
			local newColor;
			if MenuState.NonstopMode then newColor = color("1,1,1,1")
			else newColor = color("0.5,0.5,0.5,1")
			end;
			self:diffuse(newColor)
		end;
	};
	LoadActor(THEME:GetPathG("","_help/_diet select"))..{
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y+176);
	};

	-- helptext
	LoadActor(THEME:GetPathG("","_help/_diet menu"))..{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-34;addy,100;);
		OnCommand=cmd(diffuseblink;effectperiod,1.056;linear,0.25;addy,-100;);
		OffCommand=cmd(linear,0.25;addy,100;);
	};
};

return t;
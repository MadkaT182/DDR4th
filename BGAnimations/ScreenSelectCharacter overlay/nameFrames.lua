local function NoiseFunction(self,player)
	local noiseP1 = self:GetChild("NameFrameP1"):GetChild("BlueNoise")
	if noiseP1 then
		local newX = math.random()
		local newY = math.random()
		noiseP1:customtexturerect(newX-1,newY-1,1+newX,1+newY)
	end

	local noiseP2 = self:GetChild("NameFrameP2"):GetChild("BlueNoise")
	if noiseP2 then
		local newX = math.random()
		local newY = math.random()
		noiseP2:customtexturerect(newX-1,newY-1,1+newX,1+newY)
	end
end

local t = Def.ActorFrame{
	Def.ActorFrame{
		Name="NameFrameP1";
		InitCommand=cmd(x,SCREEN_CENTER_X-278;y,SCREEN_CENTER_Y-76);
		LoadActor("_nameframe p1");
		LoadActor("_namelabel active p1")..{
			InitCommand=cmd(x,-6;y,-29;player,PLAYER_1);
		};
		Def.Quad{
			InitCommand=cmd(x,6;zoomto,12,118;diffuse,color("#00316B");player,PLAYER_1;);
		};
		LoadFont("_arial black 20px")..{
			--settext,charInfo[PLAYER_1].CharID
			InitCommand=cmd(x,2;y,-55;uppercase,true;player,PLAYER_1;zoom,0.65;maxwidth,172;diffuse,PlayerColor(PLAYER_1);strokecolor,color("#005242");rotationz,-90;halign,1;);
			CharacterChangedMessageCommand=function(self,param)
				if param.Player == PLAYER_1 then
					if param.Character then
						self:settext(param.Character:GetDisplayName());
						-- todo: change diffuse if special character
						-- (e.g. Naoki, NMR, 2MB, U1)
					end;
				end
			end;
		};
		Def.Quad{
			InitCommand=cmd(x,97;setsize,166,118;diffuse,color("0,0,0,1"));
		};
		Def.ActorFrame{
			InitCommand=cmd(x,96;fov,60;spin;effectmagnitude,0,120,0);
			LoadActor(THEME:GetPathB("ScreenSelectCharacter","overlay/_icon blank"))..{
				Name="CardFront";
				InitCommand=cmd(clearzbuffer,true;zbuffer,true;z,1;draworder,8;cullmode,'CullMode_Back');
				OffCommand=cmd(decelerate,0.325;zoomy,0);
			};
			LoadActor(THEME:GetPathB("ScreenSelectCharacter","overlay/_small logo"))..{
				Name="CardLogo";
				InitCommand=cmd(zbuffer,true;z,1.1;draworder,8;cullmode,'CullMode_Back');
				OffCommand=cmd(decelerate,0.325;zoomy,0);
			};
			LoadActor(THEME:GetPathB("ScreenSelectCharacter","overlay/_icon add"))..{
				Name="CardCenter1";
				InitCommand=cmd(z,0;zbuffer,true;);
				OffCommand=cmd(decelerate,0.325;zoomy,0);
			};
			LoadActor(THEME:GetPathB("ScreenSelectCharacter","overlay/_icon add"))..{
				Name="CardCenter2";
				InitCommand=cmd(z,0.33;zbuffer,true;);
				OffCommand=cmd(decelerate,0.325;zoomy,0);
			};
			LoadActor(THEME:GetPathB("ScreenSelectCharacter","overlay/_icon add"))..{
				Name="CardCenter3";
				InitCommand=cmd(z,0.66;zbuffer,true;);
				OffCommand=cmd(decelerate,0.325;zoomy,0);
			};
			LoadActor(THEME:GetPathB("ScreenSelectCharacter","overlay/_icon star full"))..{
				Name="CardBack";
				InitCommand=cmd(zbuffer,true;z,0.99;draworder,8;cullmode,'CullMode_Front');
				OffCommand=cmd(decelerate,0.325;zoomy,0);
			};
		};
		LoadActor("_bluenoise")..{
			Name="BlueNoise";
			InitCommand=cmd(x,97;setsize,166,118;visible,not GAMESTATE:IsHumanPlayer(PLAYER_1));
		};
		LoadActor("_endmask p1")..{
			InitCommand=cmd(x,174);
		};
	};
	Def.ActorFrame{
		Name="NameFrameP2";
		InitCommand=cmd(x,SCREEN_CENTER_X+279;y,SCREEN_CENTER_Y-116);
		LoadActor("_nameframe p2");
		LoadActor("_namelabel active p2")..{
			InitCommand=cmd(x,-6;y,-26;player,PLAYER_2);
		};
		Def.Quad{
			InitCommand=cmd(x,6;zoomto,12,118;diffuse,color("#00316B");player,PLAYER_2;);
		};
		-- settext,charInfo[PLAYER_2].CharID
		LoadFont("_arial black 20px")..{
			InitCommand=cmd(x,2;y,-55;uppercase,true;player,PLAYER_2;zoom,0.65;maxwidth,172;diffuse,PlayerColor(PLAYER_2);strokecolor,color("#523100");rotationz,-90;halign,1;);
			CharacterChangedMessageCommand=function(self,param)
				if param.Player == PLAYER_2 then
					if param.Character then
						self:settext(param.Character:GetDisplayName());
					end;
				end
			end;
		};
		Def.Quad{
			InitCommand=cmd(x,-97;setsize,166,118;diffuse,color("0,0,0,1"));
		};
		Def.ActorFrame{
			InitCommand=cmd(x,-96;fov,60;spin;effectmagnitude,0,-120,0);
			LoadActor(THEME:GetPathB("ScreenSelectCharacter","overlay/_icon blank"))..{
				Name="CardFront";
				InitCommand=cmd(clearzbuffer,true;zbuffer,true;z,1;draworder,8;cullmode,'CullMode_Back');
				OffCommand=cmd(decelerate,0.325;zoomy,0);
			};
			LoadActor(THEME:GetPathB("ScreenSelectCharacter","overlay/_small logo"))..{
				Name="CardLogo";
				InitCommand=cmd(zbuffer,true;z,1.1;draworder,8;cullmode,'CullMode_Back');
				OffCommand=cmd(decelerate,0.325;zoomy,0);
			};
			LoadActor(THEME:GetPathB("ScreenSelectCharacter","overlay/_icon add"))..{
				Name="CardCenter1";
				InitCommand=cmd(z,0;zbuffer,true;);
				OffCommand=cmd(decelerate,0.325;zoomy,0);
			};
			LoadActor(THEME:GetPathB("ScreenSelectCharacter","overlay/_icon add"))..{
				Name="CardCenter2";
				InitCommand=cmd(z,0.33;zbuffer,true;);
				OffCommand=cmd(decelerate,0.325;zoomy,0);
			};
			LoadActor(THEME:GetPathB("ScreenSelectCharacter","overlay/_icon add"))..{
				Name="CardCenter3";
				InitCommand=cmd(z,0.66;zbuffer,true;);
				OffCommand=cmd(decelerate,0.325;zoomy,0);
			};
			LoadActor(THEME:GetPathB("ScreenSelectCharacter","overlay/_icon star full"))..{
				Name="CardBack";
				InitCommand=cmd(zbuffer,true;z,0.99;draworder,8;cullmode,'CullMode_Front');
				OffCommand=cmd(decelerate,0.325;zoomy,0);
			};
		};
		LoadActor("_bluenoise")..{
			Name="BlueNoise";
			InitCommand=cmd(x,-97;setsize,166,118;visible,not GAMESTATE:IsHumanPlayer(PLAYER_2));
		};
		LoadActor("_endmask p2")..{
			InitCommand=cmd(x,-174);
		};
	};
};

t.InitCommand = cmd(SetUpdateFunction,NoiseFunction);

return t;
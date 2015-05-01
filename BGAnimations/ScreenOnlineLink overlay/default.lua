-- ScreenOnlineLink overlay

--[[
1) Check if connected.
	1a) if online, then give the option of continuing or disconnecting
	1b) if offline, show a server list + custom server address
--]]

local isOnline = IsNetConnected()

local t = Def.ActorFrame{
	LoadFont("_2070polyester round 24px")..{
		InitCommand=cmd(x,SCREEN_CENTER_X-264;y,SCREEN_CENTER_Y-162;halign,0;zoom,0.625;maxwidth,(24*48)/self:GetZoom());
		BeginCommand=function(self)
			local status = ""
			local mainColor, outlineColor
			if isOnline then
				status = string.format(THEME:GetString("ScreenOnlineLink","Connected to %s"),GetServerName())
				mainColor = color("#22FFCCFF")
				outlineColor = color("#004433FF")
			else
				status = THEME:GetString("ScreenOnlineLink","Not connected to a server")
				mainColor = color("#AAAAAAFF")
				outlineColor = color("#333333FF")
			end
			self:settext(status)
			self:diffuse(mainColor)
			self:strokecolor(outlineColor)
		end
	};
};

if isOnline then
	-- load online
	t[#t+1] = LoadActor("online");
else
	-- load offline
	t[#t+1] = LoadActor("offline");
end

t[#t+1] = LoadActor(THEME:GetPathB("_missing","overlay"));

return t;
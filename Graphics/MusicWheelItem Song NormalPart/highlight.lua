local t = Def.ActorFrame{};


t[#t+1] = Def.ActorFrame{
	LoadActor("yellow top")..{
			InitCommand=cmd(rotationz,-45;addy,-2;zoom,0.7);
			OnCommand=cmd(queuecommand,"Animate");
			AnimateCommand=cmd(cropright,1;fadeleft,0;linear,1.5;cropright,0;fadeleft,1.5;sleep,0;cropright,1;queuecommand,"Animate");
			SetCommand=function(self,param)
		if param.Song then
			if PROFILEMAN:IsSongNew(param.Song) then
				self:visible(true);
			else
				self:visible(false);
			end
		else
			self:visible(false);
		end
	end;
	};
	LoadActor("yellow top")..{
			InitCommand=cmd(rotationz,-45;addy,-2;zoomx,0.7;zoomy,-0.7);
			OnCommand=cmd(queuecommand,"Animate");
			AnimateCommand=cmd(cropleft,1;faderight,0;linear,1.5;cropleft,0;faderight,1.5;sleep,0;cropleft,1;queuecommand,"Animate");
			SetCommand=function(self,param)
		if param.Song then
			if PROFILEMAN:IsSongNew(param.Song) then
				self:visible(true);
			else
				self:visible(false);
			end
		else
			self:visible(false);
		end
	end;
	};
	LoadActor("yellowright")..{
			InitCommand=cmd(rotationz,-45;addy,-2;zoom,0.7);
			OnCommand=cmd(cropbottom,1;sleep,1.5;queuecommand,"Animate");
			AnimateCommand=cmd(cropbottom,1;fadetop,0;linear,1.5;cropbottom,0;fadetop,1;sleep,0;cropbottom,1;queuecommand,"Animate");
			SetCommand=function(self,param)
		if param.Song then
			if PROFILEMAN:IsSongNew(param.Song) then
				self:visible(true);
			else
				self:visible(false);
			end
		else
			self:visible(false);
		end
	end;
	};
	LoadActor("yellowright")..{
			InitCommand=cmd(rotationz,-45;addy,-2;zoomx,-0.7;zoomy,0.7);
			OnCommand=cmd(croptop,1;sleep,1.5;queuecommand,"Animate");
			AnimateCommand=cmd(croptop,1;fadebottom,0;linear,1.5;croptop,0;fadebottom,1;sleep,0;croptop,1;queuecommand,"Animate");
			SetCommand=function(self,param)
		if param.Song then
			if PROFILEMAN:IsSongNew(param.Song) then
				self:visible(true);
			else
				self:visible(false);
			end
		else
			self:visible(false);
		end
	end;
	};
}

return t;
return Def.ActorFrame {
	LoadActor( "albums" )..{
		InitCommand=cmd(FullScreen);
	};

	LoadActor( "music" )..{
		OnCommand=cmd(play);
		OffCommand=cmd(stop);
	};
}
--[[
New TextBanner matching stuff

Normal subtitle
	* subtitle on own line
Already handled in script

B4U glorious style, no limit rm remix
	* subtitle on one line
	* subtitle smaller
Tentative algorithm:
	* if main title length <= 3 and subtitle:GetText() ~= "" then
		* Main title is same
		* Subtitle is smaller and on the same line as main.
--------------------------------------------------------------------------------
DDR 5th Mix Textbanner Reference

Katakana are taken from 2070 polyester.
Hiragana and Kanji are drawn with a different font.
===[No Subtitle]================================================================
17才
/BAMBEE

ABSOLUTE
/dj TAKA

Abyss
/dj TAKA

AFRONOVA PRIMEVAL
/8 bit

BROKEN MY HEART
/NAOKI feat.PAULA TERRY

BE TOGETHER
/NI-NI

DANCING ALL ALONE
/SMiLE.dk

DIVE
/Be For U

Do It Right
/SOTA feat.Ebony Fay

DXY !
/TaQ
(it looks like there's a space there; not sure. -freem)

ECSTACY
/d-complex

Healing Vision
/DE-SIRE

HOT LIMIT
/JOHN DESIRE

I Was The One
/good-cool

INSERTiON
/NAOKI underground

Look To The Sky
/System S.F.feat. ANNA

祭 JAPAN
/RE-VENGE

NEVER ENDING STORY
/DJ-AC-DC

NORI NORI NORI
/JUDY CRYSTAL
(2070polyester square?)

おどるポンポコリン
/CAPTAIN JACK

ON THE JAZZ
/Jonny Dynamite!

PARANOiA ETERNAL
/STM 200

Radical Faith
/TaQ

Remember You
/NM feat.Julie

RIGHT NOW
/ATOMIC KITTEN

ロマンスの神様
/JUDY CRYSTAL

サナ・モレッテ・ネ・エンテ
/Togo Project feat.Sana

STILL IN MY HEART
/NAOKI

SWING IT
/BUS STOP

TEST MY BEST
/E-ROTIC

THE CUBE
/DJ SUWAMI

???????
/本ソフト[????]
(unused, but still neat to have around.)

===[Subtitle on same line]======================================================
B4U <small>glorious style</small>
/NAOKI

DIVE<small, valign,0.5>~more deep&deeper style~</small, valign,0.5>
/Be For U
(2070polyester square?)

DYNAMITE RAVE <small>(Long ver.)</small>
/NAOKI

Healing Vision <small>-Angelic mix-</small>
/2MB

Mr.T.<small>(take me higher)</small>
/Risky Men feat.Asuka M

NO LIMIT <small>(RM Remix)</small>
/2 UNLIMITED

===[Subtitle on separate line]==================================================
AGAINST ALL ODDS
(Definitive MIX)
/DEJAVU featuring TASMIN
(artist and main title line are about same length)

CAN'T STOP FALLIN' IN LOVE
(SPEED MIX)
/NAOKI

The Centre Of The Heart
(STONEBRIDGE CLUBMIX)
/Roxette

Electro Tuned
(the SubS mix)
/TaQ
(Subtitle spans from the E to the n; slightly small text)

MOONLIGHT SHADOW
(New Vocal Version)
/MISSING HEART

MOVIN ON
(Extended Moon Mix)
/ELLEN GEE

MY GENERATION
(Fat Beat Mix)
/CAPTAIN JACK

OOPS!...I DID IT AGAIN
(Fired Up MIX)
/ROCHELLE

TRIBAL DANCE
(Almighty Mix)
/2 UNLIMITED

THE TWIST
(Double Pump MIX)
/LIBERTY ALL STAZ
--]]

local titleMaxWidth = 192;   -- zoom 0.75 = 220 * 1.5
local subtitleMaxWidth = 400;
local artistMaxWidth = 292;

function TextBannerAfterSet(self,param)
	local Title = self:GetChild("Title");
	local Subtitle = self:GetChild("Subtitle");
	local Artist = self:GetChild("Artist");

	local outline = color("0,0,0,0.5")

	-- no subtitle
	if Subtitle:GetText() == "" then
		( cmd( zoomx,0.9;zoomy,1.1;maxwidth,titleMaxWidth*1.1;y,-7;strokecolor,outline ) )(Title);
		( cmd( visible,false ) )(Subtitle);
		( cmd( zoom,0.5;maxwidth,artistMaxWidth;y,12;strokecolor,outline ) )(Artist);
	-- yes subtitle
	else
		( cmd( zoom,0.75;maxwidth,titleMaxWidth*1.3;y,-8;strokecolor,outline ) )(Title);
		( cmd( zoom,0.45;maxwidth,subtitleMaxWidth;y,2;visible,true;strokecolor,outline ) )(Subtitle);
		( cmd( zoom,0.5;maxwidth,artistMaxWidth;y,12;strokecolor,outline ) )(Artist);
	end;

	-- begin hacks

	-- end hacks
end;
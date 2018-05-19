function GetThemeCD(songtit)

--Verify CD from theme
local DiscImg = {
	["Boys"] = "01",
	["Butterfly"] = "02",
	["I Believe In Miracles (The Lisa Marie Experience Radio Edit)"] = "03",
	["Little Bitch"] = "04",
	["MAKE IT BETTER"] = "05",
	["PARANOiA"] = "06",
	["PARANOiA MAX～DIRTY MIX～"] = "07",
	["PARANOiA MAX~DIRTY MIX~ (in roulette)"] = "07",
	["PUT YOUR FAITH IN ME"] = "08",
	["AM-3P"] = "09",
	["stomp to my beat"] = "10",
	["TRIP MACHINE"] = "11",
	["EL RITMO TROPICAL"] = "12",
	["BRILLIANT 2U"] = "13",
	["BAD GIRLS"] = "14",
	["Boom Boom Dollar (Red Monster Mix)"] = "15",
	["DUB-I-DUB"] = "16",
	["SP-TRIP MACHINE~JUNGLE MIX~"] = "17",
	["Have You Never Been Mellow"] = "18",
	["KUNG FU FIGHTING"] = "19",
	["My Fire (UKS Remix)"] = "20",
	["LET'S GET DOWN"] = "21",
	["That's The Way (I Like It)"] = "22",
	["STRICTLY BUSINESS"] = "23",
	["PUT YOUR FAITH IN ME (Jazzy Groove)"] = "24",
	["BRILLIANT 2U(Orchestra Groove)"] = "25",
	["MAKE IT BETTER (So-REAL Mix)"] = "26",
	["HERO"] = "27",
	["GET UP'N MOVE"] = "28",
	["IF YOU WERE HERE"] = "29",
	["Smoke"] = "30",
	["TUBTHUMPING"] = "31",
	["LOVE"] = "32",
	["KEEP ON MOVIN'"] = "33",
	["LET THEM MOVE"] = "34",
	["20,NOVEMBER (D.D.R. version)"] = "35",
	["MAKE A JAM!"] = "36",
	["PARANOiA KCET ～clean mix～"] = "37",
	["XANADU"] = "38",
	["THE RACE"] = "39",
	["IN THE NAVY '99 (XXL Disaster Remix)"] = "40",
	["CAN'T TAKE MY EYES OFF YOU"] = "41",
	["CAN'T TAKE MY EYES OFF YOU (70's REMIX)"] = "41",
	["DO IT ALL NIGHT"] = "42",
	["FLASHDANCE (WHAT A FEELING)"] = "43",
	["GET UP AND DANCE"] = "44",
	["GET UP (BEFORE THE NIGHT IS OVER)"] = "45",
	["HOLIDAY"] = "46",
	["IF YOU CAN SAY GOODBYE"] = "47",
	["IT ONLY TAKES A MINUTE (Extended Remix)"] = "48",
	["MR. WONDERFUL"] = "49",
	["OH NICK PLEASE NOT SO QUICK"] = "50",
	["OPERATOR"] = "51",
	["ROCK BEAT"] = "52",
	["SO MANY MEN"] = "53",
	["TURN ME ON (HEAVENLY MIX)"] = "54",
	["UPSIDE DOWN"] = "55",
	["VOL.4"] = "56",
	["WONDERLAND (UKS MIX)"] = "57",
	["butterfly (UPSWING MIX)"] = "58",
	["CAPTAIN JACK (GRANDALE REMIX)"] = "59",
	["BOOM BOOM DOLLAR (K.O.G. G3 MIX)"] = "60",
	["AFRONOVA"] = "61",
	["END OF THE CENTURY"] = "62",
	["DAM DARIRAM"] = "63",
	["DYNAMITE RAVE"] = "64",
	["Silent Hill"] = "65",
	["DEAD END"] = "66",
	["La Señorita"] = "67",
	["LUV TO ME (AMD MIX)"] = "68",
	["Jam Jam Reggae"] = "69",
	["gentle stress (AMD SEXUAL MIX)"] = "70",
	["GRADIUSIC CYBER ～AMD G5 MIX～"] = "71",
	["PARANOiA Rebirth"] = "72",
	["FOLLOW THE SUN (90 IN THE SHADE MIX)"] = "73",
	--Konami missing fallback
	["XsorryX"] = "74",
	--PSX Bonus
	["BUMBLE BEE"] = "75",
	["GIMME GIMME GIMME"] = "76",
	--3rd Mix PLUS
	["AFTER THE GAME OF LOVE"] = "77",
	["CUTIE CHASER"] = "78",
	["DROP THE BOMB"] = "79",
	["LOVE THIS FEELIN'"] = "80",
	["La Senorita Virtual"] = "81",
	["La Señorita Virtual"] = "81",
	["think ya better D"] = "82"
}

local DiscNumber = DiscImg[songtit] or "fallback"

return DiscNumber;

end;

function GetCase(grouptit)
local caseimg = "fallback";

if grouptit == "DDR 2nd MIX" then
caseimg = "02";
end

return caseimg;

end;
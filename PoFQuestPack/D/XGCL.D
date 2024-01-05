BEGIN ~XGCL~

// UNUSED


// In the tracks of an unknown evil.

// XGSABAT, 


IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0 // from:
  SAY #74616 /* ~S èím ti mohu posloužit?~ */
  IF ~~ THEN REPLY #74617 /* ~Ano jsem, mùžeš mi sdìlit víc...~ */ GOTO 1
END

IF ~~ THEN BEGIN 1 // from: 0.0
  SAY #74618 /* ~Na to teï není èas.. Dostaò se dovnitø a zabij Sabata, on je ten kdo stojí za tìmi útoky.. Je z jiného øádu, z øádu Krvavých kopí, jsou to vrazi, uèí se jak zabíjet, né jak léèit!~ */
  IF ~~ THEN REPLY #74619 /* ~Dík za informace, už tam jdu..Vypadni odsuï okamžitì!~ */ DO ~EscapeArea()~ UNSOLVED_JOURNAL #74620 /* ~Po stopách neznámého zla.

Venku pøed Trhovskou jeskyní, úkrytem Vintrellova øádu, jsem potkal knìze..Trocu mi pøiblížil situaci, na øád utoèí Sabat, zlý knìz..
Musím ho zabít a? tohle všechno skonèí..~ */ EXIT
END

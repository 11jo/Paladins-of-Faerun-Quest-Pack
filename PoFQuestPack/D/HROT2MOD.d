BEGIN ~XGhrot2~

IF ~Global("s#XGhrot2","GLOBAL",0)~ THEN BEGIN 0
  SAY @0
  IF ~~ THEN REPLY @1 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @2
  IF ~~ THEN REPLY @3 GOTO 2
END

IF ~~ THEN BEGIN 2
  SAY @4
  IF ~~ THEN REPLY @5 GOTO 3
END

IF ~~ THEN BEGIN 3
  SAY @6
  IF ~~ THEN REPLY @7 DO ~SetGlobal("s#XGhrot2","GLOBAL",1)~ EXIT
  IF ~~ THEN REPLY @8 GOTO 4
END

IF ~~ THEN BEGIN 4
  SAY @9
  IF ~~ THEN REPLY @10 DO ~SetGlobal("s#XGhrot2","GLOBAL",2)
GiveItemCreate("XGesh",Player1,0,0,0)
EscapeArea()~ 
UNSOLVED_JOURNAL @11 EXIT
END

IF ~Global("s#XGhrot2","GLOBAL",1)~ THEN BEGIN 5
  SAY @12
  IF ~~ THEN REPLY @13 GOTO 4
  IF ~~ THEN REPLY @14  EXIT
END
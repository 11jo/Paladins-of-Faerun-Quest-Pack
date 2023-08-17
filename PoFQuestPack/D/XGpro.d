BEGIN ~XGpro~

IF ~Global("s#XGpro","GLOBAL",0)~ THEN BEGIN 0
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
  IF ~~ THEN DO ~RevealAreaOnMap("XG0077")
SetGlobal("s#XGpro","GLOBAL",1)~ EXIT
END

IF ~!Dead("XGfl")
Global("s#XGpro","GLOBAL",1)~ THEN BEGIN 4
  SAY @7
  IF ~~ THEN EXIT
END

IF ~Dead("XGfl")
Global("s#XGpro","GLOBAL",1)~ THEN BEGIN 5
  SAY @8
  IF ~~ THEN REPLY @9 GOTO 6
END

IF ~~ THEN BEGIN 6
  SAY @10
  IF ~~ THEN DO ~GiveGoldForce(3000)
SetGlobal("s#XGpro","GLOBAL",2)~ EXIT
END

IF ~Global("s#XGpro","GLOBAL",2)~ THEN BEGIN 7
  SAY @11
  IF ~~ THEN EXIT
END













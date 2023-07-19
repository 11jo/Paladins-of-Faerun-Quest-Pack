BEGIN ~s#inn02~ 

IF ~True()~ THEN BEGIN 0
  SAY @0
  IF ~~ THEN GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @1
  IF ~~ THEN REPLY @2 DO ~StartStore("s#inn01",LastTalkedToBy())~ EXIT
  IF ~~ THEN REPLY @3 GOTO 2
END

IF ~~ THEN BEGIN 2
  SAY @4
  IF ~~ THEN EXIT
END

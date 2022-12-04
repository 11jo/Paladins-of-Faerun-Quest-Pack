BEGIN ~XGku~

IF ~See(PlayER1)
NumTimesTalkedTo(0)~ THEN BEGIN 0
  SAY @0
  IF ~~ THEN REPLY @1 DO ~SetNumTimesTalkedTo(0)~ EXIT
  IF ~~ THEN REPLY @2 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @3
  IF ~~ THEN REPLY @4 GOTO 3
  IF ~~ THEN REPLY @5 DO ~SetNumTimesTalkedTo(0)~ EXIT
  IF ~~ THEN REPLY @6 GOTO 2
END

IF ~~ THEN BEGIN 2
  SAY @7
  IF ~~ THEN REPLY @8 DO ~GiveItemCreate("XGku",Player1,0,0,0)
EscapeArea()~ 
UNSOLVED_JOURNAL @9 EXIT
END

IF ~~ THEN BEGIN 3
  SAY @10
  IF ~~ THEN DO ~EscapeArea()~ EXIT
END

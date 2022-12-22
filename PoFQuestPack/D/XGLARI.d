BEGIN ~XGLARI~

IF ~NumTimesTalkedTo(0) See(Player1)~ THEN BEGIN 0
  SAY @0
  IF ~~ THEN REPLY @1 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @2
  IF ~~ THEN REPLY @3  DO ~SetNumTimesTalkedTo(1)~ EXIT
END

IF ~!Dead("XGARDES")
NumTimesTalkedTo(1)~ THEN BEGIN 3
  SAY @4
  IF ~~ THEN EXIT
END


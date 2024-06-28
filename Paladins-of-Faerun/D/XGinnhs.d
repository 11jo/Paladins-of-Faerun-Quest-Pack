BEGIN ~XGinnhs~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
  SAY @0
  IF ~~ THEN REPLY @1 DO ~StartStore("PPINN01",LastTalkedToBy())
SetNumTimesTalkedTo(0)~ EXIT
  IF ~~ THEN REPLY @2 DO ~SetNumTimesTalkedTo(0)~ EXIT
END

//PPINN01 existing store in original game

BEGIN ~XGBGG~

IF ~NumTimesTalkedTo(0)
See(Player1)~ THEN BEGIN 0
  SAY @1
  IF ~~ THEN REPLY @2 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @3
  IF ~~ THEN REPLY @4 GOTO 2
END

IF ~~ THEN BEGIN 2
  SAY @5
  IF ~~ THEN DO ~EscapeArea()
AddexperienceParty(1000)
~ EXIT
END

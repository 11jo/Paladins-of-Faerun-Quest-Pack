BEGIN ~GFALCON1~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
  SAY @0
  IF ~~ THEN REPLY @1 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @2
  IF ~~ THEN REPLY @3 GOTO 2
END

IF ~~ THEN BEGIN 2
  SAY @4
  IF ~~ THEN REPLY @5 DO ~AddExperienceParty(10000)
RevealAreaOnMap("PF0055")
EscapeArea()~ UNSOLVED_JOURNAL @6 EXIT
END

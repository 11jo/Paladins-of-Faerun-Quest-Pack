BEGIN ~XGARJUN~

IF ~  See(Player1)
NumberOfTimesTalkedTo(0)
~ THEN BEGIN 0
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
  IF ~~ THEN REPLY @7 DO ~ReputationInc(-1)
GiveItemCreate("SWORD20",Player1,0,0,0)
~ EXIT
  IF ~~ THEN REPLY @8 DO ~Enemy()
~ EXIT
END

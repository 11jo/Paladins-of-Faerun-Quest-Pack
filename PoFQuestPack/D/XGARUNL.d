BEGIN ~XGARUNL~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
  SAY @1
  IF ~~ THEN REPLY @2 GOTO 1
  IF ~~ THEN REPLY @3 GOTO 16
END

IF ~~ THEN BEGIN 1
  SAY @4
  IF ~~ THEN REPLY @5 GOTO 2
END

IF ~~ THEN BEGIN 2
  SAY @6
  IF ~~ THEN GOTO 3
END

IF ~~ THEN BEGIN 3
  SAY @7
  IF ~~ THEN REPLY @8 GOTO 4
END

IF ~~ THEN BEGIN 4
  SAY @9
  IF ~~ THEN REPLY @10 GOTO 5
END

IF ~~ THEN BEGIN 5
  SAY @11
  IF ~~ THEN REPLY @12 GOTO 6
END

IF ~~ THEN BEGIN 6
  SAY @13
  IF ~~ THEN REPLY @15 DO ~RevealAreaOnMap("XG0007")
SetNumTimesTalkedTo(2)
~ UNSOLVED_JOURNAL @14 EXIT
END

IF ~NumTimesTalkedTo(1)~ THEN BEGIN 7
  SAY @16
  IF ~~ THEN REPLY @2 GOTO 12
END

IF ~PArtyHasItem("XGWH")
Dead("XGWTCH1")~ THEN BEGIN 8
  SAY @17
  IF ~~ THEN REPLY @18 GOTO 9
END

IF ~~ THEN BEGIN 9
  SAY @19
  IF ~~ THEN GOTO 10
END

IF ~~ THEN BEGIN 10
  SAY @20
  IF ~~ THEN REPLY @21 GOTO 11
END

IF ~~ THEN BEGIN 11
  SAY @22
  IF ~~ THEN REPLY @24 DO ~TakePartyItem("XGWH")
~ UNSOLVED_JOURNAL @23 GOTO 20
END

IF ~~ THEN BEGIN 12
  SAY @4
  IF ~~ THEN REPLY @5 GOTO 13
END

IF ~~ THEN BEGIN 13
  SAY @6
  IF ~~ THEN GOTO 14
END

IF ~~ THEN BEGIN 14
  SAY @7
  IF ~~ THEN REPLY @8 GOTO 15
END

IF ~~ THEN BEGIN 15
  SAY @9
  IF ~~ THEN REPLY @10 GOTO 17
END

IF ~~ THEN BEGIN 16
  SAY @25
  IF ~~ THEN DO ~SetNumTimesTalkedTo(1)
~ EXIT
END

IF ~~ THEN BEGIN 17
  SAY @11
  IF ~~ THEN REPLY @12 GOTO 18
END

IF ~~ THEN BEGIN 18
  SAY @13
  IF ~~ THEN REPLY @15 DO ~RevealAreaOnMap("XG0007")
SetNumTimesTalkedTo(2)
~ UNSOLVED_JOURNAL @14 EXIT
END

IF ~NumTimesTalkedTo(2)
!PArtyHasItem("XGWH")~ THEN BEGIN 19
  SAY @26
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 20
  SAY @27
  IF ~~ THEN DO ~RevealAreaOnMap("XG0056")
EscapeArea()
~ EXIT
END

BEGIN ~XGWW~ 2

IF ~RandomNum(4,1)
!InPartySlot(LastTalkedToBy,0)~ THEN BEGIN 0
  SAY @1
  IF ~~ THEN EXIT
END

IF ~RandomNum(4,2)
!InPartySlot(LastTalkedToBy,0)~ THEN BEGIN 1
  SAY @2
  IF ~~ THEN EXIT
END

IF ~RandomNum(4,3)
!InPartySlot(LastTalkedToBy,0)~ THEN BEGIN 2
  SAY @3
  IF ~~ THEN EXIT
END

IF ~RandomNum(4,4)
!InPartySlot(LastTalkedToBy,0)~ THEN BEGIN 3
  SAY @4
  IF ~~ THEN EXIT
END

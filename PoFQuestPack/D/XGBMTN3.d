BEGIN ~XGBMTN3~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
  SAY @0
  IF ~~ THEN REPLY @1 GOTO 2
  IF ~~ THEN REPLY @2 GOTO 1
  IF ~~ THEN REPLY @3 DO ~Enemy()
ActionOverride("XGBMTN3",Attack(Player1))
Wait(1)
Kill(Player1)~ EXIT
END

IF ~~ THEN BEGIN 1
  SAY @4
  IF ~!NumTimesTalkedTo(0)~ THEN REPLY @5 DO ~SetNumTimesTalkeDTo(0)~ EXIT
  IF ~~ THEN REPLY @3 DO ~Enemy()
ActionOverride("XGBMTN3",Attack(Player1))
Wait(1)
Kill(Player1)~ EXIT
END

IF ~~ THEN BEGIN 2
  SAY @6
  IF ~~ THEN REPLY @7 DO ~Enemy()
ActionOverride("XGBMTN3",Attack(Player1))
Wait(1)
Kill(Player1)~ EXIT
  IF ~~ THEN REPLY @8 DO ~Enemy()
ActionOverride("XGBMTN3",Attack(Player1))
Wait(1)
Kill(Player1)~ EXIT
  IF ~~ THEN REPLY @9 DO ~Enemy()
ActionOverride("XGBMTN3",Attack(Player1))
Wait(1)
Kill(Player1)~ EXIT
  IF ~~ THEN REPLY @10 DO ~Enemy()
ActionOverride("XGBMTN3",Attack(Player1))
Wait(1)
Kill(Player1)~ EXIT
  IF ~~ THEN REPLY @11 DO ~Enemy()
ActionOverride("XGBMTN3",Attack(Player1))
Wait(1)
Kill(Player1)~ EXIT
  IF ~~ THEN REPLY @12 DO ~Enemy()
ActionOverride("XGBMTN3",Attack(Player1))
Wait(1)
Kill(Player1)~ EXIT
  IF ~~ THEN REPLY @13 DO ~Enemy()
ActionOverride("XGBMTN3",Attack(Player1))
Wait(1)
Kill(Player1)~ EXIT
  IF ~~ THEN REPLY @14 DO ~Enemy()
ActionOverride("XGBMTN3",Attack(Player1))
Wait(1)
Kill(Player1)~ EXIT
  IF ~~ THEN REPLY @15 GOTO 3
  IF ~~ THEN REPLY @16 DO ~Enemy()
ActionOverride("XGBMTN3",Attack(Player1))
Wait(1)
Kill(Player1)~ EXIT
END

IF ~~ THEN BEGIN 3
  SAY @17
  IF ~~ THEN REPLY @18 GOTO 4
  IF ~~ THEN REPLY @19 DO ~Enemy()
ActionOverride("XGBMTN3",Attack(Player1))
Wait(1)
Kill(Player1)~ EXIT
  IF ~~ THEN REPLY @20 DO ~Enemy()
ActionOverride("XGBMTN3",Attack(Player1))
Wait(1)
Kill(Player1)~ EXIT
  IF ~~ THEN REPLY @21 DO ~Enemy()
ActionOverride("XGBMTN3",Attack(Player1))
Wait(1)
Kill(Player1)~ EXIT
  IF ~~ THEN REPLY @22 DO ~Enemy()
ActionOverride("XGBMTN3",Attack(Player1))
Wait(1)
Kill(Player1)~ EXIT
  IF ~~ THEN REPLY @23 DO ~Enemy()
ActionOverride("XGBMTN3",Attack(Player1))
Wait(1)
Kill(Player1)~ EXIT
END

IF ~~ THEN BEGIN 4
  SAY @24
  IF ~~ THEN REPLY @25 DO ~Enemy()
ActionOverride("XGBMTN3",Attack(Player1))
Wait(1)
Kill(Player1)~ EXIT
  IF ~~ THEN REPLY @26 DO ~Enemy()
ActionOverride("XGBMTN3",Attack(Player1))
Wait(1)
Kill(Player1)~ EXIT
  IF ~~ THEN REPLY @27 DO ~Enemy()
ActionOverride("XGBMTN3",Attack(Player1))
Wait(1)
Kill(Player1)~ EXIT
  IF ~~ THEN REPLY @28 GOTO 5
  IF ~~ THEN REPLY @29 DO ~Enemy()
ActionOverride("XGBMTN3",Attack(Player1))
Wait(1)
Kill(Player1)~ EXIT
  IF ~~ THEN REPLY @30 DO ~Enemy()
ActionOverride("XGBMTN3",Attack(Player1))
Wait(1)
Kill(Player1)~ EXIT
END

IF ~~ THEN BEGIN 5
  SAY @31
  IF ~~ THEN DO ~ActionOverride(Player2,LeaveAreaLUA("XGUMOD","",[1171.1783],14))
ActionOverride(Player1,LeaveAreaLUA("XGUMOD","",[1200.1756],14))
ActionOverride(Player3,LeaveAreaLUA("XGUMOD","",[1199.1716],14))
ActionOverride(Player4,LeaveAreaLUA("XGUMOD","",[1148.1723],14))
ActionOverride(Player5,LeaveAreaLUA("XGUMOD","",[1217.1763],14))
ActionOverride(Player6,LeaveAreaLUA("XGUMOD","",[1097.1792],14))~ EXIT
END

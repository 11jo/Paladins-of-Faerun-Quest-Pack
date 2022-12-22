BEGIN ~XGFKIN2~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
  SAY @1
  IF ~~ THEN REPLY @2 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @3
  IF ~~ THEN REPLY @4 GOTO 2
END

IF ~~ THEN BEGIN 2
  SAY @5
  IF ~~ THEN REPLY @6 GOTO 3
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
  IF ~~ THEN GOTO 6
END

IF ~~ THEN BEGIN 6
  SAY @12
  IF ~~ THEN REPLY @13 GOTO 7
END

IF ~~ THEN BEGIN 7
  SAY @14
  IF ~~ THEN REPLY @15 GOTO 8
END

IF ~~ THEN BEGIN 8
  SAY @16
  IF ~~ THEN REPLY @17 GOTO 9
  IF ~~ THEN REPLY @18 DO ~SetNumTimesTalkedTo(1)
~ EXIT
END

IF ~~ THEN BEGIN 9
  SAY @19
  IF ~~ THEN DO ~ActionOverride(Player2,LeaveAreaLUA("PF0002","",[3604.2868],6))
ActionOverride(Player1,LeaveAreaLUA("PF0002","",[3514.2882],6))
ActionOverride(Player3,LeaveAreaLUA("PF0002","",[3428.2985],6))
ActionOverride(Player4,LeaveAreaLUA("PF0002","",[3528.3005],6))
ActionOverride(Player5,LeaveAreaLUA("PF0002","",[3592.2984],6))
ActionOverride(Player6,LeaveAreaLUA("PF0002","",[3629.2929],6))
~ UNSOLVED_JOURNAL @20 EXIT
END

IF ~NumTimesTalkedTo(1)~ THEN BEGIN 10
  SAY @21
  IF ~~ THEN REPLY @22 DO ~ActionOverride(Player2,LeaveAreaLUA("PF0002","",[3604.2868],6))
ActionOverride(Player1,LeaveAreaLUA("PF0002","",[3514.2882],6))
ActionOverride(Player3,LeaveAreaLUA("PF0002","",[3428.2985],6))
ActionOverride(Player4,LeaveAreaLUA("PF0002","",[3528.3005],6))
ActionOverride(Player5,LeaveAreaLUA("PF0002","",[3592.2984],6))
ActionOverride(Player6,LeaveAreaLUA("PF0002","",[3629.2929],6))
~ UNSOLVED_JOURNAL @20 EXIT
  IF ~~ THEN REPLY @23 EXIT
END

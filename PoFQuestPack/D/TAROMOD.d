BEGIN ~XGTARO~

IF ~  NumberOfTimesTalkedTo(0)
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
  IF ~~ THEN REPLY @7 GOTO 4
  IF ~~ THEN REPLY @8 DO ~SetNumTimesTalkedTo(1)
~ EXIT
END

IF ~~ THEN BEGIN 4
  SAY @9
  IF ~~ THEN REPLY @10 UNSOLVED_JOURNAL @11 GOTO 6
END

IF ~  NumberOfTimesTalkedTo(1)
~ THEN BEGIN 5
  SAY @12
  IF ~~ THEN REPLY @13 DO ~SetNumTimesTalkedTo(1)
~ EXIT
  IF ~~ THEN REPLY @7 GOTO 4
END

IF ~~ THEN BEGIN 6
  SAY @14
  IF ~~ THEN DO ~ActionOverride(Player2,LeaveAreaLUA("PF0045","",[3158.2663],0))
ActionOverride(Player1,LeaveAreaLUA("PF0045","",[3212.2670],0))
ActionOverride(Player3,LeaveAreaLUA("PF0045","",[3283.2680],0))
ActionOverride(Player4,LeaveAreaLUA("PF0045","",[3293.2634],0))
ActionOverride(Player5,LeaveAreaLUA("PF0045","",[3235.2641],0))
ActionOverride(Player6,LeaveAreaLUA("PF0045","",[3169.2640],0))
DestroySelf()~ EXIT
END

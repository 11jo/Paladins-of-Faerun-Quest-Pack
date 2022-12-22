BEGIN ~XGmyhs~

IF ~True()~ THEN BEGIN 0
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
END

IF ~~ THEN BEGIN 4
  SAY @8
  IF ~~ THEN REPLY @9 GOTO 5
END

IF ~~ THEN BEGIN 5
  SAY @10
  IF ~~ THEN REPLY @11 GOTO 6
END

IF ~~ THEN BEGIN 6
  SAY @12
  IF ~~ THEN DO ~ActionOverride(Player2,LeaveAreaLUA("PF0081","",[1424.1150],0))
ActionOverride(Player1,LeaveAreaLUA("PF0081","",[1498.1121],0))
ActionOverride(Player3,LeaveAreaLUA("PF0081","",[1458.1082],0))
ActionOverride(Player4,LeaveAreaLUA("PF0081","",[1412.1097],0))
ActionOverride(Player5,LeaveAreaLUA("PF0081","",[1452.1067],0))
ActionOverride(Player6,LeaveAreaLUA("PF0081","",[1430.1009],0))
AddExperienceParty(5000)~ UNSOLVED_JOURNAL @13 EXIT
END

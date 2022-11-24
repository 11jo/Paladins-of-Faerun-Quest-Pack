BEGIN ~SORMOD2~

IF ~True()~ THEN BEGIN 0
  SAY @0
  IF ~~ THEN REPLY @1 DO ~ActionOverride(Player1,LeaveAreaLUA("AR0900","",[4360.1060],0))
ActionOverride(Player2,LeaveAreaLUA("AR0900","",[4460.1040],0))
ActionOverride(Player3,LeaveAreaLUA("AR0900","",[4430.990],0))
ActionOverride(Player4,LeaveAreaLUA("AR0900","",[4500.990],0))
ActionOverride(Player5,LeaveAreaLUA("AR0900","",[4480.950],0))
ActionOverride(Player6,LeaveAreaLUA("AR0900","",[4550.950],0))
~ EXIT
  IF ~~ THEN REPLY @2 EXIT
END

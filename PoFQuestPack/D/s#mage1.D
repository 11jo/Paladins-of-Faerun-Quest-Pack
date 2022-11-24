BEGIN ~s#mage1~

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
  IF ~~ THEN DO ~ActionOverride(Player1,LeaveAreaLUA("PF0162","",[1298.1045],10))
ActionOverride(Player2,LeaveAreaLUA("PF0162","",[1155.1075],0))
ActionOverride(Player3,LeaveAreaLUA("PF0162","",[1250.1080],0))
ActionOverride(Player4,LeaveAreaLUA("PF0162","",[1100.1100],0))
ActionOverride(Player5,LeaveAreaLUA("PF0162","",[1200.1120],0))
ActionOverride(Player6,LeaveAreaLUA("PF0162","",[1090.1160],0))
DestroySelf()~ EXIT
END

















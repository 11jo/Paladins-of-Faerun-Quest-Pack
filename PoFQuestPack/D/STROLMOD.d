BEGIN ~XGSTROL~

IF ~True()
Global("s#XGSTROL","GLOBAL",0)~ THEN BEGIN 0
  SAY @0
  IF ~~ THEN REPLY @1 DO ~SetGlobal("s#XGSTROL","GLOBAL",1)
    ActionOverride(Player2,LeaveAreaLUA("PF0168","",[669.314],8))
    ActionOverride(Player1,LeaveAreaLUA("PF0168","",[801.389],8))
    ActionOverride(Player3,LeaveAreaLUA("PF0168","",[621.376],8))
    ActionOverride(Player4,LeaveAreaLUA("PF0168","",[604.295],8))
    ActionOverride(Player5,LeaveAreaLUA("PF0168","",[691.469],8))
    ActionOverride(Player6,LeaveAreaLUA("PF0168","",[906.557],8))
~ EXIT
  IF ~~ THEN REPLY @2 EXIT
END
  
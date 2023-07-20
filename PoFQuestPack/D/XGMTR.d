BEGIN ~XGMTR~

IF ~See(Player1) Global("s#XGMTR","GLOBAL",0)~ THEN BEGIN 0
  SAY @0
  IF ~~ THEN REPLY @1 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @2
  IF ~~ THEN REPLY @3 GOTO 2
  IF ~~ THEN REPLY @4 DO ~SetGlobal("s#XGMTR","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN 2
  SAY @5
  IF ~~ THEN REPLY @6 DO ~SetGlobal("s#XGMTR","GLOBAL",2)~ EXIT
  IF ~~ THEN REPLY @7 GOTO 5
END

IF ~ Global("s#XGMTR","GLOBAL",1)~ THEN BEGIN 3
  SAY @8
  IF ~~ THEN REPLY @9 GOTO 2
  IF ~~ THEN REPLY @4 EXIT
END

IF ~ Global("s#XGMTR","GLOBAL",2)~ THEN BEGIN 4
  SAY @10
  IF ~~ THEN REPLY @9 GOTO 2
  IF ~~ THEN REPLY @6 EXIT
END

IF ~~ THEN BEGIN 5
  SAY @11
  IF ~~ THEN REPLY @12 DO ~EscapeArea()
RevealAreaOnMap("XG0071")
ActionOverride(Player2,LeaveAreaLUA("XG0071","",[451.953],0))
ActionOverride(Player1,LeaveAreaLUA("XG0071","",[492.929],0))
ActionOverride(Player3,LeaveAreaLUA("XG0071","",[414.916],0))
ActionOverride(Player4,LeaveAreaLUA("XG0071","",[448.877],0))
ActionOverride(Player5,LeaveAreaLUA("XG0071","",[499.867],0))
ActionOverride(Player6,LeaveAreaLUA("XG0071","",[505.916],0))
~ UNSOLVED_JOURNAL @13 EXIT
END

BEGIN ~XGMYES~

IF ~Global("s#XGMYES","GLOBAL",0)~ THEN BEGIN 0
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
  IF ~~ THEN DO ~SetGlobal("s#XGMYES","GLOBAL",1)
ActionOverride(Player2,LeaveAreaLUA("XG0029","",[1348.533],0))
ActionOverride(Player1,LeaveAreaLUA("XG0029","",[1396.542],0))
ActionOverride(Player3,LeaveAreaLUA("XG0029","",[1460.557],0))
ActionOverride(Player4,LeaveAreaLUA("XG0029","",[1453.626],0))
ActionOverride(Player5,LeaveAreaLUA("XG0029","",[1408.619],0))
ActionOverride(Player6,LeaveAreaLUA("XG0029","",[1354.606],0))~ EXIT
END

IF ~Global("s#XGMYES","GLOBAL",1)
OR(2) !Dead("XGESDL")  !Dead("XGSAR")~ THEN BEGIN 6
  SAY @11
  IF ~~ THEN EXIT
END

IF ~Global("s#XGMYES","GLOBAL",1)
OR(2) Dead("XGESDL")  Dead("XGSAR")~ THEN BEGIN 7
  SAY @12
  IF ~~ THEN REPLY @13 GOTO 8
END

IF ~~ THEN BEGIN 8
  SAY @14
  IF ~~ THEN REPLY @15 GOTO 9
END

IF ~~ THEN BEGIN 9
  SAY @16
  IF ~~ THEN REPLY @17 DO ~AddexperienceParty(5000)~ GOTO 10
END

IF ~~ THEN BEGIN 10
  SAY @18
  IF ~~ THEN REPLY @19 DO ~SetGlobal("s#XGMYES","GLOBAL",2)
RevealAreaOnMap("XG0065")~ 
UNSOLVED_JOURNAL @20 EXIT
END

IF ~Global("s#XGMYES","GLOBAL",2)~ THEN BEGIN 11
  SAY @21
  IF ~~ THEN EXIT
END

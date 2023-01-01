BEGIN ~XGKMAN~

IF ~Numtimestalkedto(0)~ THEN BEGIN 0
  SAY @1
  IF ~~ THEN REPLY @2 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @3
  IF ~~ THEN REPLY @4 DO ~ActionOverride(Player2,LeaveAreaLUA("XG0039","",[200.1250],0))
ActionOverride(Player1,LeaveAreaLUA("XG0039","",[230.1250],0))
ActionOverride(Player3,LeaveAreaLUA("XG0039","",[260.1250],0))
ActionOverride(Player4,LeaveAreaLUA("XG0039","",[200.1280],0))
ActionOverride(Player5,LeaveAreaLUA("XG0039","",[200.1310],0))
ActionOverride(Player6,LeaveAreaLUA("XG0039","",[230.1280],0))
~ EXIT
END

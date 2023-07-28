BEGIN ~XGMOHD~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
  SAY @1
  IF ~~ THEN REPLY @2 DO ~ActionOverride("XGMOHD",EscapeArea())
ActionOverride(Player2,LeaveAreaLUA("XG1234","",[1169.1019],2))
ActionOverride(Player1,LeaveAreaLUA("XG1234","",[1104.986],2))
ActionOverride(Player3,LeaveAreaLUA("XG1234","",[1059.956],2))
ActionOverride(Player4,LeaveAreaLUA("XG1234","",[1017.930],2))
ActionOverride(Player5,LeaveAreaLUA("XG1234","",[1014.895],2))
ActionOverride(Player6,LeaveAreaLUA("XG1234","",[1211.1006],2))
~ EXIT
END

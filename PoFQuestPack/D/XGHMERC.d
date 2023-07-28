BEGIN ~XGHMERC~

IF ~NumTimesTalkedTo(0)
See(Player1)~ THEN BEGIN 0
  SAY @0
  IF ~~ THEN REPLY @1 DO ~EscapeArea()
ActionOverride(Player2,LeaveAreaLUA("XG0803","",[150.143],0))
ActionOverride(Player1,LeaveAreaLUA("XG0803","",[457.239],0))
ActionOverride(Player3,LeaveAreaLUA("XG0803","",[138.183],0))
ActionOverride(Player4,LeaveAreaLUA("XG0803","",[117.240],0))
ActionOverride(Player5,LeaveAreaLUA("XG0803","",[259.156],0))
ActionOverride(Player6,LeaveAreaLUA("XG0803","",[244.205],0))~ EXIT
END

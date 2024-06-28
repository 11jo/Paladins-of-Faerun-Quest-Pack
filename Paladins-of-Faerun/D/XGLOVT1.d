BEGIN ~XGLOVT1~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
  SAY @0
  IF ~~ THEN REPLY @1 DO ~SetNumTimesTalkedTo(0)~ EXIT
  IF ~~ THEN REPLY @2 DO ~SetNumTimesTalkedTo(0)
ActionOverride(Player2,LeaveAreaLUA("XG0069","",[5011.2592],0))
ActionOverride(Player1,LeaveAreaLUA("XG0069","",[4994.2627],0))
ActionOverride(Player3,LeaveAreaLUA("XG0069","",[4989.2678],0))
ActionOverride(Player4,LeaveAreaLUA("XG0069","",[5054.2693],0))
ActionOverride(Player5,LeaveAreaLUA("XG0069","",[5072.2611],0))
ActionOverride(Player6,LeaveAreaLUA("XG0069","",[5064.2656],0))~ EXIT
END

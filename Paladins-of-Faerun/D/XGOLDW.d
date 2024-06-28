BEGIN ~XGOLDW~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
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
  IF ~~ THEN DO ~ActionOverride(Player2,LeaveAreaLUA("XG0964","",[743.590],6))
ActionOverride(Player1,LeaveAreaLUA("XG0964","",[759.559],6))
ActionOverride(Player3,LeaveAreaLUA("XG0964","",[805.547],6))
ActionOverride(Player4,LeaveAreaLUA("XG0964","",[799.596],6))
ActionOverride(Player5,LeaveAreaLUA("XG0964","",[741.611],6))
ActionOverride(Player6,LeaveAreaLUA("XG0964","",[786.627],6))
EscapeArea()~ EXIT
END

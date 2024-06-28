BEGIN ~XGprt~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
  SAY @0
  IF ~~ THEN REPLY @1 DO ~
ActionOverride(Player2,LeaveAreaLUA("XGTORM","",[284.386],12))
ActionOverride(Player1,LeaveAreaLUA("XGTORM","",[240.327],12))
ActionOverride(Player3,LeaveAreaLUA("XGTORM","",[177.468],12))
ActionOverride(Player4,LeaveAreaLUA("XGTORM","",[88.446],12))
ActionOverride(Player5,LeaveAreaLUA("XGTORM","",[109.358],12))
ActionOverride(Player6,LeaveAreaLUA("XGTORM","",[143.268],12))
EscapeArea()~ EXIT
  IF ~~ THEN REPLY @2 DO ~SetNumTimesTalkedTo(0)~ EXIT
END
 
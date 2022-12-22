BEGIN ~XGprt~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
  SAY @0
  IF ~~ THEN REPLY @1 DO ~ActionOverride(Player2,LeaveAreaLUA("PFTORM","",[284.386],12))
ActionOverride(Player1,LeaveAreaLUA("PFTORM","",[240.327],12))
ActionOverride(Player3,LeaveAreaLUA("PFTORM","",[177.468],12))
ActionOverride(Player4,LeaveAreaLUA("PFTORM","",[88.446],12))
ActionOverride(Player5,LeaveAreaLUA("PFTORM","",[109.358],12))
ActionOverride(Player6,LeaveAreaLUA("PFTORM","",[143.268],12))
EscapeArea()~ EXIT
  IF ~~ THEN REPLY @2 DO ~SetNumTimesTalkedTo(0)~ EXIT
END
 
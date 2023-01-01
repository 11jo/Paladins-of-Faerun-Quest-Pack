BEGIN ~XGCONC~

IF ~NumTimesTalkedTo(0)
PartyHasItem("XGLETL")~ THEN BEGIN 0
  SAY @1
  IF ~~ THEN REPLY @2 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @3
  IF ~~ THEN REPLY @4 GOTO 2
END

IF ~~ THEN BEGIN 2
  SAY @5
  IF ~~ THEN REPLY @6 DO ~ActionOverride(Player1,LeaveAreaLUA("XG0063","",[3013.1207],6))
ActionOverride(Player2,LeaveAreaLUA("XG0063","",[3037.1168],6))
ActionOverride(Player3,LeaveAreaLUA("XG0063","",[3055.1273],6))
ActionOverride(Player4,LeaveAreaLUA("XG0063","",[3116.1149],6))
ActionOverride(Player5,LeaveAreaLUA("XG0063","",[3152.1214],6))
ActionOverride(Player6,LeaveAreaLUA("XG0063","",[3217.1291],6))
EscapeArea()
~ EXIT
END

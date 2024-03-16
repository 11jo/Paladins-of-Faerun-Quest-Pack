BEGIN ~XGFNAS~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
  SAY @1
  IF ~~ THEN REPLY @2 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @3
  IF ~~ THEN REPLY @4 DO ~ActionOverride(Player1,LeaveAreaLUA("XG0030","",[3200.2640],0))
ActionOverride(Player2,LeaveAreaLUA("XG0030","",[3120.2670],0))
ActionOverride(Player3,LeaveAreaLUA("XG0030","",[3220.2640],0))
ActionOverride(Player4,LeaveAreaLUA("XG0030","",[3020.2650],0))
ActionOverride(Player5,LeaveAreaLUA("XG0030","",[3090.2600],0))
ActionOverride(Player6,LeaveAreaLUA("XG0030","",[3260.2620],0))
EscapeArea()
~ EXIT
  IF ~~ THEN REPLY @5 EXIT
END

IF ~!NumTimesTalkedTo(0)~ THEN BEGIN 2
  SAY @6
  IF ~~ THEN REPLY @7 DO ~ActionOverride(Player1,LeaveAreaLUA("XG0030","",[3200.2640],0))
ActionOverride(Player2,LeaveAreaLUA("XG0030","",[3120.2670],0))
ActionOverride(Player3,LeaveAreaLUA("XG0030","",[3220.2640],0))
ActionOverride(Player4,LeaveAreaLUA("XG0030","",[3020.2650],0))
ActionOverride(Player5,LeaveAreaLUA("XG0030","",[3090.2600],0))
ActionOverride(Player6,LeaveAreaLUA("XG0030","",[3260.2620],0))
~ EXIT
  IF ~~ THEN REPLY @8 EXIT
END

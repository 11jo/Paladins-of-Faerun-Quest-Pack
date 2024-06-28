BEGIN ~XGELWI1~

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
  IF ~~ THEN REPLY @5 DO ~HideAreaOnMap("XG0055")
RevealAreaOnMap("XG0015")
AddJournalEntry(@51213,QUEST)
ActionOverride(Player2,LeaveAreaLUA("XG0015","",[2600.480],3))
ActionOverride(Player1,LeaveAreaLUA("XG0015","",[2600.570],3))
ActionOverride(Player3,LeaveAreaLUA("XG0015","",[2600.660],3))
ActionOverride(Player4,LeaveAreaLUA("XG0015","",[2700.480],3))
ActionOverride(Player5,LeaveAreaLUA("XG0015","",[2700.570],3))
ActionOverride(Player6,LeaveAreaLUA("XG0015","",[2700.660],3))~ EXIT
END

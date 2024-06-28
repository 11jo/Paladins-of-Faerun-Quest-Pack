BEGIN ~XGdwq1~

IF ~True()
NumTimesTalkedTo(0)~ THEN BEGIN 0
  SAY @0
  IF ~~ THEN REPLY @1 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @2
  IF ~~ THEN REPLY @3 GOTO 2
END

IF ~~ THEN BEGIN 2
  SAY @4
  IF ~~ THEN REPLY @5 DO ~SetNumTimesTalkedTo(1)
AddJournalEntry(@50605,QUEST)
ActionOverride(Player2,LeaveAreaLUA("XG0480","",[403.562],0))
ActionOverride(Player1,LeaveAreaLUA("XG0480","",[429.599],0)) 
ActionOverride(Player3,LeaveAreaLUA("XG0480","",[483.561],0))
ActionOverride(Player4,LeaveAreaLUA("XG0480","",[407.505],0))
ActionOverride(Player5,LeaveAreaLUA("XG0480","",[479.463],0))
ActionOverride(Player6,LeaveAreaLUA("XG0480","",[530.521],0))~ EXIT
END

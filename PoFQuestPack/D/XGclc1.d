BEGIN ~XGclc1~

IF ~True()~ THEN BEGIN 0
  SAY @0
  IF ~~ THEN REPLY @1 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @2
  IF ~~ THEN REPLY @3 GOTO 2
  IF ~~ THEN REPLY @4 
DO ~GiveItemCreate("XGls",Player1,0,0,0)
ReputationInc(-2)
AddexperienceParty(10000)
EraseJournalEntry(@50439)
AddJournalEntry(@50415,QUEST)
ActionOverride(Player2,LeaveAreaLUA("XG0064","",[716.2359],12))
ActionOverride(Player1,LeaveAreaLUA("XG0064","",[675.2334],12))
ActionOverride(Player3,LeaveAreaLUA("XG0064","",[691.2405],12))
ActionOverride(Player4,LeaveAreaLUA("XG0064","",[634.2383],12))
ActionOverride(Player5,LeaveAreaLUA("XG0064","",[697.2451],12))
ActionOverride(Player6,LeaveAreaLUA("XG0064","",[639.2455],12))~ EXIT
END

IF ~~ THEN BEGIN 2
  SAY @6
  IF ~~ THEN DO ~Enemy()
ReputationInc(1)
AddexperienceParty(10000)
AddJournalEntry(@50407,QUEST)~ EXIT
END

BEGIN ~XGdrb2~

IF ~Dead("XGdrbs")~ THEN BEGIN 0
  SAY @0
  IF ~~ THEN DO ~ReputationInc(1)
EraseJournalEntry(@1)
EraseJournalEntry(@2)
EraseJournalEntry(@3)
EraseJournalEntry(@4)
EraseJournalEntry(@5)
AddExperienceParty(50000)
GiveItemCreate("XGMBOW1",Player1,0,0,0)
ActionOverride(Player2,LeaveAreaLUA("XGa480","",[403.562],0))
ActionOverride(Player1,LeaveAreaLUA("XGa480","",[429.599],0))
ActionOverride(Player3,LeaveAreaLUA("XGa480","",[483.561],0))
ActionOverride(Player4,LeaveAreaLUA("XGa480","",[407.505],0))
ActionOverride(Player5,LeaveAreaLUA("XGa480","",[479.463],0))
ActionOverride(Player6,LeaveAreaLUA("XGa480","",[530.521],0))
EscapeArea()~ SOLVED_JOURNAL @6 EXIT
END

IF ~!Dead("XGdrbs")~ THEN BEGIN 1
  SAY @7
  IF ~~ THEN EXIT
END

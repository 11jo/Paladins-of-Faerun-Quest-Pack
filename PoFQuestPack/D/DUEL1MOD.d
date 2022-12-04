BEGIN ~XGDUEL1~

IF ~Dead("XGELG1")~ THEN BEGIN 0
  SAY @1
  IF ~~ THEN REPLY @6 DO ~GiveItemCreate("CCLUB01",Player1,0,0,0)
GiveItemCreate("PLAT5",Player1,0,0,0)
EraseJournalEntry(@3)
EraseJournalEntry(@4)
EraseJournalEntry(@5)
SetNumTimesTalkedTo(2)
~ SOLVED_JOURNAL @2 EXIT
END

IF ~!Dead("XGELG1")~ THEN BEGIN 1
  SAY @7
  IF ~~ THEN EXIT
END

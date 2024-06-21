BEGIN ~XGDUEL1~

IF ~Dead("XGELG1") Global("XGELG1","GLOBAL",0)~ THEN BEGIN 0
  SAY @1
  IF ~~ THEN REPLY @6 DO ~GiveItemCreate("XGCLUB1",Player1,0,0,0)
GiveItemCreate("XGPLAT5",Player1,0,0,0)
SetGlobal("XGELG1","GLOBAL",1)
EraseJournalEntry(@51802)
EraseJournalEntry(@51801)
EraseJournalEntry(@51803)
AddJournalEntry(@51805,QUEST_DONE)
SetNumTimesTalkedTo(2)
~ EXIT
END

IF ~!Dead("XGELG1")~ THEN BEGIN 1
  SAY @7
  IF ~~ THEN EXIT
END

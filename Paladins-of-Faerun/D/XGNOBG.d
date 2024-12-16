BEGIN ~XGNOBG~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
  SAY @1
  IF ~~ THEN REPLY @2 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @3
  IF ~~ THEN REPLY @6 DO ~
GiveItemCreate("MISC07",Player1,1000,0,0)
EraseJournalEntry(@52401)
AddJournalEntry(@52402,QUEST_DONE)
AddexperienceParty(1000)
SetGlobal("XGZATon","GLOBAL",0)
SetGlobal("XGNOBG_TALK","GLOBAL",1)
ActionOverride("XGNOBG3",EscapeArea())
ActionOverride("XGNOBG1",EscapeArea())
ActionOverride("XGNOBG2",EscapeArea())
EscapeArea()~ EXIT
END

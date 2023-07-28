BEGIN ~XGNOBG~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
  SAY @1
  IF ~~ THEN REPLY @2 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @3
  IF ~~ THEN REPLY @6 DO ~GiveItemCreate("MISC07",Player1,1000,0,0)
EraseJournalEntry(@5)
AddexperienceParty(8000)
EscapeArea()~ SOLVED_JOURNAL @4 EXIT
END

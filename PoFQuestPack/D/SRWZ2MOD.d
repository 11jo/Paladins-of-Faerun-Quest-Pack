BEGIN ~SRWZ2MOD~

IF ~True()~  THEN BEGIN 0
  SAY @0
  IF ~~ THEN REPLY @1 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @2
  IF ~~ THEN REPLY @3 GOTO 2
  IF ~~ THEN REPLY @4 DO ~Enemy()~
SOLVED_JOURNAL @5 EXIT
END

IF ~~ THEN BEGIN 2
  SAY @6
  IF ~~ THEN REPLY @7 DO ~ForceSpell("XGSRWZ1",DRYAD_TELEPORT)
GiveItemCreate("XGTRW",Player1,0,0,0)
EraseJournalEntry(@8)
EraseJournalEntry(@9)
EraseJournalEntry(@10)
EraseJournalEntry(@11)~
SOLVED_JOURNAL @12 EXIT
END


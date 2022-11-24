BEGIN ~ADOB1MOD~

IF ~Global("s#ADOBMOD","GLOBAL",1)  Global("s#LOFLTMOD","GLOBAL",0)  !Dead("LOFLTMOD")~ THEN BEGIN 4
  SAY @0
  IF ~~ THEN REPLY @1 EXIT
END

IF ~Global("s#ADOBMOD","GLOBAL",1)  Global("s#LOFLTMOD","GLOBAL",1)  !Dead("LOFLTMOD")~ THEN BEGIN 5
  SAY @0
  IF ~~ THEN REPLY @2 GOTO 7
END

IF ~Global("s#ADOBMOD","GLOBAL",1) Dead("LOFLTMOD")~ THEN BEGIN 6
  SAY @0
  IF ~~ THEN REPLY @2 GOTO 7
END

IF ~~ THEN BEGIN 7
  SAY @3
  IF ~~ THEN DO ~AddExperienceParty(10000)
GivePartyGold(1000)
EscapeArea()
EraseJournalEntry(@4)
EraseJournalEntry( @5)
EraseJournalEntry(@6)
EraseJournalEntry(@7)
EraseJournalEntry(@8)
EraseJournalEntry(@9)~ 
SOLVED_JOURNAL @10 EXIT
END

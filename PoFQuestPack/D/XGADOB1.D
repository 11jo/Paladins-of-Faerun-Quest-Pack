BEGIN ~XGADOB1~

IF ~Global("s#XGADOB","GLOBAL",1)  Global("s#XGLOFLT","GLOBAL",0)  !Dead("XGLOFLT")~ THEN BEGIN 4
  SAY @0
  IF ~~ THEN REPLY @1 EXIT
END

IF ~Global("s#XGADOB","GLOBAL",1)  Global("s#XGLOFLT","GLOBAL",1)  !Dead("XGLOFLT")~ THEN BEGIN 5
  SAY @0
  IF ~~ THEN REPLY @2 GOTO 7
END

IF ~Global("s#XGADOB","GLOBAL",1) Dead("XGLOFLT")~ THEN BEGIN 6
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

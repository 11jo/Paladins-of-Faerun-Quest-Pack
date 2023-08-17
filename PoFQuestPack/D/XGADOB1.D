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
  IF ~~ THEN DO ~AddexperienceParty(10000)
GiveGoldForce(1000)
EraseJournalEntry(@50112)
EraseJournalEntry(@50114)
EraseJournalEntry(@50113)
EraseJournalEntry(@50115)
EraseJournalEntry(@50111)
EraseJournalEntry(@50116)
AddJournalEntry(@50117,QUEST_DONE)
EscapeArea()~ EXIT
END

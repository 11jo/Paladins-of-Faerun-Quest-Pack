BEGIN ~XGDRAG1~

IF ~See(Player1) Global("s#XGDRAG1","GLOBAL",0)~ THEN BEGIN 0
  SAY @0
  IF ~~ THEN REPLY @1 DO ~SetGlobal("XG0214","XG0214",1)~ GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @2
  IF ~~ THEN REPLY @3 GOTO 2
END

IF ~~ THEN BEGIN 2
  SAY @4
  IF ~~ THEN REPLY @5 GOTO 3
  IF ~~ THEN REPLY @6 DO ~Enemy()
ReputationInc(-2) AddJournalEntry(@50122,QUEST_DONE)~ EXIT
END

IF ~~ THEN BEGIN 3
  SAY @7
  IF ~~ THEN REPLY @8 GOTO 4
  IF ~~ THEN REPLY @9 DO ~SetGlobal("s#XGDRAG1","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN 4
  SAY @10
  IF ~~ THEN REPLY @11 DO ~SetGlobal("s#XGDRAG1","GLOBAL",2) AddJournalEntry(@50115,QUEST)~ EXIT
END

IF ~Global("s#XGDRAG1","GLOBAL",2)  PartyHasItem("XGWA")~ THEN BEGIN 5
  SAY @13
  IF ~~ THEN REPLY @14 DO ~TakePartyItem("XGWA")~ GOTO 6
END

IF ~~ THEN BEGIN 6
  SAY @15
  IF ~~ THEN REPLY @16 GOTO 7
END

IF ~~ THEN BEGIN 7
  SAY @17
  IF ~~ THEN REPLY @18 DO ~AddJournalEntry(@50121,QUEST_DONE) GiveItemCreate("XGPLAT4",Player1,0,0,0) EscapeArea()~ EXIT
END

IF ~Global("s#XGDRAG1","GLOBAL",2)  !PartyHasItem("XGWA")~ THEN BEGIN 8
  SAY @13
  IF ~~ THEN REPLY @20 EXIT
  IF ~~ THEN REPLY @21 DO ~Enemy()
ReputationInc(-2) AddJournalEntry(@50122,QUEST_DONE)~ EXIT
END

IF ~Global("s#XGDRAG1","GLOBAL",1)~ THEN BEGIN 9
  SAY @22
  IF ~~ THEN REPLY @8 GOTO 4
  IF ~~ THEN REPLY @6 DO ~Enemy()
ReputationInc(-2) AddJournalEntry(@50122,QUEST_DONE)~ EXIT
END

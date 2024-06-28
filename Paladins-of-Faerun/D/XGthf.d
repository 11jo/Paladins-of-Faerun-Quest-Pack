BEGIN ~XGthf~

IF ~See(Player1) Global("s#XGthf","GLOBAL",0)~ THEN BEGIN 0
  SAY @0
  IF ~~ THEN REPLY @1 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @2
  IF ~~ THEN REPLY @3 GOTO 2
END

IF ~~ THEN BEGIN 2
  SAY @4
  IF ~~ THEN REPLY @5 DO ~SetGlobal("s#XGthf","GLOBAL",1)
AddJournalEntry(@51701,QUEST)~ EXIT
  IF ~~ THEN REPLY @7 DO ~SetGlobal("XGthfQuestDone","GLOBAL",1)
AddJournalEntry(@51702,QUEST_DONE)
EscapeArea()~EXIT
END

IF ~ Global("s#XGthf","GLOBAL",1)
PartyHasItem("XGBRAC1")
Global("XGthfQuestItem1","GLOBAL",0)~ THEN BEGIN 3
  SAY @9
  IF ~~ THEN REPLY @10 DO ~SetGlobal("XGthfQuestItem1","GLOBAL",1)
GiveItemCreate("MISC07",Player1,10000,0,0)
TakePartyItem("XGBRAC1")~ EXIT
  IF ~~ THEN REPLY @11 DO ~SetGlobal("XGthfQuestItem1","GLOBAL",1)~ EXIT
  IF ~~ THEN REPLY @15 EXIT
  IF ~PartyHasItem("XGBOOT4")
Global("XGthfKeepItem2","GLOBAL",0)~ THEN REPLY @20 GOTO 4
  IF ~PartyHasItem("XGSWOR2")
Global("XGthfKeepItem3","GLOBAL",0)~ THEN REPLY @22 GOTO 5
END

IF ~ Global("s#XGthf","GLOBAL",1)
PartyHasItem("XGBOOT4")
Global("XGthfQuestItem2","GLOBAL",0)~ THEN BEGIN 4
  SAY @12
  IF ~~ THEN REPLY @10 DO ~SetGlobal("XGthfQuestItem2","GLOBAL",1)
GiveItemCreate("MISC07",Player1,10000,0,0)
TakePartyItem("XGBOOT4")~ EXIT
  IF ~~ THEN REPLY @11 DO ~SetGlobal("XGthfQuestItem2","GLOBAL",1)~ EXIT
  IF ~~ THEN REPLY @15 EXIT
  IF ~PartyHasItem("XGBRAC1")
Global("XGthfKeepItem1","GLOBAL",0)~ THEN REPLY @21 GOTO 3
  IF ~PartyHasItem("XGSWOR2")
Global("XGthfKeepItem3","GLOBAL",0)~ THEN REPLY @22 GOTO 5
END

IF ~ Global("s#XGthf","GLOBAL",1)
PartyHasItem("XGSWOR2")
Global("XGthfQuestItem3","GLOBAL",0)~ THEN BEGIN 5
  SAY @13
  IF ~~ THEN REPLY @16 DO ~SetGlobal("XGthfQuestItem3","GLOBAL",1)
GiveItemCreate("MISC07",Player1,10000,0,0)
TakePartyItem("XGSWOR2")~ EXIT
  IF ~~ THEN REPLY @17 DO ~SetGlobal("XGthfQuestItem3","GLOBAL",1)~ EXIT
  IF ~~ THEN REPLY @15 EXIT
  IF ~PartyHasItem("XGBOOT4")
Global("XGthfKeepItem2","GLOBAL",0)~ THEN REPLY @20 GOTO 4
  IF ~PartyHasItem("XGBRAC1")
Global("XGthfKeepItem1","GLOBAL",0)~ THEN REPLY @21 GOTO 3
END

IF ~Global("s#XGthf","GLOBAL",1)
OR(2) 
	!PartyHasItem("XGBRAC1") 
	Global("XGthfQuestItem1","GLOBAL",1)
OR(2)
	!PartyHasItem("XGBOOT4")
	Global("XGthfQuestItem2","GLOBAL",1)
OR(2)
	!PartyHasItem("XGSWOR2")
	Global("XGthfQuestItem3","GLOBAL",1)
OR(3)
	!Global("XGthfQuestItem1","GLOBAL",1)
	!Global("XGthfQuestItem2","GLOBAL",1)
	!Global("XGthfQuestItem3","GLOBAL",1)~ THEN BEGIN 6
  SAY @14
  IF ~~ THEN REPLY @15 EXIT
END

IF ~Global("XGthfQuestItem1","GLOBAL",1)
Global("XGthfQuestItem2","GLOBAL",1)
Global("XGthfQuestItem3","GLOBAL",1)~ THEN BEGIN 7
  SAY @18
  IF ~~ THEN REPLY @19 DO ~SetGlobal("s#XGthf","GLOBAL",2)
AddJournalEntry(@51706,QUEST_DONE)
EscapeArea()~ EXIT
END

BEGIN ~XGBH1~

IF ~Global("s#XGBH1","GLOBAL",0)~ THEN BEGIN 0
  SAY @0
  IF ~~ THEN REPLY @1 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @2
  IF ~~ THEN REPLY @3 GOTO 2
END

IF ~~ THEN BEGIN 2
  SAY @4
  IF ~~ THEN REPLY @5 GOTO 3
END

IF ~~ THEN BEGIN 3
  SAY @6
  IF ~PartyGoldGT(10000)~ THEN REPLY @7 DO ~TakePartyGold(10000)
AddJournalEntry(@50704,QUEST)~ GOTO 4
  IF ~~ THEN REPLY @9 DO ~SetGlobal("s#XGBH1","GLOBAL",1)
AddJournalEntry(@50704,QUEST)~ EXIT
  IF ~~ THEN REPLY @10 DO ~Enemy() ActionOverride("XGBHN1",Enemy()) ActionOverride("XGBHN",Enemy())~ EXIT 
END

IF ~~ THEN BEGIN 4
  SAY @11
  IF ~~ THEN REPLY @12 DO ~GiveItemCreate("XGARTK",Player1,0,0,0)
SetGlobal("s#XGBH1","GLOBAL",2)
AddJournalEntry(@50705,QUEST)
//ActionOverride(Player2,LeaveAreaLUA("AR2000","",[3979.2796],2))
//ActionOverride(Player1,LeaveAreaLUA("AR2000","",[4019.2743],2))
//ActionOverride(Player3,LeaveAreaLUA("AR2000","",[4099.2802],2))
//ActionOverride(Player4,LeaveAreaLUA("AR2000","",[4111.2868],2))
//ActionOverride(Player5,LeaveAreaLUA("AR2000","",[4044.2883],2))
//ActionOverride(Player6,LeaveAreaLUA("AR2000","",[3968.2907],2))~ EXIT
END

IF ~Global("s#XGBH1","GLOBAL",1)~ THEN BEGIN 5
  SAY @14
  IF ~PartyGoldGT(10000)~ THEN REPLY @7 DO ~TakePartyGold(10000)
AddJournalEntry(@50704,QUEST)~ GOTO 4
  IF ~~ THEN REPLY @15 EXIT
  IF ~~ THEN REPLY @10 DO ~Enemy()~ EXIT
END

BEGIN ~XGz~

IF ~Global("s#XGz","GLOBAL",0)~ THEN BEGIN 0
  SAY @0
  IF ~~ THEN REPLY @1 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @2
  IF ~~ THEN REPLY @3 GOTO 2
  IF ~~ THEN REPLY @4 GOTO 3
END

IF ~~ THEN BEGIN 2
  SAY @5
  IF ~~ THEN REPLY @6 GOTO 4
END

IF ~~ THEN BEGIN 3
  SAY @7
  IF ~~ THEN REPLY @3 GOTO 2
END

IF ~~ THEN BEGIN 4
  SAY @8
  IF ~!PartyGoldGT(2000)~ THEN REPLY @9 DO ~SetGlobal("s#XGz","GLOBAL",1)~ EXIT
  IF ~PartyGoldGT(2000)~ THEN REPLY @10 GOTO 5
END

IF ~~ THEN BEGIN 5
  SAY @11
  IF ~~ THEN DO ~TakePartyGold(2000)
GiveItemCreate("XGpk1",Player1,0,0,0)
GiveItemCreate("XGpk2",Player1,0,0,0)
GiveItemCreate("XGpk3",Player1,0,0,0)
GiveItemCreate("XGpk4",Player1,0,0,0)
GiveItemCreate("XGpk5",Player1,0,0,0)
SetGlobal("s#XGz","GLOBAL",2)~ EXIT
END

IF ~Global("s#XGz","GLOBAL",1)
PartyGoldGT(2000)~ THEN BEGIN 6
  SAY @12
  IF ~~ THEN REPLY @10 GOTO 5
END

IF ~Global("s#XGz","GLOBAL",2)
!PartyHasItem("XGplet")~ THEN BEGIN 7
  SAY @13
  IF ~~ THEN EXIT
END

IF ~Global("s#XGz","GLOBAL",2)
PartyHasItem("XGplet")~ THEN BEGIN 8
  SAY @14
  IF ~~ THEN REPLY @15 GOTO 9
END

IF ~~ THEN BEGIN 9
  SAY @16
  IF ~~ THEN DO ~GiveItemCreate("XGpkc",Player1,0,0,0)
CloseDoor("DOOR01")
CloseDoor("DOOR02")
CloseDoor("DOOR03")
CloseDoor("DOOR04")
CloseDoor("DOOR05")
SetGlobal("s#XGz","GLOBAL",3)
AddJournalEntry(@50301,QUEST)~ EXIT
END

IF ~Global("s#XGz","GLOBAL",3)~ THEN BEGIN 10
  SAY @18
  IF ~~ THEN EXIT
END











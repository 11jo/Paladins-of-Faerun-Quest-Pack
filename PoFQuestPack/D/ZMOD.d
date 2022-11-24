BEGIN ~ZMOD~

IF ~Global("s#ZMOD","GLOBAL",0)~ THEN BEGIN 0
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
  IF ~PartyGoldGT(500)~ THEN REPLY @6 GOTO 4
END

IF ~~ THEN BEGIN 3
  SAY @7
  IF ~~ THEN REPLY @3 GOTO 2
END

IF ~~ THEN BEGIN 4
  SAY @8
  IF ~!PartyGoldGT(2000)~ THEN REPLY @9 DO ~SetGlobal("s#ZMOD","GLOBAL",1)~ EXIT
  IF ~PartyGoldGT(2000)~ THEN REPLY @10 GOTO 5
END

IF ~~ THEN BEGIN 5
  SAY @11
  IF ~~ THEN DO ~TakePartyGold(2000)
GiveItemCreate("PK1MOD",Player1,0,0,0)
GiveItemCreate("PK2MOD",Player1,0,0,0)
GiveItemCreate("PK3MOD",Player1,0,0,0)
GiveItemCreate("PK4MOD",Player1,0,0,0)
GiveItemCreate("PK5MOD",Player1,0,0,0)
SetGlobal("s#ZMOD","GLOBAL",2)~ EXIT
END

IF ~Global("s#ZMOD","GLOBAL",1)
PartyGoldGT(2000)~ THEN BEGIN 6
  SAY @12
  IF ~~ THEN REPLY @10 GOTO 5
END

IF ~Global("s#ZMOD","GLOBAL",2)
!PartyHasItem("PLETMOD")~ THEN BEGIN 7
  SAY @13
  IF ~~ THEN EXIT
END

IF ~Global("s#ZMOD","GLOBAL",2)
PartyHasItem("PLETMOD")~ THEN BEGIN 8
  SAY @14
  IF ~~ THEN REPLY @15 GOTO 9
END

IF ~~ THEN BEGIN 9
  SAY @16
  IF ~~ THEN DO ~GiveItemCreate("PKCMOD",Player1,0,0,0)
CloseDoor("DOOR01")
CloseDoor("DOOR02")
CloseDoor("DOOR03")
CloseDoor("DOOR04")
CloseDoor("DOOR05")
SetGlobal("s#ZMOD","GLOBAL",3)~ 
UNSOLVED_JOURNAL @17 EXIT
END

IF ~Global("s#ZMOD","GLOBAL",3)~ THEN BEGIN 10
  SAY @18
  IF ~~ THEN EXIT
END











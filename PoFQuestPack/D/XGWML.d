BEGIN ~XGWML~

IF ~Global("s#XGWML","GLOBAL",0) THEN BEGIN 0
Dead("XGBARB1")~ THEN BEGIN 0
  SAY @0
  IF ~~ THEN REPLY @1 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @2
  IF ~~ THEN REPLY @3 GOTO 2
END

IF ~~ THEN BEGIN 2
  SAY @4
  IF ~~ THEN REPLY @5  EXIT
  IF ~~ THEN REPLY @6 GOTO 3
END

IF ~~ THEN BEGIN 3
  SAY @7
  IF ~~ THEN REPLY @8 DO ~RevealAreaOnMap("XG0029")
SetGlobal("s#XGWML","GLOBAL",1)~ UNSOLVED_JOURNAL @9 EXIT
END

IF ~Global("s#XGWML","GLOBAL",1) 
Dead("XGWNEC")
PartyHasItem("XGMWD")~ THEN BEGIN 4
  SAY @10
  IF ~~ THEN REPLY @11 GOTO 5
END

IF ~~ THEN BEGIN 5
  SAY @12
  IF ~~ THEN REPLY @13 GOTO 6
END

IF ~~ THEN BEGIN 6
  SAY @14
  IF ~~ THEN REPLY @15 GOTO 7
END

IF ~~ THEN BEGIN 7
  SAY @16
  IF ~~ THEN REPLY @17 DO ~AddexperienceParty(20000)
TakePartyItem("XGMWD")
SetGlobal("s#XGWML","GLOBAL",2)
RevealAreaOnMap("XG0012")~ UNSOLVED_JOURNAL @18 EXIT
END

IF ~Global("s#XGWML","GLOBAL",1) 
!Dead("XGWNEC")
!PartyHasItem("XGMWD")~ THEN BEGIN 8
  SAY @10
  IF ~~ THEN REPLY @19 EXIT
END

IF ~Global("s#XGWML","GLOBAL",2)~ THEN BEGIN 9
  SAY @20
  IF ~~ THEN REPLY @21 EXIT
END

// JO addition

IF ~Global("s#XGWML","GLOBAL",3)~ THEN BEGIN 10
  SAY @22
  IF ~~ THEN EXIT
END

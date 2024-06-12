BEGIN ~XGMARAN~

IF ~See(Player1) Global("s#XGMARAN","GLOBAL",0)~ THEN BEGIN 0
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
  IF ~~ THEN REPLY @6 DO ~SetGlobal("s#XGMARAN","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN 3
  SAY @7
  IF ~~ THEN REPLY @8 DO ~RevealAreaOnMap("XG0064")
SetGlobal("s#XGMARAN","GLOBAL",2)
AddJournalEntry(@51304,QUEST)~ EXIT
END

IF ~ Global("s#XGMARAN","GLOBAL",1)~ THEN BEGIN 4
  SAY @10
  IF ~~ THEN REPLY @11 GOTO 2
  IF ~~ THEN REPLY @6 EXIT
END

IF ~Global("s#XGMARAN","GLOBAL",2) PartyHasItem("XGLETW") !PartyHasItem("XGMAR")~ THEN BEGIN 5.0 //  PartyHasItem("XGMAR") XGMARK1.D seem not implemented to see...
  SAY @12
  IF ~~ THEN REPLY @13 DO ~TakePartyItem("XGLETW") SetGlobal("XGLETW","LOCALS",1)~ GOTO 9 // TakePartyItem("XGMAR")
END

IF ~Global("s#XGMARAN","GLOBAL",2) PartyHasItem("XGLETW") PartyHasItem("XGMAR")~ THEN BEGIN 5.1 //  PartyHasItem("XGMAR") XGMARK1.D seem not implemented to see...
  SAY @12
  IF ~~ THEN REPLY @19 DO ~TakePartyItem("XGLETW") TakePartyItem("XGMAR")~ GOTO 6 // TakePartyItem("XGMAR")
END


IF ~Global("s#XGMARAN","GLOBAL",2) PartyHasItem("XGMAR") Global("XGLETW","LOCALS",1)~ THEN BEGIN 5.2
  SAY @12
  IF ~~ THEN REPLY @20 DO ~TakePartyItem("XGMAR")~ GOTO 6
END


IF ~~ THEN BEGIN 6
  SAY @14
  IF ~~ THEN REPLY @15 GOTO 7
END

IF ~~ THEN BEGIN 7
  SAY @16
  IF ~~ THEN DO ~GiveItemCreate("XGWRG",Player1,0,0,0)
SetGlobal("XG_PoF_GetMarco","GLOBAL",2)
AddJournalEntry(@51305,QUEST)
EscapeArea()~ EXIT
END

IF ~Global("s#XGMARAN","GLOBAL",2) 
!PartyHasItem("XGLETW") 
!PartyHasItem("XGMAR")
Global("XGLETW","LOCALS",0)~ THEN BEGIN 8
  SAY @12
  IF ~~ THEN REPLY @18 EXIT
END

IF ~Global("s#XGMARAN","GLOBAL",2)
!PartyHasItem("XGMAR")
GlobalGT("XGLETW","LOCALS",0)~ THEN BEGIN 8
  SAY @12
  IF ~~ THEN REPLY @18  GOTO 11
END

IF ~~ THEN BEGIN 9
  SAY @21
  IF ~~ THEN REPLY @22 GOTO 10
END

IF ~~ THEN BEGIN 10
  SAY @23
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 11
  SAY @24
  IF ~~ THEN EXIT
END

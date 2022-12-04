BEGIN ~XGprtc2~

IF ~Global("s#XGprtc2","GLOBAL",0)~ THEN BEGIN 0
  SAY @0
  IF ~~ THEN REPLY @1 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @2
  IF ~~ THEN REPLY @3 DO ~SetGlobal("s#XGprtc2","GLOBAL",1)~ EXIT
  IF ~~ THEN REPLY @4 GOTO 2
END

IF ~~ THEN BEGIN 2
  SAY @5
  IF ~~ THEN REPLY @6 GOTO 3
END

IF ~~ THEN BEGIN 3
  SAY @7
  IF ~~ THEN REPLY @8 DO ~RevealAreaOnMap("PF0084") 
SetGlobal("s#XGprtc2","GLOBAL",2)
GiveItemCreate("XGprt",Player1,0,0,0)~ 
UNSOLVED_JOURNAL @9 EXIT
END

IF ~Global("s#XGprtc2","GLOBAL",1)~ THEN BEGIN 4
  SAY @10
  IF ~~ THEN REPLY @11 GOTO 2
  IF ~~ THEN REPLY @12 EXIT
END

IF ~Global("s#XGprtc2","GLOBAL",2)
!PartyHasItem("QITMOD")~ THEN BEGIN 5
  SAY @13
  IF ~~ THEN REPLY @14 EXIT
END

IF ~Global("s#XGprtc2","GLOBAL",2)
PartyHasItem("QITMOD")~ THEN BEGIN 6
  SAY @13
  IF ~~ THEN REPLY @15 GOTO 7
END

IF ~~ THEN BEGIN 7
  SAY @16
  IF ~~ THEN REPLY @17 DO ~GiveItemCreate("IK06",Player1,0,0,0)
AddexperienceParty(5000)
TakePartyItem("QITMOD")
EraseJournalEntry(@9)
EraseJournalEntry(@18)
GiveItemCreate("BOOK03",Player1,0,0,0)
EscapeArea()
~ SOLVED_JOURNAL @19 EXIT
  IF ~~ THEN REPLY @20 DO ~GiveItemCreate("IK06",Player1,0,0,0)
AddexperienceParty(5000)
TakePartyItem("QITMOD")
EraseJournalEntry(@9)
EraseJournalEntry(@18)
GiveItemCreate("BOOK06",Player1,0,0,0)
EscapeArea()
~ SOLVED_JOURNAL @19 EXIT
  IF ~~ THEN REPLY @21 DO ~GiveItemCreate("IK06",Player1,0,0,0)
AddexperienceParty(5000)
TakePartyItem("QITMOD")
EraseJournalEntry(@9)
EraseJournalEntry(@18)
GiveItemCreate("BOOK08",Player1,0,0,0)
EscapeArea()
~ SOLVED_JOURNAL @19 EXIT
END

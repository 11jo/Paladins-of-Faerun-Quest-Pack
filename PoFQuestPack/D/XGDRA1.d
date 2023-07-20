BEGIN ~XGDRA1~

IF ~PartyHasItem("XGAM")
PartyHasItem("XGAM1")
PartyHasItem("XGAM2")
PartyHasItem("XGAM3")
PartyHasItem("XGAM4")
PartyHasItem("XGAM5")~ THEN BEGIN 0
  SAY @1
  IF ~~ THEN REPLY @2 GOTO 2
END

IF ~!PartyHasItem("XGAM")
!PartyHasItem("XGAM1")
!PartyHasItem("XGAM2")
!PartyHasItem("XGAM3")
!PartyHasItem("XGAM4")
!PartyHasItem("XGAM5")~ THEN BEGIN 1
  SAY @3
  IF ~~ THEN REPLY @4 EXIT
  IF ~~ THEN REPLY @6 DO ~Enemy()
~ UNSOLVED_JOURNAL @5 EXIT
END

IF ~~ THEN BEGIN 2
  SAY @7
  IF ~~ THEN REPLY @9 DO ~TakePartyItem("XGAM")
TakePartyItem("XGAM1")
TakePartyItem("XGAM2")
TakePartyItem("XGAM3")
TakePartyItem("XGAM4")
TakePartyItem("XGAM5")
AddexperienceParty(50000)
PickUpItem("XGFLAI1")
EscapeArea()
~ UNSOLVED_JOURNAL @8 EXIT
  IF ~~ THEN REPLY @10 DO ~Enemy()
~ UNSOLVED_JOURNAL @5 EXIT
END

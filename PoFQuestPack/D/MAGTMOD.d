BEGIN ~XGMAGT~

IF ~NumTimesTalkedTo(0)
!PartyHasItem("GLAVE07")
!PartyHasItem("GLAVE08")
!PartyHasItem("GLAVE09")
!PartyHasItem("GLAVE10")~ THEN BEGIN 0
  SAY @1
  IF ~~ THEN REPLY @2 GOTO 3
END

IF ~PartyHasItem("GLAVE")
!NumTimesTalkedTo(0)~ THEN BEGIN 1
  SAY @3
  IF ~PartyGoldGT(2000)~ THEN REPLY @4 DO ~TakePartyItem("GLAVE")
GiveItemCreate("GLAVE07",Player1,0,0,0)
TakePartyGold(2000)
~ EXIT
  IF ~PartyGoldGT(2000)~ THEN REPLY @5 DO ~TakePartyItem("GLAVE")
GiveItemCreate("GLAVE08",Player1,0,0,0)
TakePartyGold(2000)
~ EXIT
  IF ~PartyGoldGT(2000)~ THEN REPLY @6 DO ~TakePartyItem("GLAVE")
GiveItemCreate("GLAVE09",Player1,0,0,0)
TakePartyGold(2000)
~ EXIT
  IF ~PartyGoldGT(2500)~ THEN REPLY @7 DO ~TakePartyItem("GLAVE")
GiveItemCreate("GLAVE10",Player1,0,0,0)
TakePartyGold(2500)
~ EXIT
  IF ~!PartyGoldGT(2000)
!PartyGoldGT(2500)~ THEN REPLY @8 EXIT
END

IF ~!NumTimesTalkedTo(0)
!PartyHasItem("GLAVE")~ THEN BEGIN 2
  SAY @9
  IF ~~ THEN REPLY @10 EXIT
END

IF ~~ THEN BEGIN 3
  SAY @11
  IF ~~ THEN EXIT
END

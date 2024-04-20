BEGIN ~XGMAGT~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
  SAY @1
  IF ~~ THEN REPLY @2 GOTO 3
END

IF ~!NumTimesTalkedTo(0)
PartyHasItem("XGGLAVE")~ THEN BEGIN 1
  SAY @3
  IF ~PartyGoldGT(2000)~ THEN REPLY @4 DO ~TakePartyItem("XGGLAVE")
GiveItemCreate("XGGLAV7",Player1,0,0,0)
TakePartyGold(2000)
~ EXIT
  IF ~PartyGoldGT(2000)~ THEN REPLY @5 DO ~TakePartyItem("XGGLAVE")
GiveItemCreate("XGGLAV8",Player1,0,0,0)
TakePartyGold(2000)
~ EXIT
  IF ~PartyGoldGT(2000)~ THEN REPLY @6 DO ~TakePartyItem("XGGLAVE")
GiveItemCreate("XGGLAV9",Player1,0,0,0)
TakePartyGold(2000)
~ EXIT
  IF ~PartyGoldGT(2500)~ THEN REPLY @7 DO ~TakePartyItem("XGGLAVE")
GiveItemCreate("XGLAV10",Player1,0,0,0)
TakePartyGold(2500)
~ EXIT
  IF ~~ THEN REPLY @8 EXIT
END

IF ~!NumTimesTalkedTo(0)
!PartyHasItem("XGGLAVE")
PartyHasItem("SW1H04")~ THEN BEGIN 1
  SAY @3
  IF ~PartyGoldGT(2000)~ THEN REPLY @4 DO ~TakePartyItem("SW1H04")
GiveItemCreate("XGGLAV7",Player1,0,0,0)
TakePartyGold(2000)
~ EXIT
  IF ~PartyGoldGT(2000)~ THEN REPLY @5 DO ~TakePartyItem("SW1H04")
GiveItemCreate("XGGLAV8",Player1,0,0,0)
TakePartyGold(2000)
~ EXIT
  IF ~PartyGoldGT(2000)~ THEN REPLY @6 DO ~TakePartyItem("SW1H04")
GiveItemCreate("XGGLAV9",Player1,0,0,0)
TakePartyGold(2000)
~ EXIT
  IF ~PartyGoldGT(2500)~ THEN REPLY @7 DO ~TakePartyItem("SW1H04")
GiveItemCreate("XGLAV10",Player1,0,0,0)
TakePartyGold(2500)
~ EXIT
  IF ~~ THEN REPLY @8 EXIT
END

IF ~!NumTimesTalkedTo(0)
!PartyHasItem("XGGLAVE")
!PartyHasItem("SW1H04")~ THEN BEGIN 2
  SAY @9
  IF ~~ THEN REPLY @10 EXIT
END

IF ~~ THEN BEGIN 3
  SAY @11
  IF ~~ THEN EXIT
END

/*

To create +2
IF ~!NumTimesTalkedTo(0)
OR(4)
	PartyHasItem("XGGLAV7")
	PartyHasItem("XGGLAV8")
	PartyHasItem("XGGLAV9")
	PartyHasItem("XGLAV10")~ THEN BEGIN 1
  SAY @3
  IF ~PartyGoldGT(8000)	PartyHasItem("XGGLAV7")~ THEN REPLY @4 DO ~TakePartyItem("XGGLAV7")
GiveItemCreate("XGLAV17",Player1,0,0,0)
TakePartyGold(8000)
~ EXIT
  IF ~PartyGoldGT(8000)	PartyHasItem("XGGLAV8")~ THEN REPLY @5 DO ~TakePartyItem("XGGLAV8")
GiveItemCreate("XGLAV18",Player1,0,0,0)
TakePartyGold(8000)
~ EXIT
  IF ~PartyGoldGT(8000)	PartyHasItem("XGGLAV9")~ THEN REPLY @6 DO ~TakePartyItem("XGGLAV9")
GiveItemCreate("XGLAV19",Player1,0,0,0)
TakePartyGold(8000)
~ EXIT
  IF ~PartyGoldGT(9000)) PartyHasItem("XGLAV10")~ THEN REPLY @7 DO ~TakePartyItem("XGLAV10")
GiveItemCreate("XGLAV11",Player1,0,0,0)
TakePartyGold(9000)
~ EXIT
  IF ~~ THEN REPLY @8 EXIT
END
*/

/*

To create +3
IF ~!NumTimesTalkedTo(0)
GlobalGT("Chapter","GLOBAL","%bg2_chapter_5%")
OR(4)
	PartyHasItem("XGLAV17")
	PartyHasItem("XGLAV18")
	PartyHasItem("XGLAV19")
	PartyHasItem("XGLAV11")~ THEN BEGIN 1
  SAY @3
  IF ~PartyGoldGT(8000)	PartyHasItem("XGLAV17")~ THEN REPLY @4 DO ~TakePartyItem("XGLAV17")
GiveItemCreate("XGLAV27",Player1,0,0,0)
TakePartyGold(8000)
~ EXIT
  IF ~PartyGoldGT(8000)	PartyHasItem("XGLAV18")~ THEN REPLY @5 DO ~TakePartyItem("XGLAV18")
GiveItemCreate("XGLAV28",Player1,0,0,0)
TakePartyGold(8000)
~ EXIT
  IF ~PartyGoldGT(8000)	PartyHasItem("XGLAV19")~ THEN REPLY @6 DO ~TakePartyItem("XGLAV19")
GiveItemCreate("XGLAV29",Player1,0,0,0)
TakePartyGold(8000)
~ EXIT
  IF ~PartyGoldGT(9000)) PartyHasItem("XGLAV11")~ THEN REPLY @7 DO ~TakePartyItem("XGLAV11")
GiveItemCreate("XGLAV21",Player1,0,0,0)
TakePartyGold(9000)
~ EXIT
  IF ~~ THEN REPLY @8 EXIT
END
*/
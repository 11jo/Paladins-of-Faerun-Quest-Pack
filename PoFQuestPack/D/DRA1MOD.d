BEGIN ~DRA1MOD~

IF ~PartyHasItem("AMMOD")
PartyHasItem("AM1MOD")
PartyHasItem("AM2MOD")
PartyHasItem("AM3MOD")
PartyHasItem("AM4MOD")
PartyHasItem("AM5MOD")~ THEN BEGIN 0
  SAY @1
  IF ~~ THEN REPLY @2 GOTO 2
END

IF ~!PartyHasItem("AMMOD")
!PartyHasItem("AM1MOD")
!PartyHasItem("AM2MOD")
!PartyHasItem("AM3MOD")
!PartyHasItem("AM4MOD")
!PartyHasItem("AM5MOD")~ THEN BEGIN 1
  SAY @3
  IF ~~ THEN REPLY @4 EXIT
  IF ~~ THEN REPLY @6 DO ~Enemy()
~ UNSOLVED_JOURNAL @5 EXIT
END

IF ~~ THEN BEGIN 2
  SAY @7
  IF ~~ THEN REPLY @9 DO ~TakePartyItem("AMMOD")
TakePartyItem("AM1MOD")
TakePartyItem("AM2MOD")
TakePartyItem("AM3MOD")
TakePartyItem("AM4MOD")
TakePartyItem("AM5MOD")
AddexperienceParty(50000)
PickUpItem("ANMOD")
EscapeArea()
~ UNSOLVED_JOURNAL @8 EXIT
  IF ~~ THEN REPLY @10 DO ~Enemy()
~ UNSOLVED_JOURNAL @5 EXIT
END

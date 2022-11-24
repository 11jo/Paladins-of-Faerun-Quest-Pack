BEGIN ~DRQQMOD~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
  SAY @1
  IF ~~ THEN REPLY @2 DO ~EscapeArea()
~ EXIT
  IF ~~ THEN REPLY @3 DO ~SetNumTimesTalkedTo(1)
~ EXIT
END

IF ~NumTimesTalkedTo(1)
PartyhasItem("DRAMMOD")~ THEN BEGIN 1
  SAY @4
  IF ~~ THEN REPLY @5 GOTO 2
END

IF ~~ THEN BEGIN 2
  SAY @6
  IF ~~ THEN DO ~AddexperienceParty(5000)
GiveItemCreate("ODSW03",Player1,0,0,0)
TakePartyItem("DRAMMOD")
EscapeArea()
~ EXIT
END

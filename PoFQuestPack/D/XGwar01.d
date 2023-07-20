BEGIN ~XGwar01~

IF ~NumTimesTalkedTo(0)
See(Player1)~ THEN BEGIN 0
  SAY @0
  IF ~~ THEN REPLY @1 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @2
  IF ~~ THEN REPLY @3 GOTO 2
END

IF ~~ THEN BEGIN 2
  SAY @4
  IF ~~ THEN REPLY @5 DO ~ActionOverride("XGwar01",Enemy())
ActionOverride("XGwar02",Enemy())~ EXIT
  IF ~~ THEN REPLY @6 DO ~ActionOverride("XGdr01",Enemy())
ReputationInc(-1)~ EXIT
  IF ~PartyGoldGT(1000)~ THEN REPLY @7 DO ~TakePartyGold(1000)
ActionOverride("XGwar01",EscapeArea())
ActionOverride("XGwar02",EscapeArea())
ActionOverride("XGdr01",StartDialogue("XGdr01",Player1))~ EXIT
END

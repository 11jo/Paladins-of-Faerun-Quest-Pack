BEGIN ~WAR01MOD~

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
  IF ~~ THEN REPLY @5 DO ~ActionOverride("WAR01MOD",Enemy())
ActionOverride("WAR02MOD",Enemy())~ EXIT
  IF ~~ THEN REPLY @6 DO ~ActionOverride("DR01MOD",Enemy())
ReputationInc(-1)~ EXIT
  IF ~PartyGoldGT(1000)~ THEN REPLY @7 DO ~TakepartyGold(1000)
ActionOverride("WAR01MOD",EscapeArea())
ActionOverride("WAR02MOD",EscapeArea())
ActionOverride("DR01MOD",StartDialogue("DR01MOD",Player1))~ EXIT
END

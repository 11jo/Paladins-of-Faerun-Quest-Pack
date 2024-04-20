BEGIN ~XGELM3~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
  SAY @1
  IF ~~ THEN REPLY @2 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @3
  IF ~~ THEN REPLY @4 GOTO 2
END

IF ~~ THEN BEGIN 2
  SAY @5
  IF ~~ THEN REPLY @7 DO ~RevealAreaOnMap("%NBaldursGate%")
SetGlobal("XGPoFinBG","GLOBAL",1)
AddexperienceParty(20000)
AddJournalEntry(@51209,QUEST)
ForceSpell(Myself,DRYAD_TELEPORT)~ EXIT
END

BEGIN ~XGfngra~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
  SAY @1
  IF ~~ THEN REPLY @2 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @3
  IF ~~ THEN DO ~Enemy()
CreateCreature("XGGRE",[714.1350],8)
CreateCreature("XGGRE",[576.1275],12)
CreateCreature("XGGRE",[754.1076],0)
CreateCreature("XGGRE",[803.1060],0)
~ EXIT
END

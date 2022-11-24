BEGIN ~FNGRADAK~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
  SAY @1
  IF ~~ THEN REPLY @2 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @3
  IF ~~ THEN DO ~Enemy()
CreateCreature("GREMOD",[714.1350],8)
CreateCreature("GREMOD",[576.1275],12)
CreateCreature("GREMOD",[754.1076],0)
CreateCreature("GREMOD",[803.1060],0)
~ EXIT
END

BEGIN ~TRNMOD~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
  SAY @1
  IF ~~ THEN REPLY @2 DO ~StartStore("SHOP3MOD",LastTalkedToBy(Myself))
~ EXIT
  IF ~~ THEN REPLY @3 DO ~SetNumTimesTalkedTo(0)
~ EXIT
END

BEGIN ~XGTRN~

IF ~True()~ THEN BEGIN 0
  SAY @1
  IF ~~ THEN REPLY @2 DO ~StartStore("XGSHOP3",LastTalkedToBy(Myself))
~ EXIT
  IF ~~ THEN REPLY @3 EXIT
END


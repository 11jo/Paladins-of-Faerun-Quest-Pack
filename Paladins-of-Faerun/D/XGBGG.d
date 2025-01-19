BEGIN ~XGBGG~

IF ~NumTimesTalkedTo(0) AreaCheck("XG1120")~ THEN BEGIN 0
  SAY @1
  IF ~~ THEN REPLY @2 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @3
  IF ~~ THEN REPLY @4 GOTO 2
  IF ~~ THEN REPLY @6 GOTO 3
END

IF ~~ THEN BEGIN 2
  SAY @5
  IF ~~ THEN DO ~SetGlobal("XGBGG_Missing","GLOBAL",8) EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN 3
  SAY @7
  IF ~~ THEN DO ~ChangeAIScript("XGBGG",CLASS) ChangeAIScript("NONE",GENERAL) SetGlobal("XGBGG_Missing","GLOBAL",4) Ally()~ EXIT
END


IF ~OR(2)
	Global("XGBGG_Missing","GLOBAL",4)
	Global("XGBGG_Missing","GLOBAL",5)~ THEN BEGIN 0
  SAY @1059
  IF ~~ THEN EXIT
END

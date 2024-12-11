BEGIN ~XGgghc~

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
  IF ~~ THEN REPLY @6 GOTO 3
END

IF ~~ THEN BEGIN 3
  SAY @7
  IF ~~ THEN REPLY @9 DO ~AddJournalEntry(@51216,QUEST)
Enemy()~ EXIT
END

IF ~Global("XGgghc_Talk2","GLOBAL",1)~ THEN BEGIN 4
  SAY @10
  IF ~~ THEN REPLY @12 GOTO 5
  IF ~~ THEN REPLY @11 DO ~
	StartCutSceneMode() 
    HideGUI()
	Wait(1)
    MoveViewPoint([689.234],VERY_FAST)
	MoveToPointNoInterrupt([689.234])
	Enemy()
	DisplayStringHead(Myself,@16)
    FaceObject(Player1)
	Wait(1)
	ForceSpell(Myself,RESTORE_FULL_HEALTH)
	UnhideGUI()
	EndCutSceneMode()~ EXIT
END

IF ~~ THEN BEGIN 5
  SAY @13
  IF ~~ THEN REPLY @14 GOTO 6
END

IF ~~ THEN BEGIN 6
  SAY @15
  IF ~~ THEN DO ~MoveToPoint([939.824]) EscapeArea()~ EXIT
END

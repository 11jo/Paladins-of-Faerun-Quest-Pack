BEGIN ~XGRANM~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
  SAY @1
  IF ~~ THEN REPLY @2 GOTO 1
  IF ~~ THEN REPLY @3 GOTO 2
  IF ~~ THEN REPLY @4 EXIT
  IF ~~ THEN REPLY @5 GOTO 7
END

IF ~~ THEN BEGIN 1
  SAY @6
  IF ~~ THEN REPLY @7 DO ~SetNumTimesTalkedTo(1)
~ EXIT
  IF ~~ THEN REPLY @3 GOTO 5
  IF ~~ THEN REPLY @5 GOTO 10
END

IF ~~ THEN BEGIN 2
  SAY @8
  IF ~~ THEN REPLY @9 GOTO 3
END

IF ~~ THEN BEGIN 3
  SAY @10
  IF ~~ THEN REPLY @2 GOTO 4
  IF ~~ THEN REPLY @5 GOTO 19
  IF ~~ THEN REPLY @7 DO ~SetNumTimesTalkedTo(1)
~ EXIT
END

IF ~~ THEN BEGIN 4
  SAY @6
  IF ~~ THEN REPLY @5 GOTO 16
  IF ~~ THEN REPLY @7 DO ~SetNumTimesTalkedTo(1)
~ EXIT
END

IF ~~ THEN BEGIN 5
  SAY @8
  IF ~~ THEN REPLY @9 GOTO 6
END

IF ~~ THEN BEGIN 6
  SAY @10
  IF ~~ THEN REPLY @7 DO ~SetNumTimesTalkedTo(1)
~ EXIT
  IF ~~ THEN REPLY @5 GOTO 13
END

IF ~~ THEN BEGIN 7
  SAY @11
  IF ~~ THEN REPLY @12 GOTO 8
END

IF ~~ THEN BEGIN 8
  SAY @13
  IF ~~ THEN REPLY @14 GOTO 9
END

IF ~~ THEN BEGIN 9
  SAY @15
  IF ~~ THEN REPLY @18 DO ~RevealAreaOnMap("XG0060")
AddJournalEntry(@51220,QUEST)
Wait(1)
CreateCreature("XGASSF",[337.282],10)
DisplayString("XGASSF",@17)
ActionOverride("XGASSF",Attack("XGRANM"))
ActionOverride("XGASSF",Kill("XGRANM"))
Wait(3)~ EXIT
END

IF ~~ THEN BEGIN 10
  SAY @11
  IF ~~ THEN REPLY @12 GOTO 11
END

IF ~~ THEN BEGIN 11
  SAY @13
  IF ~~ THEN REPLY @14 GOTO 12
END

IF ~~ THEN BEGIN 12
  SAY @15
  IF ~~ THEN REPLY @18 DO ~RevealAreaOnMap("XG0060")
AddJournalEntry(@51220,QUEST)
Wait(1)
CreateCreature("XGASSF",[337.282],10)
DisplayString("XGASSF",@17)
ActionOverride("XGASSF",Attack("XGRANM"))
ActionOverride("XGASSF",Kill("XGRANM"))
Wait(3)~ EXIT
END

IF ~~ THEN BEGIN 13
  SAY @11
  IF ~~ THEN REPLY @12 GOTO 14
END

IF ~~ THEN BEGIN 14
  SAY @13
  IF ~~ THEN REPLY @14 GOTO 15
END

IF ~~ THEN BEGIN 15
  SAY @15
  IF ~~ THEN REPLY @18 DO ~RevealAreaOnMap("XG0060")
AddJournalEntry(@51220,QUEST)
Wait(1)
CreateCreature("XGASSF",[337.282],10)
DisplayString("XGASSF",@17)
ActionOverride("XGASSF",Attack("XGRANM"))
ActionOverride("XGASSF",Kill("XGRANM"))
Wait(3)~ EXIT
END

IF ~~ THEN BEGIN 16
  SAY @11
  IF ~~ THEN REPLY @12 GOTO 17
END

IF ~~ THEN BEGIN 17
  SAY @13
  IF ~~ THEN REPLY @14 GOTO 18
END

IF ~~ THEN BEGIN 18
  SAY @15
  IF ~~ THEN REPLY @18 DO ~RevealAreaOnMap("XG0060")
AddJournalEntry(@51220,QUEST)
Wait(1)
CreateCreature("XGASSF",[337.282],10)
DisplayString("XGASSF",@17)
ActionOverride("XGASSF",Attack("XGRANM"))
ActionOverride("XGASSF",Kill("XGRANM"))
Wait(3)~ EXIT
END

IF ~~ THEN BEGIN 19
  SAY @11
  IF ~~ THEN REPLY @12 GOTO 20
END

IF ~~ THEN BEGIN 20
  SAY @13
  IF ~~ THEN REPLY @14 GOTO 21
END

IF ~~ THEN BEGIN 21
  SAY @15
  IF ~~ THEN REPLY @18 DO ~RevealAreaOnMap("XG0060")
AddJournalEntry(@51220,QUEST)
Wait(1)
CreateCreature("XGASSF",[337.282],10)
DisplayString("XGASSF",@17)
ActionOverride("XGASSF",Attack("XGRANM"))
ActionOverride("XGASSF",Kill("XGRANM"))
Wait(3)~ EXIT
END

IF ~NumTimesTalkedTo(1)~ THEN BEGIN 22
  SAY @19
  IF ~~ THEN REPLY @5 GOTO 23
END

IF ~~ THEN BEGIN 23
  SAY @11
  IF ~~ THEN REPLY @12 GOTO 24
END

IF ~~ THEN BEGIN 24
  SAY @13
  IF ~~ THEN REPLY @14 GOTO 25
END

IF ~~ THEN BEGIN 25
  SAY @15
  IF ~~ THEN REPLY @18 DO ~RevealAreaOnMap("XG0060")
AddJournalEntry(@51220,QUEST)
Wait(1)
CreateCreature("XGASSF",[337.282],10)
DisplayString("XGASSF",@17)
ActionOverride("XGASSF",Attack("XGRANM"))
ActionOverride("XGASSF",Kill("XGRANM"))
Wait(3)~ EXIT
END

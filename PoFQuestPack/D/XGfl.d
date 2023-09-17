BEGIN ~XGfl~

IF ~See([PC])
NumTimesTalkedTo(0)
Global("TalkToXGdrc","GLOBAL",1)~ THEN BEGIN 0
  SAY @0
  IF ~~ THEN REPLY @1 GOTO 1
  IF ~~ THEN REPLY @2 DO ~SetGlobal("TalkToXGdrc","GLOBAL",2)
	Enemy()
	ChangeEnemyAlly("XGTWR",ENEMY)
	ChangeEnemyAlly("XGTDR",ENEMY)
	ChangeEnemyAlly("XGTDRQ",ENEMY)
	ChangeEnemyAlly("XGTWR1",ENEMY)
	ChangeEnemyAlly("XGTWRC",ENEMY)
	ChangeEnemyAlly("XGDRC",ENEMY)
	ChangeEnemyAlly("CDryad",ENEMY)
    EraseJournalEntry(@50300)
    EraseJournalEntry(@50301)
    EraseJournalEntry(@50302)
    EraseJournalEntry(@50303)
	AddJournalEntry(@50310,QUEST_DONE)~ EXIT
END

IF ~~ THEN BEGIN 1
  SAY @8
  IF ~~ THEN REPLY @9 DO ~SetGlobal("TalkToXGdrc","GLOBAL",2)
	StartCutSceneMode()
	BattleSong()
	CreateCreature("XGtmer7",[1330.171],14)
	CreateCreature("XGtmer8",[1327.255],14)
	CreateCreature("XGtmer9",[1328.319],14)
	CreateCreature("XGtass",[1357.268],14)
	ActionOverride(Player1,MoveToPoint([1463.329]))
	Wait(5)
	DisplayStringHead("XGtass",@10)
	EndCutSceneMode()
	AddJournalEntry(@50304,QUEST)~ EXIT
END

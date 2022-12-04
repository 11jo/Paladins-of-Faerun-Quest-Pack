BEGIN ~XGNWNLG~

IF ~  NumberOfTimesTalkedTo(0)
~ THEN BEGIN 0
  SAY @0
  IF ~  Class(Player1,FIGHTER_ALL)
~ THEN REPLY @1 DO ~GiveItemCreate("PLAT1MOD",Player1,0,0,0)
GiveItemCreate("GLAVE01",Player1,0,0,0)
GiveItemCreate("SW1H02",Player1,0,0,0)
GiveItemCreate("SHLD04",Player1,0,0,0)
GiveItemCreate("POTN52",Player1,5,0,0)
GiveItemCreate("MISC07",Player1,500,0,0)
SetNumTimesTalkedTo(1)~ GOTO 1
  IF ~  Class(Player1,MAGE_ALL)
~ THEN REPLY @2 DO ~GiveItemCreate("POTN52",Player1,5,0,0)
GiveItemCreate("CLCK1MOD",Player1,0,0,0)
GiveItemCreate("STAF02",Player1,0,0,0)
GiveItemCreate("DAGG02",Player1,0,0,0)
GiveItemCreate("WAND03",Player1,0,0,0)
GiveItemCreate("MISC07",Player1,500,0,0)
SetNumTimesTalkedTo(1)~ GOTO 1
  IF ~  Class(Player1,CLERIC_ALL)
~ THEN REPLY @3 DO ~GiveItemCreate("POTN52",Player1,5,0,0)
GiveItemCreate("LEAT1MOD",Player1,0,0,0)
GiveItemCreate("BLUN05",Player1,0,0,0)
GiveItemCreate("SHLD04",Player1,0,0,0)
GiveItemCreate("BLUN07",Player1,0,0,0)
GiveItemCreate("MISC07",Player1,500,0,0)
SetNumTimesTalkedTo(1)~ GOTO 1
  IF ~  Class(Player1,THIEF_ALL)
~ THEN REPLY @4 DO ~GiveItemCreate("POTN52",Player1,5,0,0)
GiveItemCreate("LEAT1MOD",Player1,0,0,0)
GiveItemCreate("SW1H08",Player1,0,0,0)
GiveItemCreate("BOW06",Player1,0,0,0)
GiveItemCreate("AROW02",Player1,40,0,0)
GiveItemCreate("AROW02",Player1,40,0,0)
GiveItemCreate("MISC07",Player1,500,0,0)
SetNumTimesTalkedTo(1)~ GOTO 1
  IF ~  Class(Player1,BARD_ALL)
~ THEN REPLY @5 DO ~GiveItemCreate("POTN52",Player1,5,0,0)
GiveItemCreate("LEAT1MOD",Player1,0,0,0)
GiveItemCreate("SW1H44",Player1,0,0,0)
GiveItemCreate("FALCH02",Player1,0,0,0)
GiveItemCreate("MISC07",Player1,500,0,0)
SetNumTimesTalkedTo(1)~ GOTO 1
  IF ~  Class(Player1,PALADIN_ALL)
~ THEN REPLY @6 DO ~GiveItemCreate("POTN52",Player1,5,0,0)
GiveItemCreate("PLAT1MOD",Player1,0,0,0)
GiveItemCreate("BSWORD02",Player1,0,0,0)
GiveItemCreate("SW1H05",Player1,0,0,0)
GiveItemCreate("SHLD04",Player1,0,0,0)
GiveItemCreate("MISC07",Player1,500,0,0)
SetNumTimesTalkedTo(1)~ GOTO 1
  IF ~  Class(Player1,DRUID_ALL)
~ THEN REPLY @7 DO ~GiveItemCreate("POTN52",Player1,5,0,0)
GiveItemCreate("LEAT1MOD",Player1,0,0,0)
GiveItemCreate("STAF06",Player1,0,0,0)
GiveItemCreate("BOOT01",Player1,0,0,0)
GiveItemCreate("MISC07",Player1,500,0,0)
SetNumTimesTalkedTo(1)~ GOTO 1
  IF ~  Class(Player1,RANGER_ALL)
~ THEN REPLY @8 DO ~GiveItemCreate("POTN52",Player1,5,0,0)
GiveItemCreate("LEAT1MOD",Player1,0,0,0)
GiveItemCreate("SW1H02",Player1,0,0,0)
GiveItemCreate("BOW04",Player1,0,0,0)
GiveItemCreate("AROW02",Player1,40,0,0)
GiveItemCreate("AROW02",Player1,40,0,0)
GiveItemCreate("AROW02",Player1,40,0,0)
GiveItemCreate("MISC07",Player1,500,0,0)
SetNumTimesTalkedTo(1)~ GOTO 1
  IF ~  Class(Player1,SORCERER)
~ THEN REPLY @9 DO ~GiveItemCreate("POTN52",Player1,5,0,0)
GiveItemCreate("CLCK1MOD",Player1,0,0,0)
GiveItemCreate("STAF02",Player1,0,0,0)
GiveItemCreate("DAGG02",Player1,0,0,0)
GiveItemCreate("WAND03",Player1,0,0,0)
GiveItemCreate("MISC07",Player1,500,0,0)
SetNumTimesTalkedTo(1)~ GOTO 1
  IF ~  Class(Player1,MONK)
~ THEN REPLY @10 DO ~GiveItemCreate("POTN52",Player1,5,0,0)
GiveItemCreate("IK02",Player1,0,0,0)
GiveItemCreate("MISC07",Player1,500,0,0)
SetNumTimesTalkedTo(1)~ GOTO 1
END

IF ~NumTimesTalkedTo(1)~ THEN BEGIN 1
  SAY @11
  IF ~~ THEN DO ~SetNumTimesTalkedTo(1)~ EXIT
END
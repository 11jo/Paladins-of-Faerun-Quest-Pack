BEGIN ~XGPALW~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 1
  SAY @1637
  IF ~~ THEN DO ~SetGlobal("XGPALW_MINSCJ","XG0702",2)~ EXIT
  IF ~InMyArea("Minsc") InParty("Minsc") !StateCheck("Minsc",CD_STATE_NOTVALID)~ THEN EXTERN MINSCJ XGPALW_MINSCJ
END

APPEND MINSCJ

IF ~Global("XGPALW_MINSCJ","XG0702",1)~ THEN BEGIN XGPALW_MINSCJ
  SAY @1639
  IF ~~ THEN DO ~SetGlobal("XGPALW_MINSCJ","XG0702",2)~ EXIT
END
	END

/*
OpenState("DOOR04",TRUE)
CloseDoor("DOOR02")
OpenDoor("DOOR02")

Nous pouvons emprunter le passsage, j'attendrais prêt du pont levis que vous enclenchier son mécanisme.
*/

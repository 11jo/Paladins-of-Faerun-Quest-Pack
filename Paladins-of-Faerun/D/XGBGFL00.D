BEGIN ~XGBGFL00~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
  SAY @1 /* Bien le bonjour, quel bon vent vous amène dans notre cité ? */
  IF ~~ THEN REPLY @2 /* C'est pas vos oignions ! */ GOTO 1
  IF ~AreaCheck("BG0200")~ THEN REPLY @3 /* J'ai des comptes à régler. */ GOTO 3
  IF ~AreaCheck("XG0020")~ THEN REPLY @3 /* J'ai des comptes à régler. */ GOTO 4
  IF ~~ THEN REPLY @4 /* Quel question, l'aventure évidemment... */ GOTO 3
END

IF ~~ THEN BEGIN 1
  SAY @5 /* Votre tête me dit quelque chose, vous seriez pas recherché par hasard ? */
  IF ~~ THEN REPLY @6 /* Moi recherché/e, ha ha, non bien sûr... Aller, bonne journée à vous. */ GOTO 2
END

IF ~~ THEN BEGIN 2
  SAY @7 /* Pas d'entourloupe citoyen / citoyenne */
  IF ~~ THEN DO ~SetGlobal("XGBGF1_HUM","MYAREA",0)~ EXIT
END

IF ~~ THEN BEGIN 3
  SAY @8 /* Si vous avez des contentieux à régler, allez donc solliciter le chef de la garnison au sous sol du palais Ducal. */
  IF ~!Global("XGBGF1_HUM","MYAREA",1)~ THEN REPLY @9 /* Pas de pugilat, message reçu. Avez vous d'autres informations sur les affaires de la ville ? */ DO ~SetGlobal("XGBGF1_HUM","MYAREA",1)~ GOTO 5
  IF ~Global("XGBGF1_HUM","MYAREA",1)~ THEN REPLY @9 /* Pas de pugilat, message reçu. Avez vous d'autres informations sur les affaires de la ville ? */ GOTO 1
  IF ~~ THEN REPLY @10 /* Ne vous enflammez pas, il est temps pour moi de partir. Au revoir. */ GOTO 2
END

IF ~~ THEN BEGIN 4
  SAY @11 /* Si vous avez des contentieux à régler, allez donc solliciter le chef de la garnison, son poste de garde a été installé dans une maison aux abords du palais. */
  IF ~!Global("XGBGF1_HUM","MYAREA",1)~ THEN REPLY @9 /* Pas de pugilat, message reçu. Avez vous d'autres informations sur les affaires de la ville ? */ DO ~SetGlobal("XGBGF1_HUM","MYAREA",1)~ GOTO 5
  IF ~Global("XGBGF1_HUM","MYAREA",1)~ THEN REPLY @9 /* Pas de pugilat, message reçu. Avez vous d'autres informations sur les affaires de la ville ? */ GOTO 1
  IF ~~ THEN REPLY @10 /* Ne vous enflammez pas, il est temps pour moi de partir. Au revoir. */ GOTO 2
END

IF ~~ THEN BEGIN 5
  SAY @12 /* Si vous cherchez l'aventure, le magicien Elorin qui vient de prendre ses quartier dans la tour de Ramazith n’arrête pas de solliciter le poing enflammé au sujet d'une quête de grande importance... Enfin pour lui... */
  IF ~AreaCheck("BG0200")!Global("XGBGF1_HUM","MYAREA",1)~ THEN REPLY @13 /* J'irais rencontrer ce magicien dés que possible. Avez vous d'autres informations sur les affaires de la ville ? */ DO ~SetGlobal("XGBGF1_HUM","MYAREA",1)~ GOTO 3 
  IF ~AreaCheck("XG0020")!Global("XGBGF1_HUM","MYAREA",1)~ THEN REPLY @13 /* J'irais rencontrer ce magicien dés que possible. Avez vous d'autres informations sur les affaires de la ville ? */ DO ~SetGlobal("XGBGF1_HUM","MYAREA",1)~ GOTO 4 
  IF ~Global("XGBGF1_HUM","MYAREA",1)~ THEN REPLY @13 /* J'irais rencontrer ce magicien dés que possible. Avez vous d'autres informations sur les affaires de la ville ? */ GOTO 1
  IF ~~ THEN REPLY @10 /* Ne vous enflammez pas, il est temps pour moi de partir. Au revoir. */ GOTO 2
END

IF ~!NumTimesTalkedTo(0)~ THEN BEGIN 0
  SAY @14 /* Vous revoilà, vous avez besoin de quelque chose ? */
  IF ~~ THEN REPLY @15 /* Avez vous d'autres informations sur les affaires de la ville ? */ GOTO 5
  IF ~~ THEN REPLY @10 /* Ne vous enflammez pas, il est temps pour moi de partir. Au revoir. */ GOTO 2
END

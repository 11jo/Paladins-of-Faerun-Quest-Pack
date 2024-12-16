BEGIN ~XGBGFL00~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
  SAY @1 /* Bien le bonjour, quel bon vent vous amène dans notre cité ? */
  IF ~~ THEN REPLY @2 /* C'est pas vos oignions ! */ GOTO 1
  IF ~AreaCheck("BG0200")~ THEN REPLY @3 /* J'ai des comptes à régler. */ DO ~SetGlobal("XGBGF1_HUM","LOCALS",1)~ GOTO 3
  IF ~AreaCheck("XG0020")~ THEN REPLY @3 /* J'ai des comptes à régler. */ DO ~SetGlobal("XGBGF1_HUM","LOCALS",1)~ GOTO 4
  IF ~~ THEN REPLY @4 /* Quel question, l'aventure évidemment... */ DO ~SetGlobal("XGBGF1_HUM","LOCALS",1)~ GOTO 5
  IF ~~ THEN REPLY @33 /* Une mission de la plus grande importance ! */ DO ~SetGlobal("XGBGF1_HUM","LOCALS",1)~ GOTO 16
END

IF ~~ THEN BEGIN 1
  SAY @5 /* Votre tête me dit quelque chose, vous seriez pas recherché par hasard ? */
  IF ~~ THEN REPLY @6 /* Moi recherché/e, ha ha, non bien sûr... Aller, bonne journée à vous. */ GOTO 2
END

IF ~~ THEN BEGIN 2
  SAY @7 /* Pas d'entourloupe citoyen / citoyenne */
  IF ~!Range("XGBGG",6)~ THEN DO ~SetGlobal("XGBGF1_HUM","LOCALS",0)~ EXIT
  IF ~Range("XGBGG",7)~ THEN DO ~SetGlobal("XGBGF1_HUM","LOCALS",0)~ GOTO 17
END

IF ~~ THEN BEGIN 3
  SAY @8 /* Si vous avez des contentieux à régler, allez donc solliciter le chef de la garnison au sous sol du palais Ducal. */
  IF ~!Global("XGBGF1_HUM","LOCALS",1)~ THEN REPLY @9 /* Pas de pugilat, message reçu. Avez vous d'autres informations sur les affaires de la ville ? */ DO ~SetGlobal("XGBGF1_HUM","LOCALS",1)~ GOTO 5
  IF ~Global("XGBGF1_HUM","LOCALS",1)~ THEN REPLY @9 /* Pas de pugilat, message reçu. Avez vous d'autres informations sur les affaires de la ville ? */ GOTO 1
  IF ~~ THEN REPLY @10 /* Ne vous enflammez pas, il est temps pour moi de partir. Au revoir. */ GOTO 2
END

IF ~~ THEN BEGIN 4
  SAY @11 /* Si vous avez des contentieux à régler, allez donc solliciter le chef de la garnison, son poste de garde a été installé dans une maison aux abords du palais. */
  IF ~!Global("XGBGF1_HUM","LOCALS",1)~ THEN REPLY @9 /* Pas de pugilat, message reçu. Avez vous d'autres informations sur les affaires de la ville ? */ DO ~SetGlobal("XGBGF1_HUM","LOCALS",1)~ GOTO 5
  IF ~Global("XGBGF1_HUM","LOCALS",1)~ THEN REPLY @9 /* Pas de pugilat, message reçu. Avez vous d'autres informations sur les affaires de la ville ? */ GOTO 1
  IF ~~ THEN REPLY @10 /* Ne vous enflammez pas, il est temps pour moi de partir. Au revoir. */ GOTO 2
END

IF ~~ THEN BEGIN 5
  SAY @12 /* Si vous cherchez l'aventure, le magicien Elorin qui vient de prendre ses quartier dans la tour de Ramazith n’arrête pas de solliciter le poing enflammé au sujet d'une quête de grande importance... Enfin pour lui... */
  IF ~AreaCheck("BG0200")!Global("XGBGF1_HUM","LOCALS",1)~ THEN REPLY @13 /* J'irais rencontrer ce magicien dés que possible. Avez vous d'autres informations sur les affaires de la ville ? */ DO ~SetGlobal("XGBGF1_HUM","LOCALS",1)~ GOTO 3 
  IF ~AreaCheck("XG0020")!Global("XGBGF1_HUM","LOCALS",1)~ THEN REPLY @13 /* J'irais rencontrer ce magicien dés que possible. Avez vous d'autres informations sur les affaires de la ville ? */ DO ~SetGlobal("XGBGF1_HUM","LOCALS",1)~ GOTO 4 
  IF ~Global("XGBGF1_HUM","LOCALS",1)~ THEN REPLY @13 /* J'irais rencontrer ce magicien dés que possible. Avez vous d'autres informations sur les affaires de la ville ? */ GOTO 1
  IF ~~ THEN REPLY @10 /* Ne vous enflammez pas, il est temps pour moi de partir. Au revoir. */ GOTO 2
END

IF ~OR(2)
Global("XGBGG_Missing","GLOBAL",1)
Global("XGBGG_Missing","GLOBAL",2)~ THEN BEGIN 7
  SAY @16 /* La fille d'une sommité du Poing Enflammé a été enlevée, il semble que les malfrats à l'origine des nombreux meurtres cherchent un moyen de bloquer nos investigation. */
  IF ~~ THEN REPLY @17 /* C'est terrible ! Que pouvons nous faire ? */ GOTO 8
  IF ~~ THEN REPLY @18 /* J'en ai vraiment rien à faire... */ GOTO 9
  IF ~~ THEN REPLY @19 /* Comment se nomme cette enfant ? */ GOTO 10
END

IF ~~ THEN BEGIN 8
  SAY @20 /* Notre champ d'action est limité, mais vous, vous n'êtes pas vraiment affilié au Poing Enflammé. Persévérez dans votre enquête et retrouvez cette innocente ! */
  IF ~~ THEN REPLY @21 /* Très bien, la piste actuelle mène aux personnels travaillant dans les quartiers du Duc Opas au Palais Ducal. */ GOTO 12
  IF ~~ THEN REPLY @22 /* Après réflexion, je n'en ai vraiment rien à faire... */ GOTO 9
END

IF ~~ THEN BEGIN 10
  SAY @23 /* Rohma... Rohma Corwin. */
  IF ~~ THEN REPLY @24 /* Je vois... */ GOTO 8
END

IF ~~ THEN BEGIN 9
  SAY @25 /* Votre indifférence se retournera contre vous. Nous n'avons plus rien à nous dire. */
  IF ~~ THEN DO ~SetGlobal("XGBGG_Missing","GLOBAL",9)~ EXIT
END

IF ~~ THEN BEGIN 12
  SAY @26 /* Merci, je vous souhaite bonne chance. */
  IF ~~ THEN DO ~SetGlobal("XGBGG_Missing","GLOBAL",3)~ EXIT
END

IF ~Global("XGBGG_Missing","GLOBAL",9)~ THEN BEGIN 11
  SAY @27 /* Nous n'avons plus rien à nous dire. */
  IF ~~ THEN EXIT
END

IF ~Global("XGBGG_Missing","GLOBAL",4) !Dead("XGBGG")~ THEN BEGIN 13
  SAY @28 /* Vous avez ramené l'enfant saine et sauve. Merci ! */
  IF ~~ THEN REPLY @15 DO ~AddexperienceParty(1000) SetGlobal("XGBGG_Missing","GLOBAL",5)~ /* Avez vous d'autres informations sur les affaires de la ville ? */ GOTO 5
  IF ~~ THEN REPLY @10 DO ~AddexperienceParty(1000) SetGlobal("XGBGG_Missing","GLOBAL",5)~ /* Ne vous enflammez pas, il est temps pour moi de partir. Au revoir. */ GOTO 2
END

IF ~Global("XG1120_XG0020","GLOBAL",2)
OR(3)
Global("XGBGG_Missing","GLOBAL",8)
Dead("XGBGG")
Global("XGBGG_Missing","GLOBAL",3)~ THEN BEGIN 14
  SAY @29 /* Vous avez laissé l'enfant livrée à elle même dans un repaire de meurtriers, à quoi vous attendiez vous... */
  IF ~~ THEN DO ~ReputationInc(-3)~ GOTO 9
END

/*
IF ~Global("s#XGELOR","LOCALS",4)
!Global("XGBGG_Missing","GLOBAL",8)
!Dead("XGBGG")~ THEN BEGIN 15
  SAY @30 /* <CHARNAME> ! Nice to see you ! */
  IF ~~ THEN EXIT
END
*/

IF ~~ THEN BEGIN 16
  SAY @31 /* Le Duc Opas est très en vogue ces derniers temps, il s'occupe de toutes les affaires importantes. */
  IF ~!Global("XGBGF1_HUM","LOCALS",1)~ THEN REPLY @32 /* Hum, Les Ducs de la Porte de Baldur sont comme des girouettes. Avez vous d'autres informations sur les affaires de la ville ? */ DO ~SetGlobal("XGBGF1_HUM","LOCALS",1)~ GOTO 5 
  IF ~Global("XGBGF1_HUM","LOCALS",1)~ THEN REPLY @32 /* Hum, Les Ducs de la Porte de Baldur sont comme des girouettes. Avez vous d'autres informations sur les affaires de la ville ? */ GOTO 1
  IF ~~ THEN REPLY @10 /* Ne vous enflammez pas, il est temps pour moi de partir. Au revoir. */ GOTO 2
END

IF ~~ THEN BEGIN 17
  SAY @34 /* C'est aussi valable pour toi, Rohma */
  IF ~~ THEN DO ~SetGlobal("XGBGG_XGBGFL00","MYAREA",1)~ EXIT
END

IF ~!NumTimesTalkedTo(0)~ THEN BEGIN 6
  SAY @14 /* Vous revoilà, vous avez besoin de quelque chose ? */
  IF ~~ THEN REPLY @15 /* Avez vous d'autres informations sur les affaires de la ville ? */ GOTO 16
  IF ~~ THEN REPLY @10 /* Ne vous enflammez pas, il est temps pour moi de partir. Au revoir. */ GOTO 2
END


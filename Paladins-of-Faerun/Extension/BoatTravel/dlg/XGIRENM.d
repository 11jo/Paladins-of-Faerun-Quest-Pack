BEGIN ~XGIRENM~

IF ~AreaCheck("AR0900")
	!Global("XG1319_XGELVCD","GLOBAL",1)~ THEN BEGIN 1
  SAY @1 /*~Oups !~*/
  IF ~~ THEN DO ~GiveItemCreate("POTN10",Myself,1,0,0)
Wait(1)
UseItem("POTN10",Myself)~ EXIT
END



CHAIN IF ~AreaCheck("AR0900")
	Global("XG1319_XGELVCD","GLOBAL",1)~ THEN XGIRENM 2
@2 /*~~*/
== IMOEN2J IF ~InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID)~ THEN @10001 /* ~Silence !~ */
== XGIRENMIF ~InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID)~ THEN @10001 /* ~Silence !~ */
== JAHEIRAJ IF ~InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID) InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @10001 /* ~Silence !~ */
== XGIRENM IF ~InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID) InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @10001 /* ~Silence !~ */
== XGIRENM IF ~InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID) !InParty("Jaheira")~ THEN @10001 /* ~Silence !~ */
END
		+ ~InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID~ + @56 /*~Monstre ! Ton heure est venue !~*/ + XGIRENM3
		+ ~InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID) InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ + @57 /*~Que décides-tu Jaheira ?~*/ + XGIRENM4
		+ ~InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID)~ + @57 /*~Imoen, que peux tu nous dire sur cette magicienne ?~*/ + XGIRENM5
		+ ~!InParty("Imoen2")~ + @56 /*~Le prêtre "" m'envoie.~*/ + XGIRENM6


CHAIN IF ~~ THEN XGIRENM XGIRENM3
@2 /*~N'aviez vous pas une raison de m'aborder avant que la rouquine ne me reconnaisse ?~*/
== JAHEIRAJ IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @10001 /* ~~ */
== IMOEN2J @55 /*~~ */
== XGIRENM IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @10001 /* ~~ */
END
		++ @56 /*~Je me moque d'Elenar... Khalid sera vengé !.~*/ DO ~SetGlobal("XG1319_XGELVCD","GLOBAL",2)~ EXIT
		++ @57 /*~Très bien, mais ce n'est que partie remise.~*/ + XGIRENM7


CHAIN IF ~~ THEN JAHEIRAJ XGIRENM4
@2 /*~~*/
== XGIRENM  @10001 /* ~N'aviez vous pas une raison de m'aborder avant que la rouquine ne me reconnaisse ?~ */
== IMOEN2J @55 /*~~ */
== JAHEIRAJ @10001 /* ~Non Imoen, Khalid... Mon Khalid souhaiterait que nous aidions Elenar même si cela implique de laisser cette... Femme vivre.~ */
== XGIRENM  @10001 /* ~Surprenant... Comme le fut ce Khalid dans ces derniers instants.~ */ EXTERN XGIRENM XGIRENM7


CHAIN IF ~~ THEN IMOEN2J XGIRENM5
@2 /*~Très peu, elle était présente lors de l'interrogatoire de Khalid, je crois que l'abominable Irenicus n'était pas rassuré face à notre ami...~*/
== XGIRENM  @10001 /* ~En effet et sa combativité lui a donné raison.~ */
== IMOEN2J @55 /*~Silence !~ */
== XGIRENM  @10001 /* ~Ne vous méprenez pas jeune fille, qu'est ce qui vous fait croire que j'étais là de mon plein grès, alors que vous même étiez prisonnière. Ne vous a t'il pas forcé à faire...~ */
== IMOEN2J IF ~!InParty("Jaheira")~ THEN @10001 /*~Tu sous entends que ce n'est pas par ta volonté que notre ami a péris ?~ */
== JAHEIRAJ IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @10001 /* ~Tu sous entends que ce n'est pas par ta volonté que mon époux a péris ?~ */
== XGIRENM IF ~!InParty("Jaheira")~ THEN @10001 /*~En partie, mais j'aurais pu réagir différemment... Moins drastiquement.~ */
== XGIRENM  IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @10001 /* ~Ne vous méprenez pas non plus, j'aurais pu réagir différemment... Moins drastiquement.~ */
== JAHEIRAJ IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @10001 /* ~Tais-toi... Tais-toi ou je ne pourrais plus contenir ma haine.~ */
== IMOEN2J IF ~!InParty("Jaheira")~ THEN @10001 /*~Tais-toi... Tais-toi ou je ne pourrais plus contenir ma colère.~ */ EXTERN XGIRENM XGIRENM7

CHAIN IF ~~ THEN XGIRENM XGIRENM7
@2 /*~~*/
END
		++ /*~Le prêtre "" m'envoie.~*/ + XGIRENM6


CHAIN IF ~~ THEN XGIRENM XGIRENM6
@2 /*~Je vois, j'ai en effet mes raisons de m'intéresser à la nécromancie.~*/
== XGIRENM  IF ~InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID)~ THEN @10001 /* ~Mais en échange de mon aide, vous devrez remettre votre vengeance à plus tard.~ */
== IMOEN2J IF ~InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID)~ THEN @10001 /* ~Silence !~ */
== XGIRENM  @10001 /* ~~ */
== JAHEIRAJ IF ~InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID) InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @10001 /* ~~ */ 
== XGIRENM  @10001 /* ~~ */
== JAHEIRAJ IF ~InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID) InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @10001 /* ~~ */ 
== XGIRENM  @10001 /* ~~ */
END
		+ ~InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID)~ + @56 /*~Je me moque d'Elenar... Khalid sera vengé !.~*/ DO ~SetGlobal("XG1319_XGELVCD","GLOBAL",2)~ EXIT
		+ ~InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID)~ + @57 /*~Nous nous reverrons et ce jour là de simples excuses ne suffirons pas...~*/ EXIT
		+ ~!InParty("Imoen2")~ + @57 /*~Merci pour votre aide.~*/ EXIT

// Générique DLG for générique pnj


//  WRITE_ASCII 0x2cc ~JODLGHN~ (8) // DLG

/*
// Homme standard

#4900  = ~Ma femme m'a chauffé les oreilles.~ [MTOWN04]
#11086  = ~Parlez plus fort, plus fort !~ [GENMG09]
#11091  = ~Euh... Vous avez quelque chose en tête ?~ [GENMG11]
#11092  = ~Ouais, cop' ?~ [GENMG12]
#11094  = ~Ciao.~ [GENMG14]
#11095 = ~Salut, toi !~ [GENMG15]
#11081  = ~Vous avez besoin de quelque chose ?~ [GENMG04]
#11084  = ~Vous disiez ?~ [GENMG07]
#11077  = ~Oui ?~ [GENMG01]
#11079  = ~Hein ?~ [GENMG03]
#11231  = ~Hé, hé ! Hors de mon chemin, espèce de vieux bûcheron desséché ! Ha ha !~ [MTOWN01] ~Hé, hé ! Hors de mon chemin, espèce de vieille bûcheronne desséchée ! Ha ha !~ [MTOWN01]
#11078  = ~Que désirez-vous ?~ [GENMG02]
#11082  = ~Bonjour la compagnie.~ [GENMG05]
#11083  = ~Salut, camarade.~ [GENMG06]
#11085  = ~Salut.~ [GENMG08]


// Homme ennemi

#11096  = ~Toutes mes excuses, mais je crains d'avoir à vous tuer.~ [GENMT01]
#11097  = ~Vous l'aurez bien cherché, cop'. Attendez voir...~ [GENMT02]
#11098  = ~J'ai une lame avec votre nom dessus.~ [GENMT03]
#11099  = ~Votre fin est proche, on parie ?~ [GENMT04]
#11101  = ~Mes excuses, mais vous avez rendez-vous avec la mort.~ [GENMT05]
#11102  = ~Je vais vous écrabouiller la tête ! Vous allez voir, je vais vous faire votre affaire !~ [GENMT06]
#11103  = ~Je préférerais qu'on arrête les bavardages et qu'on passe au carnage.~ [GENMT07]
#11104  = ~À votre place, je prendrais la poudre d'escampette.~ [GENMT08]
#11105  = ~Craignez mon courroux, car il est grand en effet !~ [GENMT09]
#11106  = ~Allez, dégainez vos épées et vos sorts et passons aux choses sérieuses, hein !~ [GENMT10]
*/

BEGIN ~JODLGHN~  // Man neutral

IF ~RandomNum(15,1)~ THEN BEGIN 0
  SAY #4900 /* Ma femme m'a chauffé les oreilles.~ [MTOWN04] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(15,2)~ THEN BEGIN 1
  SAY #11086 /* Parlez plus fort, plus fort !~ [GENMG09] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(15,3)~ THEN BEGIN 2
  SAY #11091 /* Euh... Vous avez quelque chose en tête ?~ [GENMG11] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(15,4)~ THEN BEGIN 3
  SAY #11092 /* Ouais, cop' ?~ [GENMG12] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(15,5)~ THEN BEGIN 4
  SAY #11094 /* Ciao.~ [GENMG14] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(15,6)~ THEN BEGIN 5
  SAY #11095 /* Salut, toi !~ [GENMG15] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(15,7)~ THEN BEGIN 6
  SAY #11081 /* Vous avez besoin de quelque chose ?~ [GENMG04] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(15,8)~ THEN BEGIN 7
  SAY #11084 /* Vous disiez ?~ [GENMG07] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(15,9)~ THEN BEGIN 8
  SAY #11077 /* Oui ?~ [GENMG01] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(15,10)~ THEN BEGIN 9
  SAY #11079 /* Hein ?~ [GENMG03] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(15,11)~ THEN BEGIN 10
  SAY #11231 /* Hé, hé ! Hors de mon chemin, espèce de vieux bûcheron desséché ! Ha ha !~ [MTOWN01] ~Hé, hé ! Hors de mon chemin, espèce de vieille bûcheronne desséchée ! Ha ha !~ [MTOWN01] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(15,12)~ THEN BEGIN 11
  SAY #11078 /* Que désirez-vous ?~ [GENMG02] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(15,13)~ THEN BEGIN 12
  SAY #11082 /* Bonjour la compagnie.~ [GENMG05] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(15,14)~ THEN BEGIN 13
  SAY #11083 /* Salut, camarade.~ [GENMG06] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(15,15)~ THEN BEGIN 14
  SAY #11085 /* Salut.~ [GENMG08] */
  IF ~~ THEN EXIT
END

//////////////////////////////////////////////////////////////////

BEGIN ~JODLGHH~   // Man hostile

IF ~RandomNum(10,1)~ THEN BEGIN 0
  SAY #11096 /* Toutes mes excuses, mais je crains d'avoir à vous tuer.~ [GENMT01] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(10,2)~ THEN BEGIN 1
  SAY #11097 /* Vous l'aurez bien cherché, cop'. Attendez voir...~ [GENMT02] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(10,3)~ THEN BEGIN 2
  SAY #11098 /* J'ai une lame avec votre nom dessus.~ [GENMT03] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(10,4)~ THEN BEGIN 3
  SAY #11099 /* Votre fin est proche, on parie ?~ [GENMT04] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(10,5)~ THEN BEGIN 4
  SAY #11101 /* Mes excuses, mais vous avez rendez-vous avec la mort.~ [GENMT05] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(10,6)~ THEN BEGIN 5
  SAY #11102 /* Je vais vous écrabouiller la tête ! Vous allez voir, je vais vous faire votre affaire !~ [GENMT06] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(10,7)~ THEN BEGIN 6
  SAY #11103 /* Je préférerais qu'on arrête les bavardages et qu'on passe au carnage.~ [GENMT07] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(10,8)~ THEN BEGIN 7
  SAY #11104 /* À votre place, je prendrais la poudre d'escampette.~ [GENMT08] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(10,9)~ THEN BEGIN 8
  SAY #11105 /* Craignez mon courroux, car il est grand en effet !~ [GENMT09] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(10,10)~ THEN BEGIN 9
  SAY #11106 /* Allez, dégainez vos épées et vos sorts et passons aux choses sérieuses, hein !~ [GENMT10] */
  IF ~~ THEN EXIT
END

/*
// Femme standard

#11110  = ~Ciao.~ [GENFG03]
#11111  = ~Hé là, camarade.~ [GENFG04]
#11112  = ~Oui, camarade ?~ [GENFG05]
#11113  = ~Puis-je vous aider ?~ [GENFG06]
#11114  = ~Besoin de quelque chose ?~ [GENFG07]
#11115  = ~Bienvenue.~ [GENFG08]
#11116  = ~Enchantée de faire votre connaissance.~ [GENFG09]
#11117  = ~Salutations.~ [GENFG10]
#11118  = ~Oui ?~ [GENFG11]
#11119  = ~Bonjour la compagnie.~ [GENFG12]
#11120  = ~Comment ça va ?~ [GENFG13]
#11121  = ~Qu'est-ce que vous avez à raconter ?~ [GENFG14]
#11122  = ~Quoi ?~ [GENFG15]

// Femme ennemi

#11123  = ~Ça peut paraître indigne d'une dame mais je vais vous égorger ! Vous allez voir ça !~ [GENFT01]
#11124  = ~On dirait bien que je vais vous achever sur place, et tout et tout.~ [GENFT02]
#11125  = ~'Feriez mieux de faire la paix avec vos démons, avant que j'vous envoie les rejoindre.~ [GENFT03]
#11126  = ~Vot' fin sera rapide, si vous vous laissez faire...~ [GENFT04]
#11127  = ~J'suis d'avis que vous mangerez les pissenlits par la racine avant la fin de la nuit.~ [GENFT05]
#11128  = ~Vot' vie n'a aucun intérêt pour moi.~ [GENFT06]
#11129  = ~Vos cris seront doux à mes oreilles.~ [GENFT07]
#11130  = ~Vous s'rez plus de ce monde quand j'en aurai fini avec vous !~ [GENFT08]
#11131  = ~J'vais vous écraser !~ [GENFT09]
#11132  = ~Z'allez crever ! J'vais m'en assurer !~ [GENFT10]
*/

//////////////////////////////////////////////////////////////////

BEGIN ~JODLGWN~  // Woman neutral

IF ~RandomNum(13,1)~ THEN BEGIN 0
  SAY #11110 /* ~Ciao.~ [GENFG03] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(13,2)~ THEN BEGIN 1
  SAY #11111 /* ~Hé là, camarade.~ [GENFG04] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(13,3)~ THEN BEGIN 2
  SAY #11112 /* ~Oui, camarade ?~ [GENFG05] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(13,4)~ THEN BEGIN 3
  SAY #11113 /* ~Puis-je vous aider ?~ [GENFG06] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(13,5)~ THEN BEGIN 4
  SAY #11114 /* ~Besoin de quelque chose ?~ [GENFG07] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(13,6)~ THEN BEGIN 5
  SAY #11115 /* ~Bienvenue.~ [GENFG08] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(13,7)~ THEN BEGIN 6
  SAY #11116 /* ~Enchantée de faire votre connaissance.~ [GENFG09] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(13,8)~ THEN BEGIN 7
  SAY #11117 /* ~Salutations.~ [GENFG10] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(13,9)~ THEN BEGIN 8
  SAY #11118 /* ~Oui ?~ [GENFG11] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(13,10)~ THEN BEGIN 9
  SAY #11119 /* ~Bonjour la compagnie.~ [GENFG12] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(13,11)~ THEN BEGIN 10
  SAY #11120 /* ~Comment ça va ?~ [GENFG13] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(13,12)~ THEN BEGIN 11
  SAY #11121 /* ~Qu'est-ce que vous avez à raconter ?~ [GENFG14] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(13,13)~ THEN BEGIN 12
  SAY #11122 /* ~Quoi ?~ [GENFG15] */
  IF ~~ THEN EXIT
END

//////////////////////////////////////////////////////////////////

BEGIN ~JODLGWH~   // Woman hostile

IF ~RandomNum(10,1)~ THEN BEGIN 0
  SAY #11123 /* ~Ça peut paraître indigne d'une dame mais je vais vous égorger ! Vous allez voir ça !~ [GENFT01] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(10,2)~ THEN BEGIN 1
  SAY #11124 /* ~On dirait bien que je vais vous achever sur place, et tout et tout.~ [GENFT02] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(10,3)~ THEN BEGIN 2
  SAY #11125 /* ~'Feriez mieux de faire la paix avec vos démons, avant que j'vous envoie les rejoindre.~ [GENFT03] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(10,4)~ THEN BEGIN 3
  SAY #11126 /* ~Vot' fin sera rapide, si vous vous laissez faire...~ [GENFT04] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(10,5)~ THEN BEGIN 4
  SAY #11127 /* ~J'suis d'avis que vous mangerez les pissenlits par la racine avant la fin de la nuit.~ [GENFT05] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(10,6)~ THEN BEGIN 5
  SAY #11128 /* ~Vot' vie n'a aucun intérêt pour moi.~ [GENFT06] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(10,7)~ THEN BEGIN 6
  SAY #11129 /* ~Vos cris seront doux à mes oreilles.~ [GENFT07] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(10,8)~ THEN BEGIN 7
  SAY #11130 /* ~Vous s'rez plus de ce monde quand j'en aurai fini avec vous !~ [GENFT08] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(10,9)~ THEN BEGIN 8
  SAY #11131 /* ~J'vais vous écraser !~ [GENFT09] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(10,10)~ THEN BEGIN 9
  SAY #11132 /* ~Z'allez crever ! J'vais m'en assurer !~ [GENFT10] */
  IF ~~ THEN EXIT
END

//////////////////////////////////////////////////////////////////

BEGIN ~JODLGMIN~  // Mineur

IF ~RandomNum(4,1)~ THEN BEGIN 0
  SAY #4885   /*~Oh là là, je suis si fatigué.~ [MINER01]*/
  IF ~~ THEN EXIT
END

IF ~RandomNum(4,2)~ THEN BEGIN 1
  SAY #4886   /*~Ahh... Laissez-nous... nous avons beaucoup de travail... devant nous, ahh...~ [MINER02]*/
  IF ~~ THEN EXIT
END

IF ~RandomNum(4,3)~ THEN BEGIN 2
  SAY #4887   /*~*tousse* Oh, je crois que je crache du sang !~ [MINER03]*/
  IF ~~ THEN EXIT
END

IF ~RandomNum(4,4)~ THEN BEGIN 3
  SAY #4888   /*~Il fait tellement sombre ici.~ [MINER04]*/
  IF ~~ THEN EXIT
END

//////////////////////////////////////////////////////////////////

BEGIN ~JODLGGNM~  // Gnome Homme

IF ~RandomNum(9,1)~ THEN BEGIN 0
  SAY #4929   /*~Je ne suis pas très heureux, non, pas très heureux.~ [GNOME01]*/
  IF ~~ THEN EXIT
END

IF ~RandomNum(9,2)~ THEN BEGIN 1
  SAY #4930   /*~Je suis heureux, très heureux !~ [GNOME02]*/
  IF ~~ THEN EXIT
END

IF ~RandomNum(9,3)~ THEN BEGIN 2
  SAY #4931   /*~Je ne sais pas qui vous êtes.~ [GNOME03]*/
  IF ~~ THEN EXIT
END

IF ~RandomNum(9,4)~ THEN BEGIN 3
  SAY #61701  /*~J'suis juste venu chercher des navets, j'te jure !~ [GNOMEM01]*/
  IF ~~ THEN EXIT
END

IF ~RandomNum(9,5)~ THEN BEGIN 3
  SAY #61702  /*~Tu... tu vas pas faire de mal à un pauvre petit gnome, hein ?~ [GNOMEM02]*/
  IF ~~ THEN EXIT
END

IF ~RandomNum(9,9)~ THEN BEGIN 3
  SAY #61703  /*~Mmmmmm, ouais ?~ [GNOMEM03]*/
  IF ~~ THEN EXIT
END

IF ~RandomNum(9,7)~ THEN BEGIN 3
  SAY #61704  /*~*siffle*~ [GNOMEM04]*/
  IF ~~ THEN EXIT
END

IF ~RandomNum(9,8)~ THEN BEGIN 3
  SAY #61705  /*~Arrière, gond de baudruche ! Ou j'te brise les rotules !~ [GNOMEM05]*/
  IF ~~ THEN EXIT
END

IF ~RandomNum(9,9)~ THEN BEGIN 3
  SAY #61706  /*~Oh là là !~ [GNOMEM06]*/
  IF ~~ THEN EXIT
END

//////////////////////////////////////////////////////////////////

BEGIN ~JODLGGNF~  // Gnome Femme

IF ~RandomNum(9,1)~ THEN BEGIN 0
  SAY #11638  /*~Heureuse de vous avoir connus.~ [GNOMF01]*/
  IF ~~ THEN EXIT
END

IF ~RandomNum(9,2)~ THEN BEGIN 1
  SAY #11639  /*~Je dois bientôt retourner dans mes grottes. Haha, les tunnels familiers me manquent.~ [GNOMF02]*/
  IF ~~ THEN EXIT
END

IF ~RandomNum(9,3)~ THEN BEGIN 2
  SAY #11640  /*~La vie sous terre est bien plus sûre, et les pierres précieuses qui l'embellissent sont toujours les bienvenues, hihi.~ [GNOMEF03]*/
  IF ~~ THEN EXIT
END

IF ~RandomNum(9,4)~ THEN BEGIN 3
  SAY #11641  /*~Ooh !~ [GNOMF05]*/
  IF ~~ THEN EXIT
END

IF ~RandomNum(9,5)~ THEN BEGIN 3
  SAY #61694  /*~N'essayez même pas de m'intimider !~ [GNOMEF02]*/
  IF ~~ THEN EXIT
END

IF ~RandomNum(9,6)~ THEN BEGIN 3
  SAY #61695  /*~Vous n'avez pas vu de griffons dans le coin, n'est-ce pas ?~ [GNOMEF03]*/
  IF ~~ THEN EXIT
END

IF ~RandomNum(9,7)~ THEN BEGIN 3
  SAY #61696  /*~Comment allez-vous ? Belle journée, n'est-ce pas ?~ [GNOMEF04]*/
  IF ~~ THEN EXIT
END

IF ~RandomNum(9,8)~ THEN BEGIN 3
  SAY #61698  /*~Oh !~ [GNOMEF06]*/
  IF ~~ THEN EXIT
END

IF ~RandomNum(9,9)~ THEN BEGIN 3
  SAY #61700  /*~Oooh, ce n'est vraiment pas une bonne journée !~ [GNOMEF08]*/
  IF ~~ THEN EXIT
END

//////////////////////////////////////////////////////////////////

BEGIN ~JODLGNAI~  // Nain

IF ~RandomNum(4,1)~ THEN BEGIN 0
  SAY #4934   /*~Par le marteau de Moradin.~ [DWARF01]*/
  IF ~~ THEN EXIT
END

IF ~RandomNum(4,2)~ THEN BEGIN 1
  SAY #4936   /*~J'ai besoin d'une bonne vieille bière de chez nous.~ [DWARF02]*/
  IF ~~ THEN EXIT
END

IF ~RandomNum(4,3)~ THEN BEGIN 2
  SAY #4939   /*~Moi, euh... d'assez mauvaise humeur sans que vous m'ennuyez.~ [DWARF03]*/
  IF ~~ THEN EXIT
END

IF ~RandomNum(4,4)~ THEN BEGIN 3
  SAY #4940   /*~Vos causeries commencent à m'agacer.~ [DWARF04]*/
  IF ~~ THEN EXIT
END

//////////////////////////////////////////////////////////////////

BEGIN ~JODLGMH~  // Marin Homme

IF ~RandomNum(4,1)~ THEN BEGIN 0
  SAY #43072   /*~Les mers sont bien agitées à cette époque de l'année.~ [MALSAL01]*/
  IF ~~ THEN EXIT
END

IF ~RandomNum(4,2)~ THEN BEGIN 1
  SAY #43073   /*~Rien de tel que ces escapades terrestres. Un grog et une jeune donzelle sur les genoux feraient de moi un homme comblé.~ [MALSAL02]*/
  IF ~~ THEN EXIT
END

IF ~RandomNum(4,3) !Global("POFAREA","MYAREA",1)~ THEN BEGIN 2
  SAY #45159   /*~Je n'peux pas m'absenter trop longtemps ou l'capitaine aura ma peau.~ [MALSAL03]*/
  IF ~~ THEN EXIT
END

IF ~RandomNum(4,4)~ THEN BEGIN 3
  SAY #46104  /*~Une courte prière à Umberlie est tout ce qui me sépare du fond des mers, croyez-moi.~ [MALSAL04]*/
  IF ~~ THEN EXIT
END

//////////////////////////////////////////////////////////////////

BEGIN ~JODLGMW~  // Marin Femme

IF ~RandomNum(4,1)~ THEN BEGIN 0
  SAY #47345  /*~Une femme sur les mers doit être plus forte que n'importe quel marin.~ [FEMSAL01]*/
  IF ~~ THEN EXIT
END

IF ~RandomNum(4,2)~ THEN BEGIN 1
  SAY #47347  /*~Ahh, me regarde pas comme ça toi, ou je t'éventre sur place !~ [FEMSAL02]*/
  IF ~~ THEN EXIT
END

IF ~RandomNum(4,3)~ THEN BEGIN 2
  SAY #48338  /* ~Un grog. Un grog et un bain. Ouais...~ [FEMSAL03]*/
  IF ~~ THEN EXIT
END

IF ~RandomNum(4,4)~ THEN BEGIN 3
  SAY #51494  /*~Alors comme ça, j'pue le poisson ? Au large ! Fiche-moi le camp !~ [FEMSAL04]*/
  IF ~~ THEN EXIT
END

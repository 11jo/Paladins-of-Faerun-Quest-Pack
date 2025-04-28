// See XG0150.TRA

BEGIN ~XGBAN1A~

IF ~OR(2)
		Global("XGBAN1A_GUILDE_ON","GLOBAL",0)
		Global("XGBAN1A_GUILDE_OFF","GLOBAL",1)
		Dead("XGCRU")~ THEN BEGIN XGBAN1A0
  SAY ~ What will happen to our guild? ~
  IF ~~ THEN REPLY ~ I will appoint you a new guild leader, but if you ever fall under my feet again, you will end up in the same place as your predecessor. ~ DO ~SetGlobal("XGBAN1A_GUILDE_OFF","GLOBAL",1)~ GOTO XGBAN1A1
  IF ~Global("s#XGBLMAJ","GLOBAL",6)~ THEN REPLY ~Cette histoire n'est pas terminée...~ EXIT // GOTO XGBAN1_XGBGON1
  IF ~~ THEN REPLY ~Heu...~ EXIT // SetGlobal("XGBAN1A_GUILDE_ON","GLOBAL",1)
END


IF ~Global("XGBAN1A_GUILDE_OFF","GLOBAL",1)~ THEN BEGIN XGBAN1A1
  SAY ~ Thank you. You deserve our respect, none of our guilds will be in your way. ~
  IF ~~ THEN EXIT
  IF ~Global("s#XGBLMAJ","GLOBAL",6)~ THEN REPLY ~Cette histoire n'est pas terminée...~ EXIT // GOTO XGBAN1_XGBGON1
END

/*
IF ~~ THEN BEGIN XGBAN1_XGBGON1
  SAY ~~
  IF ~~ THEN EXIT
  //IF ~Global("s#XGBLMAJ","GLOBAL",6)~ THEN REPLY ~~ GOTO xxxx
END
*/

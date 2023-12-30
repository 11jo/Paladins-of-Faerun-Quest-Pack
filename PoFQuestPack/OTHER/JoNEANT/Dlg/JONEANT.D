BEGIN ~JONEANT~

IF ~OR(3)
		Global("JONEANT","GLOBAL",5)
		NumTimesTalkedTo(0)
		Global("JONEANT","GLOBAL",2)~ THEN BEGIN JONEANTTALK
	SAY @1000 /* Hello ! */
		IF ~~ THEN REPLY @1001 /* Citrouille ! */
			 DO ~SetGlobal("JONEANT","GLOBAL",30)~ EXIT
		IF ~~ THEN REPLY @1004 /* Réduis ton champ de vision au minimum et devient invisible. */ 
			 DO	~SetGlobal("JONEANT","GLOBAL",10)~ EXIT
		IF ~~ THEN REPLY @1007 /* Réduis ton champ de vision au quart et devient invisible. */ 
			 DO	~SetGlobal("JONEANT","GLOBAL",4)~ EXIT
		IF ~~ THEN REPLY @1002 /* Réduis ton champ de vision de moitié et devient invisible. */
			 DO ~SetGlobal("JONEANT","GLOBAL",7)~ EXIT
		IF ~~ THEN REPLY @1002 /* Réduis ton champ de vision de moitié et devient invisible. */
			 DO ~SetGlobal("JONEANT","GLOBAL",14)~ EXIT
		IF ~~ THEN REPLY @1006 /* Reviens à ton champ de vision normal et devient invisible. */
			 DO ~SetGlobal("JONEANT","GLOBAL",28)~ EXIT
		IF ~~ THEN REPLY @1005 /* Rejoins le groupe ! */ 
			 DO ~JoinParty()~ EXIT
END

  

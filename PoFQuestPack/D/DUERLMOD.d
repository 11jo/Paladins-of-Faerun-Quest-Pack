BEGIN ~DUERLMOD~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
  SAY @0
  IF ~~ THEN REPLY @1 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @2
  IF ~~ THEN REPLY @3 GOTO 2
END

IF ~~ THEN BEGIN 2
  SAY @4
  IF ~~ THEN REPLY @5 DO ~Enemy()~ EXIT
  IF ~~ THEN REPLY @6 DO ~ActionOverride(Player2,LeaveAreaLUA("PF04N2","",[3050.2236],0))
ActionOverride(Player1,LeaveAreaLUA("PF04N2","",[3012.2262],0))
ActionOverride(Player3,LeaveAreaLUA("PF04N2","",[2977.2234],0))
ActionOverride(Player4,LeaveAreaLUA("PF04N2","",[3013.2210],0))
ActionOverride(Player5,LeaveAreaLUA("PF04N2","",[2968.2292],0))
ActionOverride(Player6,LeaveAreaLUA("PF04N2","",[2928.2247],0))~ UNSOLVED_JOURNAL @7 EXIT
END

IF ~!NumTimesTalkedTo(0) Dead("ELGMOD")~ THEN BEGIN 3
  SAY @8
  IF ~~ THEN REPLY @9 DO ~GiveItemCreate("CCLUB01",Player1,0,0,0)
GiveItemCreate("PLAT5",Player1,0,0,0)~ 
SOLVED_JOURNAL @10 EXIT
END

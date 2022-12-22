BEGIN ~LRDRMOD~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0 // from:
  SAY #75542 /* ~Hm, I knew you would come human, but here you will find only death, go back to your home!~ */
  IF ~~ THEN REPLY #75543 /* ~I will deal with YOU, like I have dealed with your friends lich!~ */ GOTO 1
END

IF ~~ THEN BEGIN 1 // from: 0.0
  SAY #75544 /* ~You are brave warrior, but fool, the gladiators you killed were nothing. I'm one of the greatest lich that have ever lived, I'm lord Dread~ */
  IF ~~ THEN REPLY #75545 /* ~Nice to meet ya, my name is <CHARNAME>~ */ GOTO 2
END

IF ~~ THEN BEGIN 2 // from: 1.0
  SAY #75546 /* ~You think you are funny? ~ */
  IF ~~ THEN REPLY #75547 /* ~You mentioned 3 Lich, who are the other 2?~ */ GOTO 3
END

IF ~~ THEN BEGIN 3 // from: 2.0
  SAY #75548 /* ~The one named Sarkan was killed almost 200 years ago. The second is the king of Atkathla, my good friend... ~ */
  IF ~~ THEN REPLY #75549 /* ~Tell my lich, where is the trully king? Where are you hidding him?!~ */ GOTO 4
END

IF ~~ THEN BEGIN 4 // from: 3.0
  SAY #75550 /* ~I won't tell you, and you won't find him! We have spoken too much, show me your fighting skills advanturer ! ~ */
  IF ~~ THEN REPLY #75551 /* ~As you wish Lord Dread!~ */ DO ~Enemy()~ UNSOLVED_JOURNAL #75552 /* ~King's Request.

On the third Isle I found Lord Dread, he was a lich same as the traitor (king) of Atkathla, he didn't tell me where are they hidding the king... I must find the king at all cost!~ */ EXIT
END

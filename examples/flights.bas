#include <input.bas>

0 DIM kk, c, wx, wy, gz, gy, gx, rw, y1, y2, y3, y4, pow, gc, rb, ll, yc, ad, st, rl, bc, nc, pt, px, vz, vy, vx, n AS Float
1 POKE 23658,8: BORDER 1: PAPER 1: INK 7: CLS 
2 LET wy=0: LET wx=0: LET gz=0: LET gy=0: LET gx=0
5 LET rw=0: LET y1=120: LET y2=120: LET y3=40: LET y4=40: LET pow=0: LET gc=0: LET rb=0: LET ll=0: LET yc=0: LET ad=0: LET st=0: LET rl=0: LET bc=0: LET nc=0: LET pt=0: LET px=0: LET vz=0: LET vy=0: LET vx=0
110 GO TO 5000
500 LET ra=ad*c: LET vx=as0*SIN ra
510 LET vy=as0*COS ra: RETURN 
1000 LET pz=pz+gz: LET py=py+gy: LET px=px+gx
1025 IF st=1 THEN PRINT OVER 1;AT 4,12;"S T A L L": LET st=0: GO TO 1040: END IF
1030 IF as0<30 THEN GO SUB 1500: END IF
1040 LET ad=ad+rl: IF ad<0 THEN LET ad=ad+360: END IF
1050 IF ad>359 THEN LET ad=ad-360: END IF
1060 LET vz=as0*SIN (pt*c)-10+as0/15
1070 LET gz=vz: LET gy=vy+wy: LET gx=vx+wx
1080 IF vy=0 THEN LET gd=-PI/2: GO TO 1100: END IF
1090 LET gd=-ATN (vx/vy)/c
1100 GO SUB 500
1110 RETURN 
1500 LET st=1: PRINT OVER 1;AT 4,12;"S T A L L": FOR m=1 TO 4: FOR n=20 TO -20 STEP -4: BEEP .01,n: NEXT n: NEXT m
1510 LET rl=INT (RND*21)-9: LET pt=-21-INT (RND*5)
1520 RETURN 
2000 IF gc<>0 THEN GO SUB 2200: END IF
2190 LET as0=as0+16*(tc*30-as0-8*pt)/as0: GO SUB 2200: GO TO 2205
2200 PLOT 35,50+16: DRAW OVER 1;15*SIN (as0*PI/200),15*COS (as0*PI/200): RETURN 
2205 IF gc<>0 THEN PLOT 155,50+16: DRAW OVER 1;10*SIN (tn*PI/5),10*COS (tn*PI/5): PLOT 155,50+16: DRAW OVER 1;15*SIN (un*PI/500),15*COS (un*PI/500): END IF
2210 LET tn=pz/1000: LET un=pz-1000*INT tn: PLOT 155,50+16: DRAW OVER 1;10*SIN (tn*PI/5),10*COS (tn*PI/5): PLOT 155,50+16: DRAW OVER 1;15*SIN (un*PI/500),15*COS (un*PI/500)
2220 IF gc<>0 THEN GO SUB 2230: END IF
2225 IF pow=-1 AND tc>.2 THEN LET tc=tc-.2: END IF
2226 IF pow=1 AND tc<8.8 THEN LET tc=tc+.2: END IF
2228 GO SUB 2230: GO TO 2240
2230 PLOT 215,50+16: DRAW OVER 1;15*SIN (tc*PI/5),15*COS (tc*PI/5): RETURN 
2240 PRINT AT 21,2;ABS INT ad;"  "
2250 IF py=0 THEN LET rb=0: GO TO 2260: END IF
2255 LET rb=ATN (px/py)/c: IF py>0 THEN LET rb=rb+180: END IF
2260 IF rb<0 THEN LET rb=rb+360: END IF
2270 PRINT AT 21,10;INT rb;"  ";AT 21,18;ABS INT px;"  "
2280 PRINT AT 21,25;INT (SQR (py*py+px*px));" "
2290 IF (y1<=110 AND y2<=110) OR (y1>=130 AND y2>=130) THEN GO TO 2300: END IF
2295 IF gc<>0 THEN PLOT OVER 1;x1,168+16-y1: DRAW OVER 1;x2-PEEK 23677,168+16-y2-PEEK 23678: END IF
2300 LET yc=120+(pt/3): LET x1=80: LET x2=110: LET y1=yc+17*TAN (rl*2*c): LET y2=yc-17*TAN (rl*2*c)
2310 IF (yc<110 OR yc>130) AND rl=0 THEN GO TO 2376: END IF
2320 IF y1<110 THEN LET x1=95-(95-x1)*(110-yc)/(y1-yc): LET y1=110: GO TO 2340: END IF
2330 IF y1>130 THEN LET x1=95-(95-x1)*(130-yc)/(y1-yc): LET y1=130: END IF
2340 IF y2<110 THEN LET x2=95-(95-x2)*(110-yc)/(y2-yc): LET y2=110: GO TO 2360: END IF
2350 IF y2>130 THEN LET x2=95-(95-x2)*(130-yc)/(y2-yc): LET y2=130: END IF
2360 IF x1<80 OR x2>110 THEN GO TO 2376: END IF
2370 PLOT OVER 1;x1,168+16-y1: DRAW OVER 1;x2-PEEK 23677,168+16-y2-PEEK 23678
2376 IF (rl=rr AND pp=pt) THEN GO TO 2500: END IF
2377 IF (y3<=2 AND y4<=2) OR (y3>=90 AND y4>=90) THEN GO TO 2380: END IF
2378 IF gc<>0 THEN PLOT OVER 1;x3,176+16-y3: DRAW OVER 1;x4-PEEK 23677,(176+16-y4)-PEEK 23678: END IF
2380 LET yc=33+pt*4: LET x3=11: LET x4=244: LET y3=yc+118*TAN (rl*2*c): LET y4=yc-118*TAN (rl*2*c)
2390 IF (yc<2 OR yc>90) AND rl=0 THEN GO TO 2450: END IF
2400 IF y3<2 THEN LET x3=128-(128-x3)*(2-yc)/(y3-yc): LET y3=2: GO TO 2420: END IF
2410 IF y3>90 THEN LET x3=128-(128-x3)*(90-yc)/(y3-yc): LET y3=90: END IF
2420 IF y4<2 THEN LET x4=128-(128-x4)*(2-yc)/(y4-yc): LET y4=2: GO TO 2440: END IF
2430 IF y4>90 THEN LET x4=128-(128-x4)*(90-yc)/(y4-yc): LET y4=90: END IF
2440 IF x3<11 OR x4>244 THEN GO TO 2500: END IF
2445 OVER 1: PLOT x3,176+16-y3: DRAW x4-PEEK 23677,(176+16-y4)-PEEK 23678: OVER 0
2450 REM
2500 GO SUB 8000
2505 IF gc=0 THEN LET gc=1: END IF
2510 LET rr=rl: LET pp=pt: RETURN 
3000 LET pow=0: LET k$=INKEY$: IF k$="" THEN RETURN: END IF
3010 IF k$="S" THEN LET pow=pow-1: END IF
3020 IF k$="F" THEN LET pow=pow+1: END IF
3030 IF k$="Q" THEN LET pt=pt+1: END IF
3040 IF k$="A" THEN LET pt=pt-1: END IF
3050 IF k$="O" AND rl>-30 THEN LET rl=rl-1: END IF
3060 IF k$="P" AND rl<30 THEN LET rl=rl+1: END IF
3070 RETURN 
5000 LET pp=-1: LET rr=-1
5010 LET c=PI/180: LET py=-20000: LET pz=2000: LET as0=150
5020 PRINT AT 22,0; "INPUT WIND SPEED (1-50) MPH": LET xx0$=INPUT(10): LET x0=VAL(xx0$): PRINT AT 22,0; TAB 30;
5025 IF x0>50 OR x0<1 THEN GO TO 5020: END IF
5030 PRINT AT 22,0; "WIND DIRECTION (0-359) DEGREES": LET xx1$=INPUT(10): LET x1=VAL(xx1$): PRINT AT 22,0; TAB 30;
5035 IF x1>359 OR x1<0 THEN GO TO 5030: END IF
5040 LET x0=x0/3
5050 PRINT "WIND SPEED= ";3*x0;" M/S": PRINT "DIRECTION = ";x1;" DEGREES"
5055 PAUSE 100: CLS 
5060 LET wy=-x0*COS (x1*c)
5070 LET wx=-x0*SIN (x1*c)
5080 LET gz=vz: LET gy=vy+wy: LET gx=vx+wx
5090 LET tc=5
5100 LET rt=3: LET tp=5: LET wr=50
5110 PLOT 10,175+16: DRAW 235,0: DRAW 0,-90: DRAW -235,0: DRAW 0,90
5120 FOR kk=0 TO 3: CIRCLE 35+kk*60,50+16,20: NEXT kk
5130 PRINT AT 12,2;"SPEED   HORZN   ALT    RPM"
5150 PRINT AT 20,0;"BEARING  RUNWAY  DRIFT  DISTANCE"
5170 PLOT 87,50+16: DRAW 5,0: DRAW 3,-3: DRAW 3,3: DRAW 5,0
5180 LET x=35: LET y=50: GO SUB 7000: LET x=155: GO SUB 7000: LET x=215: GO SUB 7000
5500 GO SUB 3000: GO SUB 1000
5510 IF pz<=0 THEN GO TO 6000: END IF
5520 GO SUB 2000
5530 GO TO 5500
6000 IF ABS rl>rt OR pt>tp OR pt<0 OR as0>80 THEN GO TO 6030: END IF
6010 IF ABS px>wr OR ABS py>1000 THEN GO TO 6060: END IF
6020 CLS : PRINT "CONGRATULATIONS ON A SUCCESSFUL LANDING!": GO TO 6100
6030 FOR n=0 TO 20 STEP .5: PLOT 127,130+16: DRAW 120-INT (RND*240),45-INT (RND*90): BEEP .005,20-n: NEXT n
6040 PAUSE 50
6050 CLS : PRINT "A CRASH LIKE THAT HAS WRECKED   THE AIRCRAFT!": GO TO 6100
6060 CLS : PRINT "YOU LANDED OFF THE RUNWAY"
6070 IF as0<40 THEN PRINT "FORTUNATELY YOU WEREN'T GOING   FAST ENOUGH TO DO MUCH DAMAGE": GO TO 6100: END IF
6080 IF as0<80 THEN PRINT "AT THAT SPEED YOU GOT AWAY WITH LIGHT DAMAGE AND A FEW BRUISES": GO TO 6100: END IF
6090 PRINT "MISSING THE RUNWAY AT THAT SPEED HAS LEFT NO SURVIVORS!"
6100 PRINT : PRINT : PRINT "FINAL FLIGHT DETAILS:": PRINT 
6110 PRINT "AIRSPEED= ";INT as0;" M/S": PRINT "DISTANCE= ";INT (SQR (py*py+px*px)): PRINT "PITCH   = ";pt
6120 PRINT "ROLL    = ";rl: PRINT "RPM     = ";INT (10*tc)/10;" X 1000"
6130 PRINT "DRIFT   = ";INT ABS px;" MTRS": PRINT "BEARING = ";ad;" DEGREES"
6140 PRINT : PRINT "DO YOU WANT ANOTHER GO (Y/N)?"
6150 LET a$=INKEY$: IF a$<>"Y" AND a$<>"N" THEN GO TO 6150: END IF
6160 IF a$="N" THEN GO TO 6900: END IF
6170 CLS : GO TO 1
6900 STOP 
7000 FOR kk=0 TO 2*PI STEP PI/5: PLOT x+17*SIN kk,16+y+17*COS kk: DRAW 2*SIN kk,2*COS kk: NEXT kk: RETURN 
8000 IF gc<>0 THEN PLOT 127,174+16: DRAW OVER 1;ox,oy: END IF
8010 LET ox=16*SIN (rb*(PI/180)): LET oy=-(16*ABS COS (rb*(PI/180)))
8020 PLOT 127,174+16: DRAW OVER 1;ox,oy
8025 LET wb=ad: IF ad>180 THEN LET wb=wb-360: END IF
8026 IF rb>180 THEN LET wb=wb+360-rb: GO TO 8040: END IF
8030 LET wb=wb-rb
8040 IF rw=1 THEN PLOT OVER 1;rdx,175+16-rdy: END IF
8050 LET rw=0: IF ABS wb>57 THEN RETURN: END IF
8060 LET rdx=x3+INT (((x4-x3)/2)-SIN (wb*(PI/180))*(x4-x3)*.6)
8070 LET rdy=y3+((y4-y3)*((rdx-x3)/(x4-x3))+2)
8080 IF rdy<2 OR rdy>90 OR rdx<11 OR rdx>244 THEN RETURN: END IF
8090 LET rw=1: PLOT OVER 1;rdx,175+16-rdy
8100 RETURN 

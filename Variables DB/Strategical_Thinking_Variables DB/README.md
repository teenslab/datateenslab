#### Primer diseño (Cartas)
```ruby
replace pensamiento_estrategico__c="2" if strmatch(pensamiento_estrategico__c, "*2*")>0 


destring pensamiento_estrategico__a, gen(st_cards1)

destring pensamiento_estrategico__b, gen(st_cards2)

destring pensamiento_estrategico__c, gen(st_cards3)

destring pensamiento_estrategico__d, gen(st_cards4)


gen st_cards1_ne=0
replace st_cards1_ne=1 if st_cards1==5
replace st_cards1_ne=. if st_cards1==.


gen st_cards2_ne=0
replace st_cards2_ne=1 if st_cards2==4
replace st_cards2_ne=. if st_cards2==.



gen st_cards3_ne=0
replace st_cards3_ne=1 if st_cards3==2 | st_cards3==1
replace st_cards3_ne=. if st_cards3==.



gen st_cards4_ne=0
replace st_cards4_ne=1 if st_cards4==2 | st_cards4==1
replace st_cards4_ne=. if st_cards4==.



label define st_buttons_label_NE 0 "Not NE" 1 "NE" 
label values st_cards1_ne st_buttons_label_NE
label values st_cards2_ne st_buttons_label_NE
label values st_cards3_ne st_buttons_label_NE
label values st_cards4_ne st_buttons_label_NE
```





#### Segundo diseño (Hucha)
```ruby
********APLICAR HUCHA A PARTIR DE AQUI PARA EL COLEGIO 11, USANDO LA BBDD COLEGIO 11 V4**********
*************** BELIEFS *********************** ***** Only School 11*****



gen st_piggy_belief15=.
replace st_piggy_belief15=0 if stbe1w1=="Pulsó antes que yo" | stbe1w2=="Pulsó antes que yo"
replace st_piggy_belief15=1 if stbe1w1=="Pulsó al mismo tiempo que yo" | stbe1w2=="Pulsó al mismo tiempo que yo"
replace st_piggy_belief15=2 if stbe1w1=="Pulsó después que yo" | stbe1w2=="Pulsó después que yo"

label define st_piggy_belief_label 0 "Pressed before than me" 1 "Pressed at the same time than me" 2 "Pressed after than me" 
lab values st_piggy_belief15 st_piggy_belief_label




gen st_piggy_belief0=.
replace st_piggy_belief0=0 if stbe2w1=="Pulsó antes que yo" | stbe2w2=="Pulsó antes que yo"
replace st_piggy_belief0=1 if stbe2w1=="Pulsó al mismo tiempo que yo" | stbe2w2=="Pulsó al mismo tiempo que yo"
replace st_piggy_belief0=2 if stbe2w1=="Pulsó después que yo" | stbe2w2=="Pulsó después que yo"

 
lab values st_piggy_belief0 st_piggy_belief_label




gen st_piggy_belief_position_15=.
replace st_piggy_belief_position_15=0 if stbe1w1!=""
replace st_piggy_belief_position_15=1 if stbe1w2!=""

gen st_piggy_belief_position_0=.
replace st_piggy_belief_position_0=0 if  stbe2w2!=""
replace st_piggy_belief_position_0=1 if  stbe2w1!=""

label define st_piggy_belief_position_label 0 "It was answered as first" 1 "It was answered as second"
lab values st_piggy_belief_position_0 st_piggy_belief_position_label
lab values st_piggy_belief_position_15 st_piggy_belief_position_label





****RENAME ST****
rename n1 st_piggy_0_sec
rename n30 st_piggy_15_sec


gen st_piggy_position_0=.
replace st_piggy_position_0=0 if t_st1w1!="" 
replace st_piggy_position_0=1 if t_st1w2!="" 

gen st_piggy_position_15=.
replace st_piggy_position_15=0 if t_st2w1!="" 
replace st_piggy_position_15=1 if t_st2w2!="" 


label define st_piggy_position_label 0 "It was answered as first" 1 "It was answered as second"
lab values st_piggy_position_0 st_piggy_position_label
lab values st_piggy_position_15 st_piggy_position_label




***VALORES DE PUNTUACIÓN DE ESTRATEGIA***

gen st_piggy_0_distance_ne= st_piggy_0_sec 


gen st_piggy_15_distance_ne= abs(st_piggy_15_sec-30)

******In school 11 the gif was slow, and it took almost 30 seconds to finish the task, instead of 15 seconds as it was indicated in the instructions****


***** MEANING OF THIS VARIABLES: THE LOWEST VALUE INDICATES THE CLOSER DISTANCE TO NASH EQUILIBRIUM**********

rename Usuario_id usuario_id

rename study study_delavande

rename studyb study_delavandeb

rename Study study

keep usuario_id study st_piggy_belief15 st_piggy_belief0 st_piggy_belief_position_15 st_piggy_belief_position_0 st_piggy_0_sec st_piggy_15_sec st_piggy_position_0 st_piggy_position_15 st_piggy_0_distance_ne st_piggy_15_distance_ne







************************************************
***** For only schools 12 and 13 ******
************************************************

gen st_piggy_belief15=.
replace st_piggy_belief15=0 if stbe1p1=="Pulsó antes que yo" | stbe1p2=="Pulsó antes que yo"
replace st_piggy_belief15=1 if stbe1p1=="Pulsó al mismo tiempo que yo" | stbe1p2=="Pulsó al mismo tiempo que yo" 
replace st_piggy_belief15=2 if stbe1p1=="Pulsó después que yo" | stbe1p2=="Pulsó después que yo" 

label define st_piggy_belief_label 0 "Pressed before than me" 1 "Pressed at the same time than me" 2 "Pressed after than me" 
lab values st_piggy_belief15 st_piggy_belief_label




gen st_piggy_belief0=.
replace st_piggy_belief0=0 if stbe2p1=="Pulsó antes que yo" | stbe2p2=="Pulsó antes que yo" 
replace st_piggy_belief0=1 if stbe2p1=="Pulsó al mismo tiempo que yo" | stbe2p2=="Pulsó al mismo tiempo que yo" 
replace st_piggy_belief0=2 if stbe2p1=="Pulsó después que yo" | stbe2p2=="Pulsó después que yo"

 
lab values st_piggy_belief0 st_piggy_belief_label




gen st_piggy_belief_position_15=.
replace st_piggy_belief_position_15=0 if stbe1p1!="" 
replace st_piggy_belief_position_15=1 if stbe1p2!="" 

gen st_piggy_belief_position_0=.
replace st_piggy_belief_position_0=0 if  stbe2p2!="" 
replace st_piggy_belief_position_0=1 if  stbe2p1!="" 

label define st_piggy_belief_position_label 0 "It was answered as first" 1 "It was answered as second"
lab values st_piggy_belief_position_0 st_piggy_belief_position_label
lab values st_piggy_belief_position_15 st_piggy_belief_position_label




****TIEMPOS ***

***PRIMER CAMINO/POSICIÓN****

gen double st1p1time1 = clock(t_estd1p1, "hms")
gen double st1p1time2 = clock(t_std1p1, "hms")
generate st1p1_sec = Clockdiff(st1p1time1, st1p1time2, "second")

gen double st2p2time1 = clock(t_estd2p1, "hms")
gen double st2p2time2 = clock(t_std2p1, "hms")
generate st2p2_sec = Clockdiff(st2p2time1, st2p2time2, "second")

****SEGUNDO CAMINO/POSICIÓN****

gen double st2p1time1 = clock(t_est2p2, "hms")
gen double st2p1time2 = clock(t_std2p2, "hms")
generate st2p1_sec = Clockdiff(st2p1time1, st2p1time2, "second")

gen double st1p2time1 = clock(t_est1p2, "hms")
gen double st1p2time2 = clock(t_std1p2, "hms")
generate st1p2_sec = Clockdiff(st1p2time1, st1p2time2, "second")


*******

gen st1_all=st1p1_sec
replace st1_all=st1p2_sec if st1_all==.
gen st2_all=st2p1_sec
replace st2_all=st2p2_sec if st2_all==.





****RENAME ST****
rename st1_all st_piggy_0_sec
rename st2_all st_piggy_15_sec


gen st_piggy_position_0=.
replace st_piggy_position_0=0 if t_std1p1!="" 
replace st_piggy_position_0=1 if t_std1p2!="" 

gen st_piggy_position_15=.
replace st_piggy_position_15=0 if t_std2p1!="" 
replace st_piggy_position_15=1 if t_std2p2!="" 


label define st_piggy_position_label 0 "It was answered as first" 1 "It was answered as second"
lab values st_piggy_position_0 st_piggy_position_label
lab values st_piggy_position_15 st_piggy_position_label




***VALORES DE PUNTUACIÓN DE ESTRATEGIA***

gen st_piggy_0_distance_ne= st_piggy_0_sec 


gen st_piggy_15_distance_ne= abs(st_piggy_15_sec-15)


***** MEANING OF THIS VARIABLES: THE LOWEST VALUE INDICATES THE CLOSER DISTANCE TO NASH EQUILIBRIUM**********



keep Usuario_id Study st_piggy_belief15 st_piggy_belief0 st_piggy_belief_position_15 st_piggy_belief_position_0 st_piggy_0_sec st_piggy_15_sec st_piggy_position_0 st_piggy_position_15 st_piggy_0_distance_ne st_piggy_15_distance_ne

rename Usuario_id usuario_id

rename Study study
```

#### Tercer diseño (Botones)

```ruby
*****************OLD DESIGN AND NEW DESIGN ************************ ALTOGETHER 


gen st_buttons_game1=.
replace st_buttons_game1=1 if stcolor1=="Amarillo"
replace st_buttons_game1=1 if stcol1a=="Amarillo" | stcol1d=="Amarillo" | stcol2a=="Blanco" | stcol2d=="Blanco"
replace st_buttons_game1=0 if stcol1a=="Rojo" | stcol1d=="Rojo" | stcol2a=="Azul" | stcol2d=="Azul" 
replace st_buttons_game1=0 if stcolor1=="Rojo"

label define st_buttons_label_yellow 0 "Red" 1 "Yellow" 
label values st_buttons_game1 st_buttons_label_yellow



gen st_buttons_game2=.
replace st_buttons_game2=1 if stcolor2=="Blanco"
replace st_buttons_game2=1 if stcol1e=="Blanco" | stcol1h=="Blanco" | stcol2e=="Amarillo" | stcol2h=="Amarillo"
replace st_buttons_game2=0 if stcol1e=="Azul" | stcol1h=="Azul" | stcol2e=="Rojo" | stcol2h=="Rojo" 
replace st_buttons_game2=0 if stcolor2=="Azul"


label define st_buttons_label_white 0 "Blue" 1 "White" 
label values st_buttons_game2 st_buttons_label_white




gen st_buttons_argument1=.
replace st_buttons_argument1=0 if stwhy1=="He elegido uno al azar" | stwhy1a=="He elegido uno al azar"  | stwhy2a=="He elegido uno al azar" 
replace st_buttons_argument1=1 if stwhy1=="Porque me gustaba el color" | stwhy1a=="Porque me gustaba el color" | stwhy2a=="Porque me gustaba el color"
replace st_buttons_argument1=2 if stwhy1=="Porque ganaba menos" | stwhy1a=="Porque ganaba menos" | stwhy2a=="Porque ganaba menos"
replace st_buttons_argument1=3 if stwhy1=="Porque ganaba más" | stwhy1a=="Porque ganaba más" | stwhy2a=="Porque ganaba más"
replace st_buttons_argument1=. if st_buttons_game1==.

label define st_buttons_label_argument1 0 "Random decision" 1 "Color taste" 2 "Win less" 3 "Win more"
label values st_buttons_argument1 st_buttons_label_argument1


gen st_buttons_argument2=.
replace st_buttons_argument2=0 if stwhy2=="He elegido uno al azar" | stwhy1c=="He elegido uno al azar" | stwhy2c=="He elegido uno al azar" 
replace st_buttons_argument2=1 if stwhy2=="Porque me gustaba el color" |  stwhy1c=="Porque me gustaba el color" |  stwhy2c=="Porque me gustaba el color"
replace st_buttons_argument2=2 if stwhy2=="Porque era más arriesgado" | stwhy1c=="Porque era más arriesgado" | stwhy2c=="Porque era más arriesgado"
replace st_buttons_argument2=3 if stwhy2=="Porque era menos arriesgado" | stwhy1c=="Porque era menos arriesgado" | stwhy2c=="Porque era menos arriesgado"

label define st_buttons_label_argument2 0 "Random decision" 1 "Color taste" 2 "More risky" 3 "Less risky"
label values st_buttons_argument2 st_buttons_label_argument2


**************************** MaxP and MinR ****************************

gen st_buttons_maxp=.
replace st_buttons_maxp=0 if st_buttons_game1==0 
replace st_buttons_maxp=0 if stwhy1!="Porque ganaba más" 
replace st_buttons_maxp=0 if stwhy1a!="Porque ganaba más" 
replace st_buttons_maxp=0 if stwhy2a!="Porque ganaba más"
replace st_buttons_maxp=1 if st_buttons_game1==1 & stwhy1=="Porque ganaba más"  
replace st_buttons_maxp=1 if st_buttons_game1==1 & stwhy1a=="Porque ganaba más"
replace st_buttons_maxp=1 if st_buttons_game1==1 & stwhy2a=="Porque ganaba más"
replace st_buttons_maxp=. if st_buttons_game1==.

label define st_buttons_label_maxp 0 "Not MaxP" 1 "MaxP" 
label values st_buttons_maxp st_buttons_label_maxp



gen st_buttons_minr=.
replace st_buttons_minr=0 if st_buttons_game2==0  
replace st_buttons_minr=0 if stwhy2!="Porque era menos arriesgado" 
replace st_buttons_minr=0 if stwhy1c!="Porque era menos arriesgado" 
replace st_buttons_minr=0 if stwhy2c!="Porque era menos arriesgado"
replace st_buttons_minr=1 if st_buttons_game2==1 & stwhy2=="Porque era menos arriesgado"
replace st_buttons_minr=1 if st_buttons_game2==1 & stwhy1c=="Porque era menos arriesgado"
replace st_buttons_minr=1 if st_buttons_game2==1 & stwhy2c=="Porque era menos arriesgado"
replace st_buttons_minr=. if st_buttons_game2==.


label define st_buttons_label_minr 0 "Not Minr" 1 "Minr" 
label values st_buttons_minr st_buttons_label_minr




********** RANDOMNISED AND CHANGE IN THE COLORS *******

gen st_buttons_randomnised=.
replace st_buttons_randomnised=1 if stcol1a!="" | stcol1b!="" | stcol1c!="" | stcol1d!="" | stcol1e!="" | stcol1f!="" | stcol1g!="" | stcol1h!="" | stcol2a!="" | stcol2b!="" | stcol2c!="" | stcol2d!="" | stcol2e!="" | stcol2f!="" | stcol2g!="" | stcol2h!=""
replace st_buttons_randomnised=0 if stcolor1!=""

label define st_buttons_label_random 0 "Not randomised" 1 "Randomised" 
label values st_buttons_randomnised st_buttons_label_random




gen st_buttons_changedcolor=.
replace st_buttons_changedcolor=1 if stcol2a!="" | stcol2d!="" 
replace st_buttons_changedcolor=0 if stcol1a!="" | stcol1d!="" | stcolor1!=""

label define st_buttons_label_changedcolor 0 "Original Design (Y,R) and (W,B)" 1 "Changed Colors (W,B) and (Y, R)" 
label values st_buttons_changedcolor st_buttons_label_changedcolor




******** BELIEFS ABOUT THE RIVAL ****

gen st_buttons_game1_rival=.
replace st_buttons_game1_rival=1 if stcol1b=="Amarillo" | stcol1c=="Amarillo" | stcol2b=="Blanco" | stcol2c=="Blanco"
replace st_buttons_game1_rival=0 if stcol1b=="Rojo" | stcol1c=="Rojo" | stcol2b=="Azul" | stcol2c=="Azul" 

label values st_buttons_game1_rival st_buttons_label_yellow


gen st_buttons_game2_rival=.
replace st_buttons_game2_rival=1 if stcol1f=="Blanco" | stcol1g=="Blanco" | stcol2f=="Amarillo" | stcol2g=="Amarillo"
replace st_buttons_game2_rival=0 if stcol1f=="Azul" | stcol1g=="Azul" | stcol2f=="Rojo" | stcol2g=="Rojo" 

label values st_buttons_game2_rival st_buttons_label_white


gen st_buttons_argument1_rival=.
replace st_buttons_argument1_rival=0 if stwhy1b=="Ha elegido uno al azar"  | stwhy2b=="Ha elegido uno al azar" 
replace st_buttons_argument1_rival=1 if stwhy1b=="Porque le gustaba el color" | stwhy2b=="Porque le gustaba el color"
replace st_buttons_argument1_rival=2 if stwhy1b=="Porque ganaba menos" | stwhy2b=="Porque ganaba menos"
replace st_buttons_argument1_rival=3 if stwhy1b=="Porque ganaba más" | stwhy2b=="Porque ganaba más"

label values st_buttons_argument1_rival st_buttons_label_argument1


gen st_buttons_argument2_rival=.
replace st_buttons_argument2_rival=0 if stwhy1d=="Ha elegido uno al azar" | stwhy2d=="Ha elegido uno al azar" 
replace st_buttons_argument2_rival=1 if stwhy1d=="Porque le gustaba el color" |  stwhy2d=="Porque le gustaba el color"
replace st_buttons_argument2_rival=2 if stwhy1d=="Porque era más arriesgado" | stwhy2d=="Porque era más arriesgado"
replace st_buttons_argument2_rival=3 if stwhy1d=="Porque era menos arriesgado" | stwhy2d=="Porque era menos arriesgado"

label values st_buttons_argument2_rival st_buttons_label_argument2

keep usuario_id study st_cards1 st_cards2 st_cards3 st_cards4 st_cards1_ne st_cards2_ne st_cards3_ne st_cards4_ne st_buttons_game1 st_buttons_game2 st_buttons_argument1 st_buttons_argument2 st_buttons_maxp st_buttons_minr st_buttons_randomnised st_buttons_changedcolor st_buttons_game1_rival st_buttons_game2_rival st_buttons_argument1_rival st_buttons_argument2_rival

```

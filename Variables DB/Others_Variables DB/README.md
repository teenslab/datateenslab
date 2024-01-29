#### Incluyen las variables: NUTRITION, HONESTY, FTR-BUDAPEST VARIABLES
```ruby
******* NUTRITION ***********

gen vegetables=.
replace vegetables=0 if strmatch(comida__verduras, "Menos*")>0 
replace vegetables=1 if strmatch(comida__verduras, "Una*")>0 
replace vegetables=2 if strmatch(comida__verduras, "Más*")>0 

gen fruits=.
replace fruits=0 if strmatch(comida__fruta, "Menos*")>0 
replace fruits=1 if strmatch(comida__fruta, "Una*")>0 
replace fruits=2 if strmatch(comida__fruta, "Más*")>0 

gen soda=.
replace soda=0 if strmatch(comida__soda, "Menos*")>0 
replace soda=1 if strmatch(comida__soda, "Una*")>0 
replace soda=2 if strmatch(comida__soda, "Más*")>0 

gen fish=.
replace fish=0 if strmatch(comida__pescado, "Menos*")>0 
replace fish=1 if strmatch(comida__pescado, "2*")>0 
replace fish=2 if strmatch(comida__pescado, "Más*")>0 

gen junkfood=.
replace junkfood=0 if strmatch(comida__rapida, "Menos*")>0 
replace junkfood=1 if strmatch(comida__rapida, "2*")>0 
replace junkfood=2 if strmatch(comida__rapida, "Más*")>0 


******** HONESTY*******

gen honesty=.
replace honesty =1 if imagenes__diferencias=="1"
replace honesty =0 if imagenes__diferencias!=""&honesty==.
replace honesty=1 if strmatch(honest_numbers, "Otra*")>0 
replace honesty=0 if honest_numbers!=""&honesty==.


********************
order usuario_id	alumno_id	datedone	yeardone	study	privacy_original	privacy	dropout	device	net_id	class_id	school	schoolprov	schooltown	schooltype	ciclo	grade	group	class_size	gender_original	gender	yearbirth_text	yearbirth	age	age_assumed	migrant	spainborn 	where  	spainborn2 	where2	language	celebration	siblings	nsiblings	nsister	nbrother	rankbrother	left_hand	repeater	repmany	optativas	mark10	mark8	nmark10	nmark8	nmark10_text	nmark8_text	gpa	gpaN	good1	good2	good3	like1	like2	like3	goodbeforelike	uniwant	world	abroad	willwork	wish_slider	friend	bfriend	enemy	wenemy	believedpopu	message	sfriend	sbfriend	senemy	swenemy	delegate	bullying self_bullying n_others_bullying others_bullying	alone	fun	general	moodalone	moodfun	moodgeneral	happy	happyN	hlbeforetd	tp1	tp2	tp3	tp4	tp5	tp6	money1	money2	money3	money4	money5	money6	patience	patienceN	cns_td	emily	library	run	lottery	bank1	bank2	crt1	crt2	crt3	fin1	fin2	fin3	crttotal	fintotal	crtN	finN	newdesignhl	hl1	hl2	hl3	hl4	hl5	hl6	prob1	prob2	prob3	prob4	prob5	prob6	risky	riskyN	dominated1	dominated6	swb_risk	cns_risk	delavande__apple20	delavande__apple10	delavande__riceweek	delavande__ricemoth	delavande__sch0	delavande__bath100	delavande__uni	delavande__study	delavande_slider	socpref1	socpref2	socpref3	sp1_v1	sp2_v1	sp3_v1	sp1	sp2	sp3	sp4	sp5	sp6	sp1_v2	sp2_v2	sp3_v2	sp4_v2	sp5_v2	sp6_v2	sp_randomized	stairs	lessthanme	morethanme	mymoney	path_mymoney	height_original	weight_original	height	weight	figure	obesity	pensamiento_estrategico__a	pensamiento_estrategico__b	pensamiento_estrategico__c	pensamiento_estrategico__d	stbe1p1	stbe2p1	stbe2p2	stbe1p2	stbe1w2	stbe2w2	stbe1w1	stbe2w1	stcolor1	stwhy1	stcolor2	stwhy2	vegetables	fruits	soda	fish	junkfood	imagenes__diferencias	honest_numbers	treatment_numbers	honesty	creatividad__texto	creatividad__clip	rope1	ropeuse1	ropeuse2	rope2	ftr1	ftr2	ftr3	ftr1a	ftr2a	ftr1b	ftr2b	tpc1	tpc11	tpc111	tpc112	tpc22	tpc221	tpc222	physicalact1	physicalact2	physicalact3	physicalact4	physicalact5	physicalact6	physicalact7	clima1	clima2	clima3	clima4	clima5	clima6	clima7	clima8	clima9	clima10	clima11	clima12	clima13	covid	covid2	covid3	covid4
******
******************************************
********  FTR-BUDAPEST VARIABLES *********
******************************************



rename ftr1 ftr1_tex 
rename ftr2 ftr2_tex 
rename ftr3 ftr3_tex 


replace ftr1_tex=ftr1a if ftr1a!= ""
replace ftr1_tex=ftr2b if ftr2b!=""

*The new version does not include the second question ftr2, so ftr2a and ftr2b are equal to ftr3

replace ftr3_tex=ftr2a if ftr2a!=""
replace ftr3_tex=ftr1b if ftr1b!=""

*short version
*ftr1a ftr2a ftr1b ftr2b
gen ftr_short=0 if ftr1_tex!=""
replace ftr_short=1 if ftr1a!= ""


* ftr1
forvalues i = 1(1)1{
*capture drop ftr1
gen ftr1=0 if strmatch(ftr1_tex, "*voy*")>0
replace ftr1=1 if strmatch(ftr1_tex, "*a*")>0
replace ftr1=2 if strmatch(ftr1_tex, "*iré*")>0
label define ir 0 "Voy" 1 "Voy a ir" 2 "Iré"
label values ftr1 ir
label variable ftr1 "This weekend"
*notes ftr1: "create at SV_dofile_MVR.do by MVR at 20230729"
} 


* ftr2
forvalues i = 1(1)1{
*capture drop ftr2
gen ftr2=0 if strmatch(ftr2_tex, "*voy*")>0
replace ftr2=1 if strmatch(ftr2_tex, "*a*")>0
replace ftr2=2 if strmatch(ftr2_tex, "*iré*")>0
*label define ir 0 "Voy" 1 "Voy a ir" 2 "Iré"
label values ftr2 ir
label variable ftr2 "August"
*notes ftr2: "create at SV_dofile_MVR.do by MVR at 20230729"
} 

* ftr3 
forvalues i = 1(1)1{
*capture drop ftr3
gen ftr3=0 if strmatch(ftr3_tex, "*tengo*")>0
replace ftr3=1 if strmatch(ftr3_tex, "*a*")>0
replace ftr3=2 if strmatch(ftr3_tex, "*dré*")>0
label define tener 0 "Tengo" 1 "Voy a tener" 2 "Tendré"
label values ftr3 tener
label variable ftr3 "In 15 years"
*notes ftr3: "create at SV_dofile_MVR.do by MVR at 20230729"
} 
```

#### Andalucía
###### Age
```ruby
**AGE**
rename yearbirth yearbirth_text
gen yearbirth =.
replace yearbirth = 2000 if strmatch(yearbirth_text, "*2000*")>0
replace yearbirth = 2001 if strmatch(yearbirth_text, "*2001*")>0
replace yearbirth = 2002 if strmatch(yearbirth_text, "*2002*")>0
replace yearbirth = 2003 if strmatch(yearbirth_text, "*2003*")>0
replace yearbirth = 2004 if strmatch(yearbirth_text, "*2004*")>0
replace yearbirth = 2005 if strmatch(yearbirth_text,"*2005*")>0
replace yearbirth = 2006 if strmatch(yearbirth_text, "*2006")>0
replace yearbirth = 2007 if strmatch(yearbirth_text, "*2007*")>0
replace yearbirth = 2008 if strmatch(yearbirth_text, "*2008*")>0 
replace yearbirth = 2009 if strmatch(yearbirth_text, "*2009*")>0
replace yearbirth = 2010 if strmatch(yearbirth_text, "*2010*")>0
replace yearbirth = 2011 if strmatch(yearbirth_text, "*2011*")>0
replace yearbirth = 2012 if strmatch(yearbirth_text, "*2012*")>0
replace yearbirth = 2013 if strmatch(yearbirth_text, "*2013*")>0
replace yearbirth = 2005 if yearbirth==.& strmatch(yearbirth_text, "*005")>0
replace yearbirth = 2006 if yearbirth==.& strmatch(yearbirth_text, "*006")>0
replace yearbirth = 2007 if yearbirth==.& strmatch(yearbirth_text, "*007")>0
replace yearbirth = 2008 if yearbirth==.& strmatch(yearbirth_text, "*008")>0
replace yearbirth = 2009 if yearbirth==.& strmatch(yearbirth_text, "*009")>0
replace yearbirth = 2003 if yearbirth==.& strmatch(yearbirth_text, "*203")>0
replace yearbirth = 2004 if yearbirth==.& strmatch(yearbirth_text, "*204")>0
replace yearbirth = 2005 if yearbirth==.& strmatch(yearbirth_text, "*205")>0
replace yearbirth = 2006 if yearbirth==.& strmatch(yearbirth_text, "*206")>0
replace yearbirth = 2007 if yearbirth==.& strmatch(yearbirth_text, "*207")>0
replace yearbirth = 2008 if yearbirth==.& strmatch(yearbirth_text, "*208")>0
replace yearbirth = 2009 if yearbirth==.& strmatch(yearbirth_text, "*209")>0
replace yearbirth = 2006 if yearbirth==.& strmatch(yearbirth_text, "2006*")>0
replace yearbirth = 2007 if yearbirth==.& strmatch(yearbirth_text, "2007*")>0
replace yearbirth = 2008 if yearbirth==.& strmatch(yearbirth_text, "2008*")>0
replace yearbirth = 2009 if yearbirth==.& strmatch(yearbirth_text, "2009*")>0
replace yearbirth = 2006 if yearbirth==.& strmatch(yearbirth_text, "*06")>0
replace yearbirth = 2007 if yearbirth==.& strmatch(yearbirth_text, "*07")>0
replace yearbirth = 2008 if yearbirth==.& strmatch(yearbirth_text, "*08")>0
replace yearbirth = 2009 if yearbirth==.& strmatch(yearbirth_text, "*09")>0

gen age=.
replace age=yeardone-yearbirth
replace age=11 if strmatch(yearsold, "*11*")>0 &school==14
replace age=12 if strmatch(yearsold, "*12*")>0&school==14
replace age=13 if strmatch(yearsold, "*13*")>0&school==14
replace age=14 if strmatch(yearsold, "*14*")>0&school==14
replace age=15 if strmatch(yearsold, "*15*")>0&school==14
replace age=16 if strmatch(yearsold, "*16*")>0&school==14
replace age=17 if strmatch(yearsold, "*17*")>0&school==14


**Considering the missing values ​​as the mode of the age of the grade
forvalues i = 1(1)1{
capture drop age_assumed
bysort school ciclo grade group: egen modeage=mode(age), minmode
gen age_assumed =age
replace age_assumed=modeage if age==.
drop modeage
label variable age_assumed  "Age assumed by mode"
*notes age_assumed: "create at UB_dofile_MVR.do by MVR at 20230419"
}
```
###### Gender
```ruby
merge 1:1 usuario_id using  "C:\Users\mvasco\OneDrive - Universidad Loyola Andalucía\Escritorio\gender.dta"
drop if _merge ==2
drop _merge
replace gender_original="Femenino" if strmatch(gender_original, "*jer*")>0
replace gender_original="Masculino" if strmatch(gender_original, "*bre*")>0
```
###### Device
```ruby
forvalues i = 1(1)1{
capture drop device
gen device=.
replace device=1 if strmatch(dispositivo, "*denador*")>0 | strmatch(dispositivo, "*tatil*")>0 
replace device=2 if strmatch(dispositivo, "*ablet*")>0
replace device=3 if strmatch(dispositivo, "*fono*")>0 | strmatch(dispositivo, "*vil*")>0
replace device=0 if dispositivo!=""&device==.
label define device  0 "Other" 1 "Computer" 2 "Tablet" 3 "Phone" 
label values device device
label variable device  "Device used"
*notes device: "create at UB_dofile_MVR.do by MVR at 20230419"
}
```
###### Migrant
```ruby
**MIGRANT**

*languageother language celebration noinmigrante_gen1 noimegrante_gen1_tex noinmigrante_gen2 noimegrante_gen2_tex

gen spainborn=.
replace spainborn=1 if strpos(lower(noinmigrante_gen1), "si") > 0
replace spainborn=0 if strpos(lower(noinmigrante_gen1), "no") > 0
replace spainborn=99 if strpos(lower(noinmigrante_gen1), "prefiero") > 0

gen where=noimegrante_gen1_tex 
gen where2=noimegrante_gen2_tex 

gen spainborn2=.
replace spainborn2=1 if strpos(lower(noinmigrante_gen2), "si") > 0
replace spainborn2=0 if strpos(lower(noinmigrante_gen2), "no") > 0
replace spainborn2=99 if strpos(lower(noinmigrante_gen2), "prefiero") > 0

gen migrant=.
replace migrant=1 if spainborn==0 | spainborn2==0
replace migrant=0 if spainborn==1 & spainborn2==1
replace migrant=99 if (spainborn==99 | spainborn2==99)&migrant==.
replace migrant=0 if languageother==0&migrant==.
replace migrant=0 if languageother==1& strpos(lower(language), "euskera") > 0&migrant==.
replace migrant=0 if strpos(lower(language), "ninguno") > 0&migrant==.
replace migrant=1 if language!=""&migrant==.
replace migrant=1 if strpos(lower(celebration), "origen") > 0&migrant==.
```
###### Repeater
```ruby
gen repeater=.
replace repeater=1 if strpos(lower(rep), "si") > 0
replace repeater=0 if strpos(lower(rep), "no") > 0
replace repeater=99 if strpos(lower(rep), "respon") > 0
```
###### GPA
```ruby
split nmark8_text, generate(notables) parse("|") 

forvalues x=1/4 {
	replace notables`x'="" if strmatch(notables`x', "*Otra*")>0
}

gen notab_lengua=0
forvalues x=1/4 {
	replace notab_lengua=1 if strmatch(notables`x', "*Lengua*")>0
}
replace notab_lengua=1 if strmatch(literature, "*7*")>0|strmatch(literature, "*8*")>0

gen notab_mates=0
forvalues x=1/4 {
	replace notab_mates=1 if strmatch(notables`x', "*Matem*")>0
}
replace notab_mates=1 if strmatch(maths, "*7*")>0|strmatch(maths, "*8*")>0

gen notab_ingles=0
forvalues x=1/4 {
	replace notab_ingles=1 if strmatch(notables`x', "*Ing*")>0
}
replace notab_ingles=1 if strmatch(english, "*7*")>0|strmatch(english, "*8*")>0

gen nmark8=0
replace nmark8=notab_lengua+notab_mates+notab_ingles
replace nmark8=. if nmark8_text==""&privacy==0

split nmark10_text, generate(sobresalientes) parse("|") 

forvalues x=1/4 {
	replace sobresalientes`x'="" if strmatch(sobresalientes`x', "*Otra*")>0
}

gen sobre_lengua=0
forvalues x=1/4 {
	replace sobre_lengua=1 if strmatch(sobresalientes`x', "*Lengua*")>0
}
replace sobre_lengua=1 if strmatch(literature, "*9*")>0|strmatch(literature, "*10*")>0

gen sobre_mates=0
forvalues x=1/4 {
	replace sobre_mates=1 if strmatch(sobresalientes`x', "*Matem*")>0
}
replace sobre_mates=1 if strmatch(maths, "*9*")>0|strmatch(maths, "*10*")>0

gen sobre_ingles=0
forvalues x=1/4 {
	replace sobre_ingles=1 if strmatch(sobresalientes`x', "*Ing*")>0
}
replace sobre_ingles=1 if strmatch(english, "*9*")>0|strmatch(english, "*10*")>0


gen nmark10=0
replace nmark10=sobre_lengua+sobre_mates+sobre_ingles
replace nmark10=. if nmark10_text==""&privacy==0

*New gpa
gen gpa=0
replace gpa=9 if nmark10==3
replace gpa=8 if nmark10==2
replace gpa=7 if nmark10==1
replace gpa=6 if nmark10==0&nmark8==3
replace gpa=5 if nmark10==2&nmark8==0
replace gpa=4 if nmark10==1&nmark8==1
replace gpa=3 if nmark10==0&nmark8==2
replace gpa=2 if nmark10==1&nmark8==0
replace gpa=1 if nmark10==0&nmark8==1
replace gpa=. if privacy==0
gen gpaN=gpa/9
replace gpaN=. if privacy==0
```
###### Goods at and likes
```ruby
replace goodbeforelike=0 if goodnum!=""&goodbeforelike==.

* Good1
forvalues i = 1(1)1{
capture drop good1
gen good1=.
replace good1=4 if strmatch(goodnum, "Muy bue*")>0
replace good1=3 if strmatch(goodnum, "Bastante*")>0
replace good1=2 if strmatch(goodnum, "Regular*")>0
replace good1=1 if strmatch(goodnum, "Malo*")>0
replace good1=0 if strmatch(goodnum, "Muy m*")>0
lab var good1 "Good at solving numerical problems"
lab define goodat 0 "Very bad" 1 "Bad" 2 "Normal" 3 "Good" 4 "Very good"
lab values good1 goodat 
*notes good1: "create at UB_dofile_MVR.do by MVR at 20230419"
}

* Good2
forvalues i = 1(1)1{
capture drop good2
gen good2=.
replace good2=4 if strmatch(goodment, "Muy bue*")>0
replace good2=3 if strmatch(goodment, "Bastante*")>0
replace good2=2 if strmatch(goodment, "Regular*")>0
replace good2=1 if strmatch(goodment, "Malo*")>0
replace good2=0 if strmatch(goodment, "Muy ma*")>0
lab var good2 "Good at mental calculations"
lab values good2 goodat 
*notes good2: "create at UB_dofile_MVR.do by MVR at 20230419"
}

* Good3
forvalues i = 1(1)1{
capture drop good3
gen good3=.
replace good3=4 if strmatch(goodmult, "Muy bue*")>0
replace good3=3 if strmatch(goodmult, "Bastante*")>0
replace good3=2 if strmatch(goodmult, "Regular*")>0
replace good3=1 if strmatch(goodmult, "Malo*")>0
replace good3=0 if strmatch(goodmult, "Muy ma*")>0
lab var good3 "Good at multiplying"
lab values good3 goodat 
*notes good3: "create at UB_dofile_MVR.do by MVR at 20230419"
}


* Like1
forvalues i = 1(1)1{
capture drop like1
gen like1=.
replace like1=4 if strmatch(likenum, "Much*")>0
replace like1=3 if strmatch(likenum, "Bastant*")>0
replace like1=2 if strmatch(likenum, "Algo*")>0
replace like1=1 if strmatch(likenum, "Poc*")>0
replace like1=0 if strmatch(likenum, "Nada*")>0   
lab var like1 "Enjoys solving numerical problems"
lab define likemath 0 "Not at all" 1 "A little" 2 "Neither too much nor too little" 3 "Pretty much" 4 "A lot"
lab values like1 likemath 
*notes like1: "create at UB_dofile_MVR.do by MVR at 20230419"
}

* like2
forvalues i = 1(1)1{
capture drop like2
gen like2=.
replace like2=4 if strmatch(likement, "Much*")>0
replace like2=3 if strmatch(likement, "Bastante*")>0
replace like2=2 if strmatch(likement, "Algo*")>0
replace like2=1 if strmatch(likement, "Poco*")>0
replace like2=0 if strmatch(likement, "Nada*")>0
lab var like2 "Enjoys mental calculations"
lab values like2 likemath 
*notes like2: "create at UB_dofile_MVR.do by MVR at 20230419"
}

* like3
forvalues i = 1(1)1{
capture drop like3
gen like3=.
replace like3=4 if strmatch(likemult, "Much*")>0
replace like3=3 if strmatch(likemult, "Bastante*")>0
replace like3=2 if strmatch(likemult, "Algo*")>0
replace like3=1 if strmatch(likemult, "Poc*")>0
replace like3=0 if strmatch(likemult, "Nada*")>0  
lab var like3 "Enjoys multiplying"
lab values like3 likemath 
*notes like3: "create at UB_dofile_MVR.do by MVR at 20230419"
}
```
###### Mood
```ruby
rename estado_animo__diversion fun
rename estado_animo__general general
rename estado_animo__solo alone

forvalues i = 1(1)1{
capture drop moodalone
gen moodalone = 0 if strmatch(alone, "*Siempre*")>0 
replace moodalone=1 if strmatch(alone, "*Casi siempre*")>0 
replace moodalone=2 if strmatch(alone, "*Algunas*")>0 
replace moodalone=3 if strmatch(alone, "*Casi nunca*")>0 
replace moodalone=4 if strmatch(alone, "*Nunca*")>0 
label define moodalone 0 "Always" 1 "Usually" 2 "Sometimes" 3 "Rarely" 4 "Never"
label values moodalone moodalone
lab var moodalone "Do you feel alone?"
*notes moodalone: "create at UB_dofile_MVR.do by MVR at 20230419"
}

forvalues i = 1(1)1{
capture drop moodfun
gen moodfun = 0 if  strmatch(fun, "*Nunca*")>0 
replace moodfun=1 if strmatch(fun, "*Casi nunca*")>0 
replace moodfun=2 if strmatch(fun, "*Algunas*")>0 
replace moodfun=3 if strmatch(fun, "*Casi siempre*")>0 
replace moodfun=4 if strmatch(fun, "*Siempre*")>0 
label define mood 0 "Never" 1 "Rarely" 2 "Sometimes" 3 "Usually" 4 "Always"
label values moodfun mood
lab var moodfun "Do you have fun with your friends?"
*notes moodfun: "create at UB_dofile_MVR.do by MVR at 20230419"
}

forvalues i = 1(1)1{
capture drop moodgeneral
gen moodgeneral = 0 if strmatch(general, "*Nunca*")>0 
replace moodgeneral=1 if strmatch(general, "*Casi nunca*")>0 
replace moodgeneral=2 if strmatch(general, "*Algunas*")>0 
replace moodgeneral=3 if strmatch(general, "*Casi siempre*")>0
replace moodgeneral=4 if strmatch(general, "*Siempre*")>0 
label values moodgeneral mood
lab var moodgeneral "How are you doing in school?"
*notes moodgeneral: "create at UB_dofile_MVR.do by MVR at 20230419"

}

gen happy=moodalone+moodfun+moodgeneral
gen happyN=happy/12
```
#### Cataluña
###### Age
```ruby
forvalues i = 1(1)1{
capture drop age
rename yearbirth yearbirth_text
gen yearbirth=.
replace yearbirth = 2000 if strmatch(yearbirth_text, "*2000*")>0
replace yearbirth = 2001 if strmatch(yearbirth_text, "*2001*")>0
replace yearbirth = 2002 if strmatch(yearbirth_text, "*2002*")>0
replace yearbirth = 2003 if strmatch(yearbirth_text, "*2003*")>0
replace yearbirth = 2004 if strmatch(yearbirth_text, "*2004*")>0
replace yearbirth = 2005 if strmatch(yearbirth_text, "*2005*")>0
replace yearbirth = 2006 if strmatch(yearbirth_text, "*2006")>0
replace yearbirth = 2007 if strmatch(yearbirth_text, "*2007*")>0
replace yearbirth = 2008 if strmatch(yearbirth_text, "*2008*")>0 
replace yearbirth = 2009 if strmatch(yearbirth_text, "*2009*")>0
replace yearbirth = 2010 if strmatch(yearbirth_text, "*2010*")>0
replace yearbirth = 2011 if strmatch(yearbirth_text, "*2011*")>0
replace yearbirth = 2012 if strmatch(yearbirth_text, "*2012*")>0
replace yearbirth = 2013 if strmatch(yearbirth_text, "*2013*")>0
replace yearbirth = 2005 if yearbirth==.& strmatch(yearbirth_text, "*005")>0
replace yearbirth = 2006 if yearbirth==.& strmatch(yearbirth_text, "*006")>0
replace yearbirth = 2007 if yearbirth==.& strmatch(yearbirth_text, "*007")>0
replace yearbirth = 2008 if yearbirth==.& strmatch(yearbirth_text, "*008")>0
replace yearbirth = 2009 if yearbirth==.& strmatch(yearbirth_text, "*009")>0
replace yearbirth = 2003 if yearbirth==.& strmatch(yearbirth_text, "*203")>0
replace yearbirth = 2004 if yearbirth==.& strmatch(yearbirth_text, "*204")>0
replace yearbirth = 2005 if yearbirth==.& strmatch(yearbirth_text, "*205")>0
replace yearbirth = 2006 if yearbirth==.& strmatch(yearbirth_text, "*206")>0
replace yearbirth = 2007 if yearbirth==.& strmatch(yearbirth_text, "*207")>0
replace yearbirth = 2008 if yearbirth==.& strmatch(yearbirth_text, "*208")>0
replace yearbirth = 2009 if yearbirth==.& strmatch(yearbirth_text, "*209")>0
replace yearbirth = 2006 if yearbirth==.& strmatch(yearbirth_text, "2006*")>0
replace yearbirth = 2007 if yearbirth==.& strmatch(yearbirth_text, "2007*")>0
replace yearbirth = 2008 if yearbirth==.& strmatch(yearbirth_text, "2008*")>0
replace yearbirth = 2009 if yearbirth==.& strmatch(yearbirth_text, "2009*")>0
replace yearbirth = 2008 if yearbirth==.& strmatch(yearbirth_text, "*08")>0
forvalues x=1975/1999{
	replace yearbirth = `x' if yearbirth==.& strmatch(yearbirth_text, "*`x'*")>0
}

gen age=.
replace age= 2023 - yearbirth
label variable age  "Age"

}

**Considering the missing values ​​as the mode of the age of the grade
forvalues i = 1(1)1{
capture drop age_assumed
bysort school ciclo grade group: egen modeage=mode(age), minmode
gen age_assumed =age
replace age_assumed=modeage if age==.
drop modeage
label variable age_assumed  "Age assumed by mode"
*notes age_assumed: "create at UB_dofile_MVR.do by MVR at 20230419"
}
```
###### Gender
```ruby
forvalues i = 1(1)1{
gen gender=.
replace gender = 0 if strmatch(gender_original, "Mas*")>0
replace gender = 1 if strmatch(gender_original, "Feme*")>0
replace gender = 2 if strmatch(gender_original, "Otro*")>0 | strmatch(gender_original, "No bi*")>0
replace gender = 99 if strmatch(gender_original, "Pref*")>0
label variable gender  "Gender"
label define gender 0 "Male" 1 "Female"  2 "Other" 99 "Prefer not to answer"
label values gender gender 
*notes gender: "create at UB_dofile_MVR.do by MVR at 20230419"
}
```
###### Device
```ruby
rename dispositivo dispositivo_text
forvalues i = 1(1)1{
capture drop device
gen device=.
replace device=0 if strmatch(dispositivo_text, "*Altre*")>0 
replace device=1 if strmatch(dispositivo_text, "*rdinador*")>0 | strmatch(dispositivo_text, "*rdenado*")>0 
replace device=2 if strmatch(dispositivo_text, "*auleta*")>0 | strmatch(dispositivo_text, "*ablet*")>0
replace device=3 if strmatch(dispositivo_text, "*Telèfon*")>0 | strmatch(dispositivo_text, "*fono*")>0 | strmatch(dispositivo_text, "*vil*")>0
label define device  0 "Other" 1 "Computer" 2 "Tablet" 3 "Phone" 
label values device device
label variable device  "Device used"
*notes device: "create at UB_dofile_MVR.do by MVR at 20230419"
}
```
###### Migrant
```ruby
*Migrant

forvalues i = 1(1)1{

gen spainborn=.
replace spainborn=1 if strpos(lower(cntrybir), "espan") > 0
replace spainborn=1 if strpos(lower(cntrybir), "pain") > 0 
replace spainborn=1 if strpos(lower(cntrybir), "badell") > 0 
replace spainborn=1 if strpos(lower(cntrybir), "arcelo") > 0
replace spainborn=1 if strpos(lower(cntrybir), "ña") > 0
replace spainborn=1 if strmatch(cntrybir, "*ÑA*")>0
replace spainborn=1 if strmatch(cntrybir, "*atalu*")>0
replace spainborn=1 if strmatch(cntrybir, "Espa*")>0
replace spainborn=1 if strmatch(cntrybir, "*basc*")>0
replace spainborn=1 if strmatch(cntrybir, "*atalu*")>0
replace spainborn=0 if cntrybir!=""& spainborn==.
gen where=cntrybir if spainborn==0

gen dad=.
replace dad=1 if strpos(lower(cntrydad), "espa") > 0
replace dad=1 if strpos(lower(cntrydad), "pain") > 0 
replace dad=1 if strpos(lower(cntrydad), "badell") > 0 
replace dad=1 if strpos(lower(cntrydad), "elona") > 0
replace dad=1 if strpos(lower(cntrydad), "catalu") > 0
replace dad=1 if strpos(lower(cntrydad), "ña") > 0
replace dad=1 if strmatch(cntrydad, "*ÑA*")>0
replace dad=1 if strmatch(cntrydad, "*atalu*")>0
replace dad=1 if strmatch(cntrydad, "*Espa*")>0
replace dad=1 if strmatch(cntrydad, "*basc*")>0
replace dad=1 if strmatch(cntrydad, "*atalu*")>0
replace dad=1 if strmatch(cntrydad, "*evilla*")>0
replace dad=1 if strmatch(cntrydad, "*grana*")>0
replace dad=1 if strmatch(cntrydad, "*nya*")>0
replace dad=1 if strmatch(cntrydad, "*giron*")>0
replace dad=1 if strmatch(cntrydad, "*galici*")>0
replace dad=1 if strmatch(cntrydad, "*aqu*")>0
replace dad=1 if strmatch(cntrydad, "*adrid*")>0
replace dad=1 if strpos(lower(cntrydad), "tremadura") > 0
replace dad=1 if strpos(lower(cntrydad), "ilbao") > 0
replace dad=1 if strpos(lower(cntrydad), "almeria") > 0
replace dad=1 if strpos(lower(cntrydad), "andalu") > 0
replace dad=1 if strmatch(cntrydad, "*rdoba*")>0
replace dad=1 if strmatch(cntrydad, "*A Bar*")>0

replace dad=0 if cntrydad!=""& dad==.
gen wheredad=cntrydad if dad==0

gen mom=.
replace mom=1 if strpos(lower(cntrymom), "espa") > 0
replace mom=1 if strpos(lower(cntrymom), "pain") > 0 
replace mom=1 if strpos(lower(cntrymom), "badell") > 0 
replace mom=1 if strpos(lower(cntrymom), "elona") > 0
replace mom=1 if strpos(lower(cntrymom), "catalu") > 0
replace mom=1 if strpos(lower(cntrymom), "ña") > 0
replace mom=1 if strmatch(cntrymom, "*ÑA*")>0
replace mom=1 if strmatch(cntrymom, "*atalu*")>0
replace mom=1 if strmatch(cntrymom, "*Espa*")>0
replace mom=1 if strmatch(cntrymom, "*basc*")>0
replace mom=1 if strmatch(cntrymom, "*atalu*")>0
replace mom=1 if strmatch(cntrymom, "*evilla*")>0
replace mom=1 if strmatch(cntrymom, "*grana*")>0
replace mom=1 if strmatch(cntrymom, "*nya*")>0
replace mom=1 if strmatch(cntrymom, "*giron*")>0
replace mom=1 if strmatch(cntrymom, "*galici*")>0
replace mom=1 if strmatch(cntrymom, "*aqu*")>0
replace mom=1 if strmatch(cntrymom, "*adrid*")>0
replace mom=1 if strpos(lower(cntrymom), "tremadura") > 0
replace mom=1 if strpos(lower(cntrymom), "ilbao") > 0
replace mom=1 if strpos(lower(cntrymom), "almeria") > 0
replace mom=1 if strpos(lower(cntrymom), "andalu") > 0
replace mom=1 if strmatch(cntrymom, "*rdoba*")>0
replace mom=1 if strmatch(cntrymom, "*A Bar*")>0

replace mom=0 if cntrymom!=""& mom==.
gen wheremom=cntrymom if mom==0



}

gen spainborn2=.
replace spainborn2=1 if mom==1&dad==1
replace spainborn2=0 if mom==0|dad==0

gen where2=cntrydad if dad==0
replace where2=cntrymom if mom==0 & where2=="" 

gen migrant=.
replace migrant=1 if spainborn==0 | spainborn2==0
replace migrant=0 if spainborn==1 & spainborn2==1
```
###### Repeater
```ruby
gen repeater=.
replace repeater=1 if strpos(lower(rep), "s") > 0
replace repeater=0 if strpos(lower(rep), "no") > 0
replace repeater=99 if strpos(lower(rep), "respon") > 0
```
###### GPA
```ruby
split nmark8_text, generate(notables) parse("|") 

forvalues x=1/5 {
	replace notables`x'="" if strmatch(notables`x', "*Altra*")>0
}

gen notab_lengua=0
forvalues x=1/5 {
	replace notab_lengua=1 if strmatch(notables`x', "*Lleng*")>0
}

gen notab_mates=0
forvalues x=1/5 {
	replace notab_mates=1 if strmatch(notables`x', "*Matem*")>0
}

gen notab_ingles=0
forvalues x=1/5 {
	replace notab_ingles=1 if strmatch(notables`x', "*Angl*")>0
}

gen nmark8=0
replace nmark8=notab_lengua+notab_mates+notab_ingles
replace nmark8=. if nmark8_text==""&privacy==0


split nmark10_text, generate(sobresalientes) parse("|") 

forvalues x=1/5 {
	replace sobresalientes`x'="" if strmatch(sobresalientes`x', "*Altra*")>0
}

gen sobre_lengua=0
forvalues x=1/5 {
	replace sobre_lengua=1 if strmatch(sobresalientes`x', "*Lleng*")>0
}

gen sobre_mates=0
forvalues x=1/5 {
	replace sobre_mates=1 if strmatch(sobresalientes`x', "*Matem*")>0
}

gen sobre_ingles=0
forvalues x=1/5 {
	replace sobre_ingles=1 if strmatch(sobresalientes`x', "*Angl*")>0
}



gen nmark10=0
replace nmark10=sobre_lengua+sobre_mates+sobre_ingles
replace nmark10=. if nmark10_text==""&privacy==0

*New gpa
gen gpa=0
replace gpa=9 if nmark10==3
replace gpa=8 if nmark10==2
replace gpa=7 if nmark10==1
replace gpa=6 if nmark10==0&nmark8==3
replace gpa=5 if nmark10==2&nmark8==0
replace gpa=4 if nmark10==1&nmark8==1
replace gpa=3 if nmark10==0&nmark8==2
replace gpa=2 if nmark10==1&nmark8==0
replace gpa=1 if nmark10==0&nmark8==1
replace gpa=. if privacy==0
gen gpaN=gpa/9
replace gpaN=. if privacy==0
```
###### Goods at and likes
```ruby
gen goodbeforelike=.
replace goodbeforelike=0 if goodnum!=""
replace goodbeforelike=1 if goodnumb!=""

replace goodnum = goodnumb if goodnum==""
replace goodment = goodmenb if goodment==""
replace goodmult = goodmulb if goodmult==""
replace likenum = likenumb if likenum==""
replace likement =likemenb if likement==""
replace likemult  = likemulb   if likemult==""


* Good1
forvalues i = 1(1)1{
capture drop good1
gen good1=.
replace good1=4 if strmatch(goodnum, "Molt bo*")>0
replace good1=3 if strmatch(goodnum, "Bastant bo*")>0 
replace good1=2 if strmatch(goodnum, "Regular*")>0
replace good1=1 if strmatch(goodnum, "Dolent*")>0
replace good1=0 if strmatch(goodnum, "Molt do*")>0   
lab var good1 "Good at solving numerical problems"
lab define goodat 0 "Very bad" 1 "Bad" 2 "Normal" 3 "Good" 4 "Very good"
lab values good1 goodat 
}

* Good2
forvalues i = 1(1)1{
capture drop good2
gen good2=.
replace good2=4 if strmatch(goodment, "Molt bo*")>0
replace good2=3 if strmatch(goodment, "Bastant bo*")>0
replace good2=2 if strmatch(goodment, "Regular*")>0
replace good2=1 if strmatch(goodment, "Dolent*")>0
replace good2=0 if strmatch(goodment, "Molt do*")>0
lab var good2 "Good at mental calculations"
lab values good2 goodat 
}

* Good3
forvalues i = 1(1)1{
capture drop good3
gen good3=.
replace good3=4 if strmatch(goodmult, "Molt bo*")>0
replace good3=3 if strmatch(goodmult, "Bastant bo*")>0
replace good3=2 if strmatch(goodmult, "Regular*")>0
replace good3=1 if strmatch(goodmult, "Dolent*")>0  
replace good3=0 if strmatch(goodmult, "Molt do*")>0
lab var good3 "Good at multiplying"
lab values good3 goodat 

}


* Like1
forvalues i = 1(1)1{
capture drop like1
gen like1=.
replace like1=4 if strmatch(likenum, "Molt*")>0
replace like1=3 if strmatch(likenum, "Bastant*")>0
replace like1=2 if strmatch(likenum, "Ni molt*")>0  
replace like1=1 if strmatch(likenum, "Poc*")>0  
replace like1=0 if strmatch(likenum, "Gens*")>0   
lab var like1 "Enjoys solving numerical problems"
lab define likemath 0 "Not at all" 1 "A little" 2 "Neither too much nor too little" 3 "Pretty much" 4 "A lot"
lab values like1 likemath 
}

* like2
forvalues i = 1(1)1{
capture drop like2
gen like2=.
replace like2=4 if strmatch(likement, "Molt*")>0
replace like2=3 if strmatch(likement, "Bastant*")>0 
replace like2=2 if strmatch(likement, "Ni mol*")>0
replace like2=1 if strmatch(likement, "Poc*")>0  
replace like2=0 if strmatch(likement, "Gens*")>0   
lab var like2 "Enjoys mental calculations"
lab values like2 likemath 
}

* like3
forvalues i = 1(1)1{
capture drop like3
gen like3=.
replace like3=4 if strmatch(likemult, "Molt*")>0
replace like3=3 if strmatch(likemult, "Bastant*")>0
replace like3=2 if strmatch(likemult, "Ni molt*")>0  
replace like3=1 if strmatch(likemult, "Poc*")>0 
replace like3=0 if strmatch(likemult, "Gens*")>0   
lab var like3 "Enjoys multiplying"
lab values like3 likemath 

}
```
###### Mood
```ruby
forvalues i = 1(1)1{
capture drop moodalone
gen moodalone = 0 if strmatch(alone, "*Siempre*")>0 
replace moodalone=1 if strmatch(alone, "*Casi siempre*")>0 
replace moodalone=2 if strmatch(alone, "*Algunas*")>0 
replace moodalone=3 if strmatch(alone, "*Casi nunca*")>0 
replace moodalone=4 if strmatch(alone, "*Nunca*")>0 
label define moodalone 0 "Always" 1 "Usually" 2 "Sometimes" 3 "Rarely" 4 "Never"
label values moodalone moodalone
lab var moodalone "Do you feel alone?"
*notes moodalone: "create at UB_dofile_MVR.do by MVR at 20230419"
}

forvalues i = 1(1)1{
capture drop moodfun
gen moodfun = 0 if  strmatch(fun, "*Nunca*")>0 
replace moodfun=1 if strmatch(fun, "*Casi nunca*")>0 
replace moodfun=2 if strmatch(fun, "*Algunas*")>0 
replace moodfun=3 if strmatch(fun, "*Casi siempre*")>0 
replace moodfun=4 if strmatch(fun, "*Siempre*")>0 
label define mood 0 "Never" 1 "Rarely" 2 "Sometimes" 3 "Usually" 4 "Always"
label values moodfun mood
lab var moodfun "Do you have fun with your friends?"
*notes moodfun: "create at UB_dofile_MVR.do by MVR at 20230419"
}

forvalues i = 1(1)1{
capture drop moodgeneral
gen moodgeneral = 0 if strmatch(general, "*Nunca*")>0 
replace moodgeneral=1 if strmatch(general, "*Casi nunca*")>0 
replace moodgeneral=2 if strmatch(general, "*Algunas*")>0 
replace moodgeneral=3 if strmatch(general, "*Casi siempre*")>0
replace moodgeneral=4 if strmatch(general, "*Siempre*")>0 
label values moodgeneral mood
lab var moodgeneral "How are you doing in school?"
*notes moodgeneral: "create at UB_dofile_MVR.do by MVR at 20230419"

}

gen happy=moodalone+moodfun+moodgeneral
gen happyN=happy/12
```

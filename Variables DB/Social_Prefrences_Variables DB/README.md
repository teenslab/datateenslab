#### Andalucía
```ruby
replace  sp_randomized=0 if socpref1!=""&sp_randomized==.

* socpref1 
forvalues i = 1(1)1{
replace socpref1="A)" if strmatch(sp1_1, "*A*")>0  | strmatch(sp2_1, "*A*")>0 | strmatch(sp3_2, "*A*")>0 | strmatch(sp4_3, "*A*")>0 | strmatch(sp5_3, "*A*")>0 |strmatch(sp6_2, "*A*")>0 
replace socpref1="B)" if strmatch(sp1_1, "*B*")>0  |strmatch(sp2_1, "*B*")>0 |strmatch(sp3_2, "*B*")>0 |strmatch(sp4_3, "*B*")>0|strmatch(sp5_3, "*B*")>0 |strmatch(sp6_2, "*B*")>0 |strmatch(sp1_1, "*b*")>0  |strmatch(sp2_1, "*b*")>0 |strmatch(sp3_2, "*b*")>0 |strmatch(sp4_3, "*b*")>0|strmatch(sp5_3, "*b*")>0 |strmatch(sp6_2, "*b*")>0 
*notes socpref1: "create at UB_dofile_MVR.do by MVR at 20230419"
} 

* socpref2 
forvalues i = 1(1)1{
replace socpref2="A)" if strmatch(sp1_2, "*A*")>0  |strmatch(sp2_3, "*A*")>0 |strmatch(sp3_3, "*A*")>0 |strmatch(sp4_2, "*A*")>0|strmatch(sp5_1, "*A*")>0 |strmatch(sp6_1, "*A*")>0 
replace socpref2="B)" if strmatch(sp1_2, "*B*")>0  |strmatch(sp2_3, "*B*")>0 |strmatch(sp3_3, "*B*")>0 |strmatch(sp4_2, "*B*")>0|strmatch(sp5_1, "*B*")>0 |strmatch(sp6_1, "*B*")>0 |strmatch(sp1_2, "*b*")>0  |strmatch(sp2_3, "*b*")>0 |strmatch(sp3_3, "*b*")>0 |strmatch(sp4_2, "*b*")>0|strmatch(sp5_1, "*b*")>0 |strmatch(sp6_1, "*b*")>0 
*notes socpref2: "create at UB_dofile_MVR.do by MVR at 20230419"
} 

* socpref3 
forvalues i = 1(1)1{
replace socpref3="A)" if strmatch(sp1_3, "*A*")>0  |strmatch(sp2_2, "*A*")>0 |strmatch(sp3_1, "*A*")>0 |strmatch(sp4_1, "*A*")>0|strmatch(sp5_2, "*A*")>0 |strmatch(sp6_3, "*A*")>0 
replace socpref3="B)" if strmatch(sp1_3, "*B*")>0  |strmatch(sp2_2, "*B*")>0 |strmatch(sp3_1, "*B*")>0 |strmatch(sp4_1, "*B*")>0|strmatch(sp5_2, "*B*")>0 |strmatch(sp6_3, "*B*")>0 |strmatch(sp1_3, "*b*")>0  |strmatch(sp2_2, "*b*")>0 |strmatch(sp3_1, "*b*")>0 |strmatch(sp4_1, "*b*")>0|strmatch(sp5_2, "*b*")>0 |strmatch(sp6_3, "*b*")>0 
*notes socpref3: "create at UB_dofile_MVR.do by MVR at 20230419"
} 

*First version
gen sp1_v1=.
replace sp1_v1=0 if strpos(lower(socpref1), "a") > 0 
replace sp1_v1=1 if strpos(lower(socpref1), "b") > 0 

gen sp2_v1=.
replace sp2_v1=0 if strpos(lower(socpref2), "a") > 0 
replace sp2_v1=1 if strpos(lower(socpref2), "b") > 0 

gen sp3_v1=.
replace sp3_v1=0 if strpos(lower(socpref3), "a") > 0 
replace sp3_v1=1 if strpos(lower(socpref3), "b") > 0 

*Second version
gen sp1_v2=.
replace sp1_v2=0 if strpos(lower(sp1), "a") > 0 
replace sp1_v2=1 if strpos(lower(sp1), "b") > 0 

gen sp2_v2=.
replace sp2_v2=0 if strpos(lower(sp2), "a") > 0 
replace sp2_v2=1 if strpos(lower(sp2), "b") > 0 

gen sp3_v2=.
replace sp3_v2=0 if strpos(lower(sp3), "a") > 0 
replace sp3_v2=1 if strpos(lower(sp3), "b") > 0 

gen sp4_v2=.
replace sp4_v2=0 if strpos(lower(sp4), "a") > 0 
replace sp4_v2=1 if strpos(lower(sp4), "b") > 0 

gen sp5_v2=.
replace sp5_v2=0 if strpos(lower(sp5), "a") > 0 
replace sp5_v2=1 if strpos(lower(sp5), "b") > 0 

gen sp6_v2=.
replace sp6_v2=0 if strpos(lower(sp6), "a") > 0 
replace sp6_v2=1 if strpos(lower(sp6), "b") > 0
```


#### Cataluña
```ruby
* socpref1 
forvalues i = 1(1)1{
gen socpref1=""
replace socpref1="A)" if strmatch(sp1_1, "*A*")>0  | strmatch(sp2_1, "*A*")>0 | strmatch(sp3_2, "*A*")>0 | strmatch(sp4_3, "*A*")>0 | strmatch(sp5_3, "*A*")>0 |strmatch(sp6_2, "*A*")>0 
replace socpref1="B)" if strmatch(sp1_1, "*B*")>0  |strmatch(sp2_1, "*B*")>0 |strmatch(sp3_2, "*B*")>0 |strmatch(sp4_3, "*B*")>0|strmatch(sp5_3, "*B*")>0 |strmatch(sp6_2, "*B*")>0 |strmatch(sp1_1, "*b*")>0  |strmatch(sp2_1, "*b*")>0 |strmatch(sp3_2, "*b*")>0 |strmatch(sp4_3, "*b*")>0|strmatch(sp5_3, "*b*")>0 |strmatch(sp6_2, "*b*")>0 
*notes socpref1: "create at UB_dofile_MVR.do by MVR at 20230419"
} 

* socpref2 
forvalues i = 1(1)1{
gen socpref2=""
replace socpref2="A)" if strmatch(sp1_2, "*A*")>0  |strmatch(sp2_3, "*A*")>0 |strmatch(sp3_3, "*A*")>0 |strmatch(sp4_2, "*A*")>0|strmatch(sp5_1, "*A*")>0 |strmatch(sp6_1, "*A*")>0 
replace socpref2="B)" if strmatch(sp1_2, "*B*")>0  |strmatch(sp2_3, "*B*")>0 |strmatch(sp3_3, "*B*")>0 |strmatch(sp4_2, "*B*")>0|strmatch(sp5_1, "*B*")>0 |strmatch(sp6_1, "*B*")>0 |strmatch(sp1_2, "*b*")>0  |strmatch(sp2_3, "*b*")>0 |strmatch(sp3_3, "*b*")>0 |strmatch(sp4_2, "*b*")>0|strmatch(sp5_1, "*b*")>0 |strmatch(sp6_1, "*b*")>0 
*notes socpref2: "create at UB_dofile_MVR.do by MVR at 20230419"
} 

* socpref3 
forvalues i = 1(1)1{
gen socpref3=""
replace socpref3="A)" if strmatch(sp1_3, "*A*")>0  |strmatch(sp2_2, "*A*")>0 |strmatch(sp3_1, "*A*")>0 |strmatch(sp4_1, "*A*")>0|strmatch(sp5_2, "*A*")>0 |strmatch(sp6_3, "*A*")>0 
replace socpref3="B)" if strmatch(sp1_3, "*B*")>0  |strmatch(sp2_2, "*B*")>0 |strmatch(sp3_1, "*B*")>0 |strmatch(sp4_1, "*B*")>0|strmatch(sp5_2, "*B*")>0 |strmatch(sp6_3, "*B*")>0 |strmatch(sp1_3, "*b*")>0  |strmatch(sp2_2, "*b*")>0 |strmatch(sp3_1, "*b*")>0 |strmatch(sp4_1, "*b*")>0|strmatch(sp5_2, "*b*")>0 |strmatch(sp6_3, "*b*")>0 
*notes socpref3: "create at UB_dofile_MVR.do by MVR at 20230419"
} 


replace sp_randomized=. if socpref1==""
replace sp_randomized=1 if socpref1!=""


*First version
gen sp1_v1=.
replace sp1_v1=0 if strpos(lower(socpref1), "a") > 0 
replace sp1_v1=1 if strpos(lower(socpref1), "b") > 0 

gen sp2_v1=.
replace sp2_v1=0 if strpos(lower(socpref2), "a") > 0 
replace sp2_v1=1 if strpos(lower(socpref2), "b") > 0 

gen sp3_v1=.
replace sp3_v1=0 if strpos(lower(socpref3), "a") > 0 
replace sp3_v1=1 if strpos(lower(socpref3), "b") > 0 

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

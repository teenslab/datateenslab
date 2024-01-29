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
```

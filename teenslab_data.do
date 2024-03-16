* ----------------------------------
* Title: TeensLab Data Analysis
* Author: Mónica Vasco et al.
* Date: 15/07/2023
* Update: 15/03/2024
* Description: This script performs basic analysis on the TeensLab Data.
* ----------------------------------


* Clear memory and load data
clear all
set more off


* Load the dataset
use "BBDD_20240314.dta"

 
describe    // Provides information about the dataset structure
summarize   // Calculates summary statistics for all numerical variables in the dataset

* Number of observations: 5,890

distinct usuario_id // Counts the number of unique 'usuario_id'

/*
            |        Observations
            |      total   distinct
------------+----------------------
 usuario_id |       5890       5890

 
*/


* Observations that complete the survey: 5,281

tabulate dropout

/*

    Did not |
 finish the |
     survey |      Freq.     Percent        Cum.
------------+-----------------------------------
          0 |      5,281       89.66       89.66
          1 |        609       10.34      100.00
------------+-----------------------------------
      Total |      5,890      100.00

	  
*/

* Number of schools: 33

distinct school // Counts the number of unique 'school' values

/*
        |        Observations
        |      total   distinct
--------+----------------------
 school |       5890         33

*/



* ----------------------------------
* Descriptive analysis of variables
* ----------------------------------

*****************************
**** 1. SOCIODEMOGRAPHIC ****
*****************************

tabulate gender

/*

             gender  |      Freq.     Percent        Cum.
---------------------+-----------------------------------
                Male |      2,926       49.68       49.68
              Female |      2,926       49.68       99.35
               Other |          8        0.14       99.49
Prefer not to answer |         30        0.51      100.00
---------------------+-----------------------------------
               Total |      5,890      100.00

*/

summarize age

/*

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
         age |      5,859    14.10326    1.941555         10         23

*/ 

tabulate age

/*

Age assumed |
    by mode |      Freq.     Percent        Cum.
------------+-----------------------------------
         10 |          1        0.02        0.02
         11 |        206        3.52        3.53
         12 |      1,049       17.90       21.44
         13 |      1,209       20.63       42.07
         14 |      1,206       20.58       62.66
         15 |      1,074       18.33       80.99
         16 |        604       10.31       91.30
         17 |        241        4.11       95.41
         18 |         61        1.04       96.45
         19 |         74        1.26       97.71
         20 |         71        1.21       98.92
         21 |         26        0.44       99.37
         22 |         26        0.44       99.81
         23 |         11        0.19      100.00
------------+-----------------------------------
      Total |      5,859      100.00


*/

histogram age, discrete percent addlabel

* * Generate 'migrant' variable with missing values. Assign value 1 to 'migrant' if either the subjects or their parents (just one of them is enough) equals 1
gen migrant=.
replace migrant=1 if migrant_firstgen==1| migrant_secondgen==1
replace migrant=0 if migrant_firstgen==0& migrant_secondgen==0
replace migrant=99 if (migrant_firstgen==99| migrant_secondgen==99)&migrant==.

tabulate migrant
/*

    migrant |      Freq.     Percent        Cum.
------------+-----------------------------------
         No |      4,825       82.37       82.37
        Yes |        990       16.90       99.27
        PNS |         43        0.73      100.00
------------+-----------------------------------
      Total |      5,858      100.00


*/

****************
**** 2. GPA ****
**************** 

* Split nmark8_text variable into separate variables using "|" as the delimiter
split nmark8_text, generate(nmark8_) parse("|") 


 *Replace missing values with empty strings for cases containing other subject = "otra" in any nmark8_ variable
forvalues x=1/4 {
	replace nmark8_`x'="" if strmatch(nmark8_`x', "*Otra*")>0
}

* Create indicator variable (notab_lengua) for Literature subject = "Lengua" 
gen notab_lengua=0
forvalues x=1/4 {
	replace notab_lengua=1 if strmatch(nmark8_`x', "*Lengua*")>0
}
replace notab_lengua=1 if strmatch(literature, "*7*")>0|strmatch(literature, "*8*")>0


* Create indicator variable (notab_mates) for Maths
gen notab_mates=0
forvalues x=1/4 {
	replace notab_mates=1 if strmatch(nmark8_`x', "*Matem*")>0
}
replace notab_mates=1 if strmatch(maths, "*7*")>0|strmatch(maths, "*8*")>0

* Create indicator variable (notab_ingles) for English subject
gen notab_ingles=0
forvalues x=1/4 {
	replace notab_ingles=1 if strmatch(nmark8_`x', "*Ing*")>0
}
replace notab_ingles=1 if strmatch(english, "*7*")>0|strmatch(english, "*8*")>0

* Calculate total number of B in these subjects (nmark8)
gen nmark8=0
replace nmark8=notab_lengua+notab_mates+notab_ingles
replace nmark8=. if nmark8_text==""&privacy==0


* Split nmark10_text variable into separate variables using "|" as the delimiter
split nmark10_text, generate(nmark10_) parse("|") 

* Replace missing values with empty strings for cases containing other subject="otra" in any nmark10_ variable
forvalues x=1/4 {
	replace nmark10_`x'="" if strmatch(nmark10_`x', "*Otra*")>0
}

* Create indicator variable (sobre_lengua) for "Lengua" subjects
gen sobre_lengua=0
forvalues x=1/4 {
	replace sobre_lengua=1 if strmatch(nmark10_`x', "*Lengua*")>0
}
replace sobre_lengua=1 if strmatch(literature, "*9*")>0|strmatch(literature, "*10*")>0

* Create indicator variable (sobre_mates) for "Matem" subjects
gen sobre_mates=0
forvalues x=1/4 {
	replace sobre_mates=1 if strmatch(nmark10_`x', "*Matem*")>0
}
replace sobre_mates=1 if strmatch(maths, "*9*")>0|strmatch(maths, "*10*")>0


* Create indicator variable (sobre_ingles) for "Ing" subjects
gen sobre_ingles=0
forvalues x=1/4 {
	replace sobre_ingles=1 if strmatch(nmark10_`x', "*Ing*")>0
}
replace sobre_ingles=1 if strmatch(english, "*9*")>0|strmatch(english, "*10*")>0

* Calculate total number of A in  these subjects (nmark10)
gen nmark10=0
replace nmark10=sobre_lengua+sobre_mates+sobre_ingles
replace nmark10=. if nmark10_text==""&privacy==0

* Generate GPA values based on nmark8 and nmark10 variables
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


**********************************
**** 3. ECONOMICS PREFERENCES ****
**********************************

* A. TIME DISCOUNTING

*money1...6==0 -> option A
*money1...6==1 -> option B

* Patience
forvalues i = 1(1)1{
capture drop patience
gen patience=money1+money2+money3+money4+money5+money6
lab var patience "Time discounting total: Patience"
*notes patience: "create at ES_dofile_MVR.do by MVR at 20230715"
}

* Normalized Patience 
forvalues i = 1(1)1{
capture drop patienceN
gen patienceN=patience/6
lab var patienceN "Normalized Patience"
*notes patienceN: "create at ES_dofile_MVR.do by MVR at 20230715"
}


* Consistency Time Discounting
forvalues i = 1(1)1{
capture drop cns_td
gen cns_td=1 if money1==1 | money1==0
replace cns_td=0 if money1==1 & money2==0
replace cns_td=0 if money2==1 & money3==0
replace cns_td=0 if money3==1 & money4==0
replace cns_td=0 if money4==1 & money5==0
replace cns_td=0 if money5==1 & money6==0	
lab var cns_td "Consistency Time discounting"
*notes cns_td: "create at ES_dofile_MVR.do by MVR at 20230715"
} 


* B. RISK PREFERENCES


*prob1...6==0 -> option A
*prob1...6==1 -> option B


* Risky: HL Total
forvalues i = 1(1)1{
capture drop risky
gen risky = prob1+prob2+prob3+prob4+prob5+prob6
lab var risky "HL Total"
*notes risky: "create at ES_dofile_MVR.do by MVR at 20230715"
}

* Normalized HL Total
forvalues i = 1(1)1{
capture drop riskyN
gen riskyN = risky/6
lab var riskyN "Normalized HL total"
*notes riskyN: "create at ES_dofile_MVR.do by MVR at 20230715"
}

* Dominated responses
forvalues i = 1(1)1{
capture drop dominated1
gen dominated1 =0 if prob1 ==1|prob1 ==0
replace dominated1=1 if prob1==1
lab var dominated1 "Dominated 1"
*notes dominated1: "create at ES_dofile_MVR.do by MVR at 20230715"
}

forvalues i = 1(1)1{
capture drop dominated6
gen dominated6 =0 if prob6 ==1|prob6 ==0
replace dominated6=1 if prob6==0
lab var dominated6 "Dominated 6"
*notes dominated6: "create at ES_dofile_MVR.do by MVR at 20230715"
}

* Switch back
forvalues i = 1(1)1{
capture drop swb_risk
gen swb_risk = 1 if prob1==1 & prob2 ==0
replace swb_risk = 1 if prob2==1 & prob3 ==0
replace swb_risk = 1 if prob3==1 & prob4 ==0
replace swb_risk = 1 if prob4==1 & prob5 ==0
replace swb_risk = 1 if prob5==1 & prob6 ==0
replace swb_risk = 0 if prob1==1 & prob2 ==1 & prob3==1 & prob4==1  & prob5==1 & prob6==1 
replace swb_risk = 0 if prob1==0 & prob2 ==0 & prob3==0 & prob4==0  & prob5==0 & prob6==0 
replace swb_risk = 0 if prob1==0 & prob2 ==1 & prob3==1 & prob4==1  & prob5==1 & prob6==1 
replace swb_risk = 0 if prob1==0 & prob2 ==0 & prob3==1 & prob4==1  & prob5==1 & prob6==1 
replace swb_risk = 0 if prob1==0 & prob2 ==0 & prob3==0 & prob4==1  & prob5==1 & prob6==1 
replace swb_risk = 0 if prob1==0 & prob2 ==0 & prob3==0 & prob4==0  & prob5==1 & prob6==1 
replace swb_risk = 0 if prob1==0 & prob2 ==0 & prob3==0 & prob4==0  & prob5==0 & prob6==1 
lab var swb_risk "Switch back HL"
*notes swb_risk: "create at ES_dofile_MVR.do by MVR at 20230715"
}

* Consistency HL
forvalues i = 1(1)1{
capture drop cns_risk
gen cns_risk=0 if swb_risk==1|dominated1==1|dominated6==1
replace cns_risk=1 if dominated1==0 &dominated6==0 &swb_risk==0
lab var cns_risk "Consistency Risk"
*notes cns_risk: "create at ES_dofile_MVR.do by MVR at 20230715"
} 


* C. Probabilistic knowledge 

gen delavande_apple=0 if delavande__apple20!=.
gen delavande_rice=0 if delavande__ricemoth!=.
gen delavande_limits=0 if  delavande__bath100!=.

*Assign value 1 if the fist value is is greater than the second
replace  delavande_apple=1 if delavande__apple20>delavande__apple10
replace delavande_rice=1 if delavande__ricemoth>=delavande__riceweek
replace delavande_limits=1 if delavande__bath100>delavande__sch0

*Calculate the total of good answers
gen delavande_total=.
replace delavande_total=0 if delavande__bath100!=.
replace delavande_total=delavande_apple+delavande_rice+delavande_limits


* D. TIME DISCOUNTING II:  staircase version

* Generate a indicator of the patience level in this task
gen patienceC=.
replace patienceC=1 if strmatch(tpc111, "*10*")>0
replace patienceC=2 if strmatch(tpc111, "*20*")>0
replace patienceC=3 if strmatch(tpc112, "*10*")>0
replace patienceC=4 if strmatch(tpc112, "*16*")>0
replace patienceC=5 if strmatch(tpc221, "*10*")>0
replace patienceC=6 if strmatch(tpc221, "*13*")>0
replace patienceC=7 if strmatch(tpc222, "*10*")>0
replace patienceC=8 if strmatch(tpc222, "*11*")>0


*********************************************************
save, replace





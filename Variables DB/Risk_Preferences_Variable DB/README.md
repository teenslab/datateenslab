#### Andalucía
```ruby
rename probabilidad__a hl1
rename probabilidad__b hl2
rename probabilidad__c hl3
rename probabilidad__d hl4
rename probabilidad__e hl5
rename probabilidad__f hl6

replace newdesignhl=0 if newdesignhl==.&hl1!=""

* Risk aversion
forvalues i = 1(1)1{
capture drop prob*
forvalues x=1/6 {
	gen prob`x'=.
	replace prob`x'=0 if strmatch(hl`x', "*A*")>0
	replace prob`x'=1 if strmatch(hl`x', "*B*")>0
	label values prob`x' AB
	lab var prob`x' "Holt-Laury"
    *notes prob`x': "create at UB_dofile_MVR.do by MVR at 20230419"
}
}


* Risky: HL Total
forvalues i = 1(1)1{
capture drop risky
gen risky = prob1+prob2+prob3+prob4+prob5+prob6
lab var risky "HL Total"
*notes risky: "create at UB_dofile_MVR.do by MVR at 20230419"
}

* Normalized HL Total
forvalues i = 1(1)1{
capture drop riskyN
gen riskyN = risky/6
lab var riskyN "Normalized HL total"
*notes riskyN: "create at UB_dofile_MVR.do by MVR at 20230419"
}

* Dominated responses
forvalues i = 1(1)1{
capture drop dominated1
gen dominated1 =0 if prob1 ==1|prob1 ==0
replace dominated1=1 if prob1==1
lab var dominated1 "Dominated 1"
}

forvalues i = 1(1)1{
capture drop dominated6
gen dominated6 =0 if prob6 ==1|prob6 ==0
replace dominated6=1 if prob6==0
lab var dominated6 "Dominated 6"
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
*notes swb_risk: "create at UB_dofile_MVR.do by MVR at 20230419"
}

* Consistency HL
forvalues i = 1(1)1{
capture drop cns_risk
gen cns_risk=0 if swb_risk==1|dominated1==1|dominated6==1
replace cns_risk=1 if dominated1==0 &dominated6==0 &swb_risk==0
lab var cns_risk "Consistency Risk"
*notes cns_risk: "create at UB_dofile_MVR.do by MVR at 20230419"
} 


forvalues i = 1(1)1{
capture drop incns_risk
gen incns_risk=1-cns_risk
lab var incns_risk "Incnsistency Risk"
*notes incns_risk: "create at UB_dofile_MVR.do by MVR at 20230419"
} 
```
#### Cataluña
```ruby
forvalues x=1/6{
	gen hl`x'=hlb`x' if hlb`x'!=""
	replace hl`x'=hlc`x' if hlc`x'!=""
	replace hl`x'=hld`x' if hld`x'!=""
}

gen newdesignhl=1 if study>2500&hl1!=""
replace newdesignhl=0 if study<2500&hl1!=""


* Risk aversion
forvalues i = 1(1)1{
capture drop prob*
forvalues x=1/6 {
	gen prob`x'=.
	replace prob`x'=0 if strmatch(hl`x', "*A*")>0
	replace prob`x'=1 if strmatch(hl`x', "*B*")>0
	label values prob`x' AB
	lab var prob`x' "Holt-Laury"
    *notes prob`x': "create at UB_dofile_MVR.do by MVR at 20230419"
}
}


* Risky: HL Total
forvalues i = 1(1)1{
capture drop risky
gen risky = prob1+prob2+prob3+prob4+prob5+prob6
lab var risky "HL Total"
*notes risky: "create at UB_dofile_MVR.do by MVR at 20230419"
}

* Normalized HL Total
forvalues i = 1(1)1{
capture drop riskyN
gen riskyN = risky/6
lab var riskyN "Normalized HL total"
*notes riskyN: "create at UB_dofile_MVR.do by MVR at 20230419"
}

* Dominated responses
forvalues i = 1(1)1{
capture drop dominated1
gen dominated1 =0 if prob1 ==1|prob1 ==0
replace dominated1=1 if prob1==1
lab var dominated1 "Dominated 1"
}

forvalues i = 1(1)1{
capture drop dominated6
gen dominated6 =0 if prob6 ==1|prob6 ==0
replace dominated6=1 if prob6==0
lab var dominated6 "Dominated 6"
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
*notes swb_risk: "create at UB_dofile_MVR.do by MVR at 20230419"
}

* Consistency HL
forvalues i = 1(1)1{
capture drop cns_risk
gen cns_risk=0 if swb_risk==1|dominated1==1|dominated6==1
replace cns_risk=1 if dominated1==0 &dominated6==0 &swb_risk==0
lab var cns_risk "Consistency Risk"
*notes cns_risk: "create at UB_dofile_MVR.do by MVR at 20230419"
} 


forvalues i = 1(1)1{
capture drop incns_risk
gen incns_risk=1-cns_risk
lab var incns_risk "Incnsistency Risk"
*notes incns_risk: "create at UB_dofile_MVR.do by MVR at 20230419"
} 
```

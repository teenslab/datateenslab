split bullying, generate(bu) parse(|) destring

* SELF-REPORTED
forvalues i = 1(1)1{
*capture drop self_bullying
gen self_bullying=0 
replace self_bullying=1 if  bu1== usuario_id| bu2== usuario_id| bu3== usuario_id
replace self_bullying=1 if bu1==3499|bu2==3499|bu3==3499|bu1==4118|bu2==4118|bu3==4118 |bu1==4824|bu2==4824|bu3==4824|bu1==5043|bu2==5043|bu3==5043|bu1==4921|bu2==4921|bu3==4921|bu1==3370|bu2==3370|bu3==3370|bu1==5600|bu2==5600|bu3==5600|bu1==5142|bu2==5142|bu3==5142|bu1==4265|bu2==4265|bu3==4265
replace self_bullying=. if privacy==0
lab var self_bullying "Self-reported bullying"
} 

* OTHERS-REPORTED
forvalues x=1/3 {
	sort bu`x'
	gen bu`x'_`x'=bu`x'
	replace bu`x'_`x'=. if bu`x'==usuario_id
	replace bu`x'_`x'=. if bu`x'== 3499|bu`x'==4118|bu`x'==4824|bu`x'==5043|bu`x'==4921|bu`x'==3370|bu`x'==5600|bu`x'==5142|bu`x'==4265
	sort bu`x'_`x'
	bysort bu`x'_`x': egen n_others`x'=count(bu`x'_`x')
	replace n_others`x'=0 if bu`x'==.
	vlookup usuario_id, generate(others_bu`x') key( bu`x'_`x' ) value(n_others`x')
	replace others_bu`x'=0 if others_bu`x'==.
    drop bu`x'_`x' n_others`x' 
}

gen n_others_bullying=0
replace n_others_bullying=others_bu1+others_bu2+others_bu3
drop others_bu1 others_bu2 others_bu3

gen others_bullying=0
replace others_bullying=1 if n_others_bullying!=0

drop bu1 bu2 bu3 

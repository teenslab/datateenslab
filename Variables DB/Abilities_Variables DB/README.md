#### First wave (schoolprov= 1-5)
```ruby
rename adivinanzas__padre emily 

* CRT1: Emilia 
forvalues i = 1(1)1{
capture drop crt1
gen crt1=0
replace crt1=. if emily==""
replace crt1=1 if strpos(lower(emily), "emi") > 0
replace crt1=1 if strpos(lower(emily), "lia") > 0
replace crt1=0 if strpos(lower(emily), "ju") > 0
lab var crt1 "Emily"
*notes crt1: "create at UB_dofile_MVR.do by MVR at 20230419"
}

rename adivinanzas__biblioteca library
* CRT2: Biblioteca
forvalues i = 1(1)1{
capture drop crt2
gen crt2=0
replace crt2=1 if strpos(lower(library), "47") > 0
replace crt2=. if library=="" 
lab var crt2 "Library"
*notes crt2: "create at UB_dofile_MVR.do by MVR at 20230419"
}


rename adivinanzas__carrera run
* CRT3: Carrera
forvalues i = 1(1)1{
capture drop crt3
gen crt3=0
replace crt3=1 if run=="2"
replace crt3=. if run=="" 
lab var crt3 "Race"
*notes crt3: "create at UB_dofile_MVR.do by MVR at 20230419"
}


rename adivinanzas__loteria lottery
rename adivinanzas__ahorros_a bank1
rename adivinanzas__ahorros_b bank2

* FIN1: Loteria
forvalues i = 1(1)1{
capture drop fin1
gen fin1=0
replace fin1=1 if lottery=="400000"
replace fin1=. if lottery=="" 
lab var fin1 "Lottery"
*notes fin1: "create at UB_dofile_MVR.do by MVR at 20230419"
}

* FIN2: Banco1
forvalues i = 1(1)1{
capture drop fin2
gen fin2=0
replace fin2=1 if bank1=="121"
replace fin2=. if bank1=="" 
lab var fin2 "Bank1"
*notes fin2: "create at UB_dofile_MVR.do by MVR at 20230419"
}

* FIN3: Banco2
forvalues i = 1(1)1{
capture drop fin3
gen fin3=0
replace fin3=1 if strmatch(bank2, "*Más de 102*")>0 
replace fin3=. if bank2=="" 
lab var fin3 "Bank2"
*notes fin3: "create at UB_dofile_MVR.do by MVR at 20230419"
}


* CRT total
forvalues i = 1(1)1{
capture drop crttotal
gen crttotal=crt1+crt2+crt3 
lab var crttotal "CRT total"
*notes crttotal: "create at UB_dofile_MVR.do by MVR at 20230419"
}

* Normalized CRT total
forvalues i = 1(1)1{
capture drop crtN
gen crtN=crttotal/3
lab var crtN "Normalized CRT total"
*notes crtN: "create at UB_dofile_MVR.do by MVR at 20230419"
}

* FIN Total
forvalues i = 1(1)1{
capture drop fintotal
gen fintotal=fin1+fin2+fin3 
lab var fintotal "FIN total"
*notes fintotal: "create at UB_dofile_MVR.do by MVR at 20230419"
}

* Normalized FIN Total
forvalues i = 1(1)1{
capture drop finN
gen finN=fintotal/3
lab var finN "Normalized FIN total"
*notes finN: "create at UB_dofile_MVR.do by MVR at 20230419"
}
```
#### Second wave (schoolprov= 6)
```ruby
rename emilia adivinanzas__padre 
rename library adivinanzas__biblioteca 
rename carrera adivinanzas__carrera 
rename fin1 adivinanzas__loteria 
rename fin2 adivinanzas__ahorros_a 
rename fin3 adivinanzas__ahorros_b

rename adivinanzas__padre emily 

* CRT1: Emilia 
forvalues i = 1(1)1{
capture drop crt1
gen crt1=0
replace crt1=. if emily==""
replace crt1=1 if strpos(lower(emily), "emi") > 0
replace crt1=1 if strpos(lower(emily), "lia") > 0
replace crt1=0 if strpos(lower(emily), "ju") > 0
lab var crt1 "Emily"
*notes crt1: "create at UB_dofile_MVR.do by MVR at 20230419"
}

rename adivinanzas__biblioteca library
* CRT2: Biblioteca
forvalues i = 1(1)1{
capture drop crt2
gen crt2=0
replace crt2=1 if strmatch(library, "47")>0 
replace crt2=. if library=="" 
lab var crt2 "Library"
*notes crt2: "create at UB_dofile_MVR.do by MVR at 20230419"
}


rename adivinanzas__carrera run
* CRT3: Carrera
forvalues i = 1(1)1{
capture drop crt3
gen crt3=0
replace crt3=1 if run=="2"
replace crt3=. if run=="" 
lab var crt3 "Race"
*notes crt3: "create at UB_dofile_MVR.do by MVR at 20230419"
}


rename adivinanzas__loteria lottery
rename adivinanzas__ahorros_a bank1
rename adivinanzas__ahorros_b bank2

* FIN1: Loteria
forvalues i = 1(1)1{
capture drop fin1
gen fin1=0
replace fin1=1 if lottery=="400000"
replace fin1=. if lottery=="" 
lab var fin1 "Lottery"
*notes fin1: "create at UB_dofile_MVR.do by MVR at 20230419"
}

* FIN2: Banco1
forvalues i = 1(1)1{
capture drop fin2
gen fin2=0
replace fin2=1 if bank1=="121"
replace fin2=. if bank1=="" 
lab var fin2 "Bank1"
*notes fin2: "create at UB_dofile_MVR.do by MVR at 20230419"
}

* FIN3: Banco2
forvalues i = 1(1)1{
capture drop fin3
gen fin3=0
replace fin3=1 if strmatch(bank2, "*Más de 102*")>0 
replace fin3=. if bank2=="" 
lab var fin3 "Bank2"
*notes fin3: "create at UB_dofile_MVR.do by MVR at 20230419"
}

* CRT total
forvalues i = 1(1)1{
capture drop crttotal
gen crttotal=crt1+crt2+crt3 
lab var crttotal "CRT total"
*notes crttotal: "create at UB_dofile_MVR.do by MVR at 20230419"
}

* Normalized CRT total
forvalues i = 1(1)1{
capture drop crtN
gen crtN=crttotal/3
lab var crtN "Normalized CRT total"
*notes crtN: "create at UB_dofile_MVR.do by MVR at 20230419"
}

* FIN Total
forvalues i = 1(1)1{
capture drop fintotal
gen fintotal=fin1+fin2+fin3 
lab var fintotal "FIN total"
*notes fintotal: "create at UB_dofile_MVR.do by MVR at 20230419"
}

* Normalized FIN Total
forvalues i = 1(1)1{
capture drop finN
gen finN=fintotal/3
lab var finN "Normalized FIN total"
*notes finN: "create at UB_dofile_MVR.do by MVR at 20230419"
}
```

```

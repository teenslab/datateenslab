#### Andalucía
```ruby
destring delavande__apple20 delavande__apple10 delavande__riceweek delavande__ricemoth delavande__sch0 delavande__bath100 delavande__uni delavande__study, replace

replace delavande_slider=0 if delavande__apple20!=.&delavande_slider==.

* delavande__apple20
forvalues i = 1(1)1{
replace delavande__apple20=abs(delavande__apple20)
replace delavande__apple20=999 if (delavande__apple20>100 | delavande__apple20<0) &delavande__apple20!=.
} 

* delavande__apple10
forvalues i = 1(1)1{
replace delavande__apple10=abs(delavande__apple10)
replace delavande__apple10=999 if (delavande__apple10>100 | delavande__apple10<0) &delavande__apple10!=.
} 

* delavande__riceweek
forvalues i = 1(1)1{
replace delavande__riceweek=abs(delavande__riceweek)
replace delavande__riceweek=999 if (delavande__riceweek>100 | delavande__riceweek<0) &delavande__riceweek!=.
} 

* delavande__ricemoth
forvalues i = 1(1)1{
replace delavande__ricemoth=abs(delavande__ricemoth)
replace delavande__ricemoth=999 if (delavande__ricemoth>100 | delavande__ricemoth<0) &delavande__ricemoth!=.
} 

* delavande__sch0
forvalues i = 1(1)1{
replace delavande__sch0=abs(delavande__sch0)
replace delavande__sch0=999 if (delavande__sch0>100 | delavande__sch0<0) &delavande__sch0!=.
} 

* delavande__bath100
forvalues i = 1(1)1{
replace delavande__bath100=abs(delavande__bath100)
replace delavande__bath100=999 if (delavande__bath100>100 | delavande__bath100<0) &delavande__bath100!=.
} 

* delavande__uni
forvalues i = 1(1)1{
replace delavande__uni=abs(delavande__uni)
replace delavande__uni=999 if (delavande__uni>100 | delavande__uni<0) &delavande__uni!=.
} 

* delavande__study
forvalues i = 1(1)1{
replace delavande__study=abs(delavande__study)
replace delavande__study=999 if (delavande__study>100 | delavande__study<0) &delavande__study!=.
} 
```

#### Cataluña
```ruby
destring delavande__apple20 delavande__apple10 delavande__riceweek delavande__ricemoth delavande__sch0 delavande__bath100 delavande__uni delavande__study, replace

replace delavande_slider=0 if delavande__apple20!=.&delavande_slider==.

* delavande__apple20
forvalues i = 1(1)1{
replace delavande__apple20=abs(delavande__apple20)
replace delavande__apple20=999 if (delavande__apple20>100 | delavande__apple20<0) &delavande__apple20!=.
} 

* delavande__apple10
forvalues i = 1(1)1{
replace delavande__apple10=abs(delavande__apple10)
replace delavande__apple10=999 if (delavande__apple10>100 | delavande__apple10<0) &delavande__apple10!=.
} 

* delavande__riceweek
forvalues i = 1(1)1{
replace delavande__riceweek=abs(delavande__riceweek)
replace delavande__riceweek=999 if (delavande__riceweek>100 | delavande__riceweek<0) &delavande__riceweek!=.
} 

* delavande__ricemoth
forvalues i = 1(1)1{
replace delavande__ricemoth=abs(delavande__ricemoth)
replace delavande__ricemoth=999 if (delavande__ricemoth>100 | delavande__ricemoth<0) &delavande__ricemoth!=.
} 

* delavande__sch0
forvalues i = 1(1)1{
replace delavande__sch0=abs(delavande__sch0)
replace delavande__sch0=999 if (delavande__sch0>100 | delavande__sch0<0) &delavande__sch0!=.
} 

* delavande__bath100
forvalues i = 1(1)1{
replace delavande__bath100=abs(delavande__bath100)
replace delavande__bath100=999 if (delavande__bath100>100 | delavande__bath100<0) &delavande__bath100!=.
} 

* delavande__uni
forvalues i = 1(1)1{
replace delavande__uni=abs(delavande__uni)
replace delavande__uni=999 if (delavande__uni>100 | delavande__uni<0) &delavande__uni!=.
} 

* delavande__study
forvalues i = 1(1)1{
replace delavande__study=abs(delavande__study)
replace delavande__study=999 if (delavande__study>100 | delavande__study<0) &delavande__study!=.
} 


destring wealth, replace

```

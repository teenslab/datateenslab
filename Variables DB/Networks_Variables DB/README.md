#### Andalucía
```ruby
keep usuario_id net_id	class_id friend	bfriend	enemy wenemy

save "C:\Users\mvasco\OneDrive - Universidad Loyola Andalucía\Escritorio\Excels originales\Andalucia\redes_raw.dta"

**Quitar usuarios YO MISMO= if usuario_id==3499 |usuario_id==4118 |usuario_id==4824 |usuario_id==5043 |usuario_id==4921 |usuario_id==3370 |usuario_id==5600 |usuario_id==5142|usuario_id==4265

*friend
split friend, generate(amigo) parse(|) destring
reshape long amigo, i(usuario_id) j(n)

replace amigo=. if amigo==3499 |amigo==4118 |amigo==4824 |amigo==5043 |amigo==4921 |amigo==3370 |amigo==5600 |amigo==5142|amigo==4265


drop  n friend
sort usuario_id amigo
bysort usuario_id: gen n=_n
reshape wide amigo, i(usuario_id) j(n)

egen friend_c=concat(amigo*), punct(|) 

split friend_c, generate(part) parse(|.)
rename part1 friend
drop part* friend_c amigo*


*bfriend
split bfriend, generate(amigo) parse(|) destring
reshape long amigo, i(usuario_id) j(n)

replace amigo=. if amigo==3499 |amigo==4118 |amigo==4824 |amigo==5043 |amigo==4921 |amigo==3370 |amigo==5600 |amigo==5142|amigo==4265


drop  n bfriend
sort usuario_id amigo
bysort usuario_id: gen n=_n
reshape wide amigo, i(usuario_id) j(n)

egen friend_c=concat(amigo*), punct(|) 

split friend_c, generate(part) parse(|.)
rename part1 bfriend
drop part* friend_c amigo*

*enemy
split enemy, generate(amigo) parse(|) destring
reshape long amigo, i(usuario_id) j(n)

replace amigo=. if amigo==3499 |amigo==4118 |amigo==4824 |amigo==5043 |amigo==4921 |amigo==3370 |amigo==5600 |amigo==5142|amigo==4265


drop  n enemy
sort usuario_id amigo
bysort usuario_id: gen n=_n
reshape wide amigo, i(usuario_id) j(n)

egen friend_c=concat(amigo*), punct(|) 

split friend_c, generate(part) parse(|.)
rename part1 enemy
drop part* friend_c amigo*

*wenemy
split wenemy, generate(amigo) parse(|) destring
reshape long amigo, i(usuario_id) j(n)

replace amigo=. if amigo==3499 |amigo==4118 |amigo==4824 |amigo==5043 |amigo==4921 |amigo==3370 |amigo==5600 |amigo==5142|amigo==4265


drop  n wenemy
sort usuario_id amigo
bysort usuario_id: gen n=_n
reshape wide amigo, i(usuario_id) j(n)

egen friend_c=concat(amigo*), punct(|) 

split friend_c, generate(part) parse(|.)
rename part1 wenemy
drop part* friend_c amigo*
```
#### Cataluña
###### No tengo código

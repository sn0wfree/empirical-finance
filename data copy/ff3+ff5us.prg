matrix(4, 25) uststat3
matrix(4, 25) usstdev3
group usrbar23
matrix(4, 25) uscoeffs3
matrix(6, 25) uststat5
matrix(6, 25) usstdev5
group usrbar25
matrix(6, 25) uscoeffs5
for !i=1 to 25
genr erus{!i}= us{!i}-rf
'three factor model
equation us31eq{!i}.ls erus{!i} c rmrf smb hml
colplace(uststat3, us31eq{!i}.@tstats,{!i})
colplace(usstdev3, us31eq{!i}.@stderrs,{!i})
usrbar23.add us31eq{!i}.@rbar2
'colplace(ausrbar23, us31eq{!i}.@rbar2,{!i})
colplace(uscoeffs3, us31eq{!i}.@coef,{!i})
'five factor model
equation us51eq{!i}.ls erus{!i} c rmrf smb hml cma rmw
colplace(uststat5, us51eq{!i}.@tstats,{!i})
colplace(usstdev5, us51eq{!i}.@stderrs,{!i})
usrbar25.add us51eq{!i}.@rbar2
'colplace(usrbar25, us51eq{!i}.@rbar2,{!i})
colplace(uscoeffs5, us51eq{!i}.@coef,{!i})
next

matrix(4, 25) uKtstat3
matrix(4, 25) uKstdev3
group usrbar23
matrix(4, 25) uKcoeffs3

matrix(5, 25) uktstat4
matrix(5, 25) ukstdev4
group ukrbar24
matrix(5, 25) aukcoeffs4
for !i=1 to 25
genr eruk{!i}= uk{!i}-rf
equation uk41eq{!i}.ls eruk{!i} c rmrf smb umd hml
colplace(uktstat4, uk411eq{!i}.@tstats,{!i})
colplace(ukstdev4, uk411eq{!i}.@stderrs,{!i})
ukrbar24.add uk411eq{!i}.@rbar2
'colplace(ukrbar24, uk41eq{!i}.@rbar2,{!i})
colplace(ukcoeffs4, uk41eq{!i}.@coef,{!i})
equation uk31eq{!i}.ls eruk{!i} c rmrf smb hml
colplace(uktstat4, uk31eq{!i}.@tstats,{!i})
colplace(ukstdev4, uk31eq{!i}.@stderrs,{!i})
ukrbar24.add uk41eq{!i}.@rbar2
'colplace(ukrbar24, uk31eq{!i}.@rbar2,{!i})
colplace(ukcoeffs4, uk31eq{!i}.@coef,{!i})
next

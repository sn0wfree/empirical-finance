matrix(5, 25) auktstat
matrix(5, 25) aukstdev
group aukrbar2
matrix(5, 25) aukcoeffs
for !i=1 to 25
genr eruk{!i}= uk{!i}-rf
equation ukeq{!i}.ls eruk{!i} c rmrf smb umd hml
colplace(auktstat, ukeq{!i}.@tstats,{!i})
colplace(aukstdev, ukeq{!i}.@stderrs,{!i})
aukrbar2.add ukeq{!i}.@rbar2
'colplace(aukrbar2, ukeq{!i}.@rbar2,{!i})
colplace(aukcoeffs, ukeq{!i}.@coef,{!i})
next

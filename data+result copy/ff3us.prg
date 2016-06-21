matrix(4, 25) auststat
matrix(4, 25) ausstdev
group ausrbar2
matrix(4, 25) auscoeffs
for !i=1 to 25
genr erus{!i}= us{!i}-rf
equation useq{!i}.ls erus{!i} c rmrf smb hml
colplace(auststat, useq{!i}.@tstats,{!i})
colplace(ausstdev, useq{!i}.@stderrs,{!i})
ausrbar2.add useq{!i}.@rbar2
'colplace(ausrbar2, useq{!i}.@rbar2,{!i})
colplace(auscoeffs, useq{!i}.@coef,{!i})
next

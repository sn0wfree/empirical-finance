matrix(4, 25) uKtstat3
matrix(4, 25) uKstdev3
group ukrbar23
matrix(4, 25) uKcoeffs3

group factor  rmrf smb hml umd
matrix(5, 25) uktstat4
matrix(5, 25) ukstdev4
group ukrbar24
matrix(5, 25) ukcoeffs4
for !i=1 to 25
genr eruk{!i}= uk{!i}-rf   'gerenate excess return
'---------------------------------------------------------------------------------------------------
'four  factor model
equation uk41eq{!i}.ls eruk{!i} c rmrf smb umd hml
colplace(uktstat4, uk41eq{!i}.@tstats,{!i})
colplace(ukstdev4, uk41eq{!i}.@stderrs,{!i})
ukrbar24.add uk41eq{!i}.@rbar2
'colplace(ukrbar24, uk41eq{!i}.@rbar2,{!i})
colplace(ukcoeffs4, uk41eq{!i}.@coef,{!i})
'---------------------------------------------------------------------------------------------------
'three factor model
equation uk31eq{!i}.ls eruk{!i} c rmrf smb hml
colplace(uktstat3, uk31eq{!i}.@tstats,{!i})
colplace(ukstdev3, uk31eq{!i}.@stderrs,{!i})
ukrbar23.add uk31eq{!i}.@rbar2
'colplace(ukrbar23, uk31eq{!i}.@rbar2,{!i})
colplace(ukcoeffs3, uk31eq{!i}.@coef,{!i})
'--------------------------------------------------------------------------------------------------------
'adf test for each portfolio
freeze(tableukn{!i})  eruk{!i}.uroot(n,maxlag=17,adf)
tableukn{!i}.save(t=csv) C:\Users\C1506457.X7C05070D6810\Desktop\data+result\result\adf\uk\portfolio\none\neruk{!i}


freeze(tableukc{!i})  eruk{!i}.uroot(c,maxlag=17,adf)
tableukc{!i}.save(t=csv)  C:\Users\C1506457.X7C05070D6810\Desktop\data+result\result\adf\uk\portfolio\c\ceruk{!i}


freeze(tableukt{!i})  eruk{!i}.uroot(t,maxlag=17,adf)
tableukt{!i}.save(t=csv)  C:\Users\C1506457.X7C05070D6810\Desktop\data+result\result\adf\uk\portfolio\t\teruk{!i}
next
'--------------------------------------------------------------------------------------------------
'adf test dor each factor 
for !j=1 to factor.@count

freeze(tablefactorukn{!j})  factor({!j}).uroot(n,maxlag=17,adf)
tablefactorukn{!j}.save(t=csv)  C:\Users\C1506457.X7C05070D6810\Desktop\data+result\result\adf\uk\factors\none\factor({!j})

freeze(tablefactorukc{!j})  factor({!j}).uroot(c,maxlag=17,adf)
tablefactorukc{!j}.save(t=csv)  C:\Users\C1506457.X7C05070D6810\Desktop\data+result\result\adf\uk\factors\c\factor({!j})


freeze(tablefactorukt{!j})  factor({!j}).uroot(t,maxlag=17,adf)
tablefactorukt{!j}.save(t=csv)  C:\Users\C1506457.X7C05070D6810\Desktop\data+result\result\adf\uk\factors\t\factor({!j})
next

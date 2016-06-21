group factor  rmrf smb hml cma rmw
'---------------------------------------------------------------------------------------------------
'define the three factor model componets
matrix(4, 25) uststat3
matrix(4, 25) usstdev3
group usrbar23
matrix(4, 25) uscoeffs3
'---------------------------------------------------------------------------------------------------
'define the five factor model componets
matrix(6, 25) uststat5
matrix(6, 25) usstdev5
group usrbar25
matrix(6, 25) uscoeffs5
for !i=1 to 25
genr erus{!i}= us{!i}-rf    'gerenate excess return
'---------------------------------------------------------------------------------------------------
'three factor model
        equation us3eq{!i}.ls erus{!i} c rmrf smb hml
        colplace(uststat3, us3eq{!i}.@tstats,{!i})    'collect t-statistic value
        colplace(usstdev3, us3eq{!i}.@stderrs,{!i})   'collect standard devertive value
        usrbar23.add us3eq{!i}.@rbar2     'collect adjusted R-square
        'colplace(ausrbar23, us3eq{!i}.@rbar2,{!i})
        colplace(uscoeffs3, us3eq{!i}.@coef,{!i}) 'collect coefficient
'--------------------------------------------------------------------------------------------------------
'adf test for each portfolio
         freeze(tableusn{!i})  erus{!i}.uroot(n,maxlag=17,adf)
        tableusn{!i}.save(t=csv)  C:\Users\C1506457.X7C05070D6810\Desktop\data+result\result\adf\us\ff5\none\nerus{!i}


        freeze(tableusc{!i})  erus{!i}.uroot(c,maxlag=17,adf)
        tableusc{!i}.save(t=csv)  C:\Users\C1506457.X7C05070D6810\Desktop            \data+result\result\adf\us\ff5\c\cerus{!i}


freeze(tableust{!i})  erus{!i}.uroot(t,maxlag=17,adf)
tableust{!i}.save(t=csv)  C:\Users\C1506457.X7C05070D6810\Desktop\data+result\result\adf\us\ff5\t\terus{!i}

next 'loop through adf test and timesseries regression end
'--------------------------------------------------------------------------------------------------
'adf test dor each factor 
for !j=1 to factor.@count

freeze(tablefactorusn{!j})  factor({!j}).uroot(n,maxlag=17,adf)
tablefactorusn{!j}.save(t=csv)  C:\Users\C1506457.X7C05070D6810\Desktop\data+result\result\adf\us\factors\none\factor({!j})

freeze(tablefactorusc{!j})  factor({!j}).uroot(c,maxlag=17,adf)
tablefactorusc{!j}.save(t=csv)  C:\Users\C1506457.X7C05070D6810\Desktop\data+result\result\adf\us\factors\c\factor({!j})


freeze(tablefactorust{!j})  factor({!j}).uroot(t,maxlag=17,adf)
tablefactorust{!j}.save(t=csv)  C:\Users\C1506457.X7C05070D6810\Desktop\data+result\result\adf\us\factors\t\factor({!j})

next
'-------------------------------------------------------------------------------------------------
'five factor model
for !i=1 to 25
equation us5eq{!i}.ls erus{!i} c rmrf smb hml cma rmw
colplace(uststat5, us5eq{!i}.@tstats,{!i})
colplace(usstdev5, us5eq{!i}.@stderrs,{!i})
usrbar25.add us5eq{!i}.@rbar2
'colplace(usrbar25, us5eq{!i}.@rbar2,{!i})
colplace(uscoeffs5, us5eq{!i}.@coef,{!i})
next



'heteroskedasticity test:white
'----------------------------------------------------------------------------------------------------------
for !i=1 to 25
freeze(hetertableusff3{!i})   us3eq{!i}.white
hetertableusff3{!i}.save(t=csv)  C:\Users\C1506457.X7C05070D6810\Desktop\data+result\result\Heteroskedasticity Test\us\ff3\heteroskedasticityerusff3{!i}


freeze(hetertableusff5{!i})   us5eq{!i}.white
hetertableusff5{!i}.save(t=csv)  C:\Users\C1506457.X7C05070D6810\Desktop\data+result\result\Heteroskedasticity Test\us\ff5\heteroskedasticityerusff5{!i}

next

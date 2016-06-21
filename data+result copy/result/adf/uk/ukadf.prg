group factor  rmrf smb hml umd
for !i=1 to 25
freeze(tableukn{!i})  eruk{!i}.uroot(n,maxlag=17,adf)
tableukn{!i}.save(t=csv) C:\Users\C1506457.X7C05070D6810\Desktop\data+result\result\adf\uk\portfolio\none\neruk{!i}


freeze(tableukc{!i})  eruk{!i}.uroot(c,maxlag=17,adf)
tableukc{!i}.save(t=csv)  C:\Users\C1506457.X7C05070D6810\Desktop\data+result\result\adf\uk\portfolio\c\ceruk{!i}


freeze(tableukt{!i})  eruk{!i}.uroot(t,maxlag=17,adf)
tableukt{!i}.save(t=csv)  C:\Users\C1506457.X7C05070D6810\Desktop\data+result\result\adf\uk\portfolio\t\teruk{!i}


next
for !j=1 to factor.@count

freeze(tablefactorukn{!j})  factor({!j}).uroot(n,maxlag=17,adf)
tablefactorukn{!j}.save(t=csv)  C:\Users\C1506457.X7C05070D6810\Desktop\data+result\result\adf\uk\factors\none\factor({!j})

freeze(tablefactorukc{!j})  factor({!j}).uroot(c,maxlag=17,adf)
tablefactorukc{!j}.save(t=csv)  C:\Users\C1506457.X7C05070D6810\Desktop\data+result\result\adf\uk\factors\c\factor({!j})


freeze(tablefactorukt{!j})  factor({!j}).uroot(t,maxlag=17,adf)
tablefactorukt{!j}.save(t=csv)  C:\Users\C1506457.X7C05070D6810\Desktop\data+result\result\adf\uk\factors\t\factor({!j})


next

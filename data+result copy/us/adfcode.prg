
for !i=1 to 25
freeze(tableusn{!i})  erus{!i}.uroot(n,maxlag=17,adf)
tableusn{!i}.save(t=csv) C:\Users\C1506457.X7C05070D6810\Desktop\data+result\result\adf\us\portfolio\none\nerus{!i}


freeze(tableusc{!i})  erus{!i}.uroot(c,maxlag=17,adf)
tableusc{!i}.save(t=csv)  C:\Users\C1506457.X7C05070D6810\Desktop\data+result\result\adf\us\portfolio\c\cerus{!i}


freeze(tableust{!i})  erus{!i}.uroot(t,maxlag=17,adf)
tableust{!i}.save(t=csv)  C:\Users\C1506457.X7C05070D6810\Desktop\data+result\result\adf\us\portfolio\t\terus{!i}


next
for !j=1 to factor.@count

freeze(tablefactorusn{!j})  factor({!j}).uroot(n,maxlag=17,adf)
tablefactorusn{!j}.save(t=csv)  C:\Users\C1506457.X7C05070D6810\Desktop\data+result\result\adf\us\factors\none\factor({!j})

freeze(tablefactorusc{!j})  factor({!j}).uroot(c,maxlag=17,adf)
tablefactorusc{!j}.save(t=csv)  C:\Users\C1506457.X7C05070D6810\Desktop\data+result\result\adf\us\factors\c\factor({!j})


freeze(tablefactorust{!j})  factor({!j}).uroot(t,maxlag=17,adf)
tablefactorust{!j}.save(t=csv)  C:\Users\C1506457.X7C05070D6810\Desktop\data+result\result\adf\us\factors\t\factor({!j})


next

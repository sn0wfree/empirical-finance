
for !i=1 to 25
freeze(resultus31eq{!i}) us3eq{!i}
resultus31eq{!i}.save(t=csv)  C:\Users\c1506457\Desktop\data+result\result\1stregression\us\ff3\1stregressionff3result{!i}

freeze(resultus51eq{!i}) us5eq{!i}

resultus51eq{!i}.save(t=csv)  C:\Users\c1506457\Desktop\data+result\result\1stregression\us\ff5\1stregressionff5result{!i}
next

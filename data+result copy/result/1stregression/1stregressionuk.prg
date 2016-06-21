
for !i=1 to 25
freeze(resultuk31eq{!i}) uk31eq{!i}
resultuk31eq{!i}.save(t=csv)  C:\Users\c1506457\Desktop\data+result\result\1stregression\uk\ff3\1stregressionff3result{!i}

freeze(resultuk41eq{!i}) uk41eq{!i}

resultuk41eq{!i}.save(t=csv)  C:\Users\c1506457\Desktop\data+result\result\1stregression\uk\c4\1stregressionc4result{!i}
next

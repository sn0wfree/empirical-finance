

for !i=1 to 25
freeze(clmtestukff3{!i})   uk31eq{!i}.auto(4)
clmtestukff3{!i}.save(t=csv)  C:\Users\C1506457\Desktop\data+result\result\serial correlation test\uk\ff3\clmtestukff3{!i}

freeze(clmtestukc4{!i})   uk41eq{!i}.auto(4)
clmtestukc4{!i}.save(t=csv)  C:\Users\C1506457\Desktop\data+result\result\serial correlation test\uk\c4\clmtestukc4{!i}

next

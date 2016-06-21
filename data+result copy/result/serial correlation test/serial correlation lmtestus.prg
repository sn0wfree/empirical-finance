

for !i=1 to 25
freeze(clmtestusff3{!i})   us3eq{!i}.auto(4)
clmtestusff3{!i}.save(t=csv)  C:\Users\C1506457\Desktop\data+result\result\serial correlation test\us\ff3\clmtestusff3{!i}

freeze(clmtestusff5{!i})   us5eq{!i}.auto(4)
clmtestusff5{!i}.save(t=csv)  C:\Users\C1506457\Desktop\data+result\result\serial correlation test\us\ff5\clmtestusff5{!i}

next

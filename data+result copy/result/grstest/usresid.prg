group residus3
group residus5

for !i=1 to 25
us3eq{!i}.makeresid residus3eq{!i}
residus3.add residus3eq{!i}
us5eq{!i}.makeresid residus5eq{!i}
residus5.add residus5eq{!i}
next

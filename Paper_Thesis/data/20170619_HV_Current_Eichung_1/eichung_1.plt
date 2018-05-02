

f(x) = m*x+b

m=1
b=1

fit f(x) "eichung_1.txt" using 2:($3-0.38+0.06) via m,b

plot "eichung_1.txt" using 2:($3-0.38+0.06) lc "red" , f(x) lw 3 lc "blue"
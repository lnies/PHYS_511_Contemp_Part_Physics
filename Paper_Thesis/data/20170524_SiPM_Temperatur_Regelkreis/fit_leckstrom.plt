#set object 1 rectangle from graph 0, graph 0 to graph 1, graph 1 behind fc rgbcolor "grey" fs noborder

set terminal qt enhanced font "Arial, 16"

set style line 11 lc rgb '#808080' lt 1
set border 3 back ls 11
set tics nomirror
set style line 12 lc rgb '#808080' lt 0 lw 1
set grid back ls 12


set title "Vergleich von Regelkreiseinstellungen"
set ylabel "Spannung [V]"
set xlabel "Datenpunkt (zeitlich korreliert)"

A = 1
C = 1

fit(x) = (x**2)*exp(A/x)+C

fit [0:10] fit(x) "regel.txt" using 4:3 via A, C

plot \
	"regel.txt" using 4:3, fit(x) lw 3

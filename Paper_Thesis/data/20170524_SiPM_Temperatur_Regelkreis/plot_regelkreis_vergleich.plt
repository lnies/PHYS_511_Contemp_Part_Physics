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

plot \
	"test1.txt" using 0:2 title "Nicht optimiert", \
	"test2.txt" using 0:2 title "Optimiert, U=10V", \
	"test3.txt" using 0:2 title "Optimiert, U=10.2V", \
	"test4.txt" using 0:2 title "Optimiert, U=32.0V", "test4.txt" using 0:6 title "Wiper-Stellung fuer U=32"
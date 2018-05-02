# use with gnuplot

set title "Eichung der Ein- und Ausgangsspannung des Distribution-Boards"

set object 1 rectangle from graph 0, graph 0 to graph 1, graph 1 behind fc rgbcolor "grey" fs noborder

set terminal qt enhanced font "Arial, 20"
set termoptions enhanced

set xlabel "Eingangsspannung U_{In} [V]"
set ylabel "Ausgangsspannung U_A [V]"

set grid

plot \
	"eichung_mit.txt" using 1:3 w lp, "eichung_ohne.txt" using 1:3 w lp


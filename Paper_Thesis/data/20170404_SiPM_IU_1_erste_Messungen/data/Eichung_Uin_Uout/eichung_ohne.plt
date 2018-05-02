# use with gnuplot

set title "Eichung der Ein- und Ausgangsspannung des Distribution-Boards"

set object 1 rectangle from graph 0, graph 0 to graph 1, graph 1 behind fc rgbcolor "grey" fs noborder

set terminal qt enhanced font "Arial, 20"
set termoptions enhanced

set xlabel "Eingangsspannung U_{In} [V]"
set ylabel "Ausgangsspannung U_A [V]"

set grid

eichung(x) = slope * x + offset

slope = 1
offset = 1

fit [60:100] eichung(x) "eichung_ohne.txt" using 1:3 via slope, offset

set label 1 sprintf("m = %1.5f",slope) at 10,80 font "Arial, 18"
set label 2 sprintf("y_0 = %1.5f",offset) at 10,75 font "Arial, 18"


plot \
	eichung(x) title "Eichung U_A=m*U_{In}+y_0" lw 2, \
	"eichung_ohne.txt" using 1:3 title "Datenpunkte" ps 1.0 pt 4 w lp

# use with gnuplot

set title "Eichung der Anzeige- und Ausgangsspannung des Distribution-Boards"

set object 1 rectangle from graph 0, graph 0 to graph 1, graph 1 behind fc rgbcolor "grey" fs noborder

set terminal qt enhanced font "Arial, 20"
set termoptions enhanced

set xlabel "Anzeige U_{Disp} [V]"
set ylabel "Ausgangsspannung U_A [V]"

set grid

eichung2(x) = slope2 * x + offset2

slope2 = 1
offset2 = 1

fit [3:40] eichung2(x) "eichung_hameg.txt" using 2:3 via slope2, offset2

set label 1 sprintf("m = %1.5f",slope2) at 5,25 font "Arial, 18"
set label 2 sprintf("y_0 = %1.5f",offset2) at 5,23 font "Arial, 18"

plot \
	"eichung_hameg.txt" using 2:3 w lp, "eichung_hameg.txt" using 2:3 w lp, \
	eichung2(x) title "Eichgerade"

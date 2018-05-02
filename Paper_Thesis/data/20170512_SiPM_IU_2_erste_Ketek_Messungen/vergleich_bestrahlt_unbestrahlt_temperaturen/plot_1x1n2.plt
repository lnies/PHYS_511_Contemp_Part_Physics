set object 1 rectangle from graph 0, graph 0 to graph 1, graph 1 behind fc rgbcolor "grey" fs noborder

set terminal qt enhanced font "Arial, 20"

set grid

#set logscale y

set title "Kennlinie 1x1n2 bestrahlt und unbestrahlt"
set ylabel "Strom [log(nA)]"
set xlabel "Spannung [V]"



plot \
	"iu_curve_1x1n2_wos_0dose.txt" using 2:(log($3)) title "0Gray, N1n1loop", \
	"iu_curve_1x1n2_wos_25gray_N1n1loop.txt" using 2:(log($3)) title "25Gray, N1n1loop", \
	"iu_curve_1x1n2_wos_25gray_N1n1loop_later.txt" using 2:(log($3)) title "25Gray, N1n1loop, spaeter"
	
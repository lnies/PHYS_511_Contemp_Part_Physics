set object 1 rectangle from graph 0, graph 0 to graph 1, graph 1 behind fc rgbcolor "grey" fs noborder

set terminal qt enhanced font "Arial, 20"

set grid

#set logscale y

set title "Kennlinie 1x1n1 ohne Quelle, unbestrahlt"
set ylabel "Strom [nA]"
set xlabel "Spannung [V]"



plot \
	"iu_curve_ket_1x1_wos_loop1_n1.txt" using 2:3 title "Puffergroesse n=1" with lp, \
	"iu_curve_ket_1x1_wos_loop1_n5.txt" using 2:3 title "Puffergroesse n=5" 
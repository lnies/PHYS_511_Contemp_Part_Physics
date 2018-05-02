set object 1 rectangle from graph 0, graph 0 to graph 1, graph 1 behind fc rgbcolor "grey" fs noborder

set terminal qt enhanced font "Arial, 20"

set grid

#set logscale y

set title "Kennlinie 1x1n1 mit und ohne Quelle, unbestrahlt"
set ylabel "Strom [nA]"
set xlabel "Spannung [V]"



plot \
	"iu_curve_1x1n1_wos_0gray_N1n1loop.txt" using 2:(log($3)) title "Ohne Quelle", \
	"iu_curve_1x1n1_ws_0gray_N1n1loop.txt" using 2:(log($3)) title "Mit Quelle", \
	
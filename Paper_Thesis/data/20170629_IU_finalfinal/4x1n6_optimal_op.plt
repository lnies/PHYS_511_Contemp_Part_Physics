# use with gnuplot

set title "Optimal working point SiPMs"

#set object 1 rectangle from graph 0, graph 0 to graph 1, graph 1 behind fc rgbcolor "grey" fs noborder

set terminal qt size 1400,900 enhanced font "Arial, 20"
set termoptions enhanced

#set xrange [20:78]

set xlabel "Voltage (NOT CALIBRATED) [V]"
set ylabel "Current (NOT CALIBRATED) [nA]"

set key outside
set key right top

set ytics 100
set mytics 2
set xtics 5
set mxtics 2

set grid lc "grey" lw 2
set grid mxtics
set grid mytics

plot \
	"iu_curve_4x1n6_25gC_der.txt" using 1:4 lc "red" lw 1 title "25gC" with lp, \
	"iu_curve_4x1n6_20gC_der.txt" using 1:4 lc "orange" lw 1 title "20gC" with lp, \
	"iu_curve_4x1n6_15gC_der.txt" using 1:4 lc "yellow" lw 1 title "15gC" with lp, \
	"iu_curve_4x1n6_10gC_der.txt" using 1:4 lc "green" lw 1 title "10gC" with lp, \
	"iu_curve_4x1n6_5gC_der.txt" using 1:4 lc "cyan" lw 1 title "5gC" with lp, \
	"iu_curve_4x1n6_0gC_der.txt" using 1:4 lc "blue" lw 1 title "0gC" with lp, \
	"iu_curve_4x1n6_-25gC_der.txt" using 1:4 lc "violet" lw 1 title "-25gC" with lp, \

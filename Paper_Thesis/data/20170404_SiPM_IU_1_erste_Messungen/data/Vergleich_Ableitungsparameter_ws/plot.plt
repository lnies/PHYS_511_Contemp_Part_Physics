# use with gnuplot

set title "Vergleich verschiedener Werte des Puffers beim Ableiten"

set object 1 rectangle from graph 0, graph 0 to graph 1, graph 1 behind fc rgbcolor "grey" fs noborder

set terminal qt enhanced font "Arial, 20"

set grid

plot \
	"iu_curve_loop_n20_n5_der.txt" using 1:3 title "n = 5" ps 0.5 w lp , \
	"iu_curve_loop_n20_n15_der.txt" using 1:3 title "n = 15" ps 0.5 w lp, \
	"iu_curve_loop_n20_n31_der.txt" using 1:3title "n = 31" ps 0.5 w lp, \
	"iu_curve_loop_n20_n101_der.txt" using 1:3 title "n = 101" ps 0.5 w lp
	

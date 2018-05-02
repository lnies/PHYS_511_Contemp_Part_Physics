# use with gnuplot

set title "Relative Steigungskennlinie dI/dU * 1/I Board 1x1n3"

set object 1 rectangle from graph 0, graph 0 to graph 1, graph 1 behind fc rgbcolor "grey" fs noborder

set terminal qt enhanced font "Arial, 20"
set termoptions enhanced

set xlabel "Spannung [V]"
set ylabel "dI/dU * 1/I [1/V]

set grid 
set xrange [26:32]
set yrange [0.3:1.2]

pol(x) = ( x > 27 && x < 31.7 ) ? a * x**2 + b * x + c : 1/0

a = 1
b = 1
c = 1

fit [27:31.7] pol(x) "iu_curve_1x1n3_20gC_n100samples_der.txt" using 1:4 via a, b, c

xcenter = -b/(2*a)


set label 1 sprintf("x_c = %2.4f ",xcenter) at 30,0.9 font "Arial, 18"




plot \
	"iu_curve_1x1n3_20gC_n100samples_der.txt" using 1:4 title "Board 1x1n3, 20gC" ps 1.0 pt 4 w lp, \
	"iu_curve_1x1n3_10gC_n100samples_der.txt" using 1:4 title "Board 1x1n3, 10gC" ps 1.0 pt 4 w lp, \
	"iu_curve_1x1n3_0gC_n100samples_der.txt" using 1:4 title "Board 1x1n3, 0gC" ps 1.0 pt 4 w lp, \
	"iu_curve_1x1n3_-25gC_n100samples_der.txt" using 1:4 title "Board 1x1n3, -25gC" ps 1.0 pt 4 w lp, \
	pol(x) lw 5 lc "blue" title "Quadratischer Fit"

# use with gnuplot

set title "Relative Steigungskennlinie dI/dU * 1/I"

set object 1 rectangle from graph 0, graph 0 to graph 1, graph 1 behind fc rgbcolor "grey" fs noborder

set terminal qt enhanced font "Arial, 20"
set termoptions enhanced

set xlabel "Spannung (geeicht) [V]"
set ylabel "dI/dU * 1/I [1/V]

set grid

set xrange [52:70]
set yrange [0:0.9]

pol(x) = ( x > 58 && x < 68 ) ? a * x**2 + b * x + c : 1/0

a = 1
b = 1
c = 1

fit [58:68] pol(x) "iu_curve_loop_n20_n5_der.txt" using 1:((0.991*$3+0.12)/$2) via a, b, c

xcenter = -b/(2*a)


set label 1 sprintf("x_c = %2.4f",xcenter) at 66,0.6font "Arial, 18"



plot \
	"iu_curve_loop_n20_n5_der.txt" using 1:((0.991*$3+0.12)/$2) title "n = 5" ps 1.0 pt 4 w lp, \
	pol(x) lw 3 title "Quadratischer Fit"

# use with gnuplot

set title "Multiplot SiPMs (grob)"

#set object 1 rectangle from graph 0, graph 0 to graph 1, graph 1 behind fc rgbcolor "grey" fs noborder

set terminal qt size 1400,900 enhanced font "Arial, 20"
set termoptions enhanced

set xrange [20:78]

set xlabel "Voltage (NOT CALIBRATED) [V]"
set ylabel "Current (NOT CALIBRATED) [nA]"

set key outside
set key right top

set ytics 5000
set mytics 2
set xtics 5
set mxtics 2

set grid lc "grey" lw 2
set grid mxtics
set grid mytics

plot \
	"iu_curve_4x1n6_25gC.txt" using 2:(log($3)) lc "red" lw 1 title "25gC", \
	"iu_curve_4x1n6_20gC.txt" using 2:(log($3)) lc "orange" lw 1 title "20gC" , \
	"iu_curve_4x1n6_15gC.txt" using 2:(log($3)) lc "yellow" lw 1 title "15gC" , \
	"iu_curve_4x1n6_10gC.txt" using 2:(log($3)) lc "green" lw 1 title "10gC" , \
	"iu_curve_4x1n6_5gC.txt" using 2:(log($3)) lc "cyan" lw 1 title "5gC" , \
	"iu_curve_4x1n6_0gC.txt" using 2:(log($3)) lc "blue" lw 1 title "0gC" , \
	"iu_curve_4x1n6_-25gC.txt" using 2:(log($3)) lc "violet" lw 1 title "-25gC" , \
	"iu_curve_4x1n6_grob_25gC.txt" using 2:(log($3)) lc "red" lw 1 title "25gC grob" , \
	"iu_curve_4x1n6_grob_20gC.txt" using 2:(log($3)) lc "orange" lw 1 title "20gC grob" , \
	"iu_curve_4x1n6_grob_15gC.txt" using 2:(log($3)) lc "yellow" lw 1 title "15gC grob" , \
	"iu_curve_4x1n6_grob_10gC.txt" using 2:(log($3)) lc "green" lw 1 title "10gC grob" , \
	"iu_curve_4x1n6_grob_5gC.txt" using 2:(log($3)) lc "cyan" lw 1 title "5gC grob" , \
	"iu_curve_4x1n6_grob_0gC.txt" using 2:(log($3)) lc "blue" lw 1 title "0gC grob" , \
	"iu_curve_4x1n6_grob_-25gC.txt" using 2:(log($3)) lc "violet" lw 1 title "-25gC grob" , \



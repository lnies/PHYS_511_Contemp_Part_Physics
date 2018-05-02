# use with gnuplot

#set title "Single SiPM (logscale)"

set terminal wxt size 1280,1024 enhanced font "Arial, 28"
set termoptions enhanced

set style line 101 lc "black" lt 1 lw 3 pt 9 ps 3 pi 2

set border front ls 101

set xrange [23.5:27.2]
set yrange [5:1200]

set xlabel "Voltage [V]" offset 0 font "Arial, 32"
set ylabel "Current [nA]" offset 1.75 font "Arial, 32"

#set key outside
set key left top box lw 2 opaque

#set ytics 100
#set mytics 2
#set xtics 5
#set mxtics 2

set grid lc "grey" lw 2
set grid mxtics
set grid mytics

set logscale y

set style line 1 lc "red" lt 1 lw 3 pt 9 ps 3 pi 2
set style line 2 lc "orange" lt 1 lw 3 pt 9 ps 3 pi 2
set style line 3 lc "yellow" lt 1 lw 3 pt 9 ps 3 pi 2
set style line 4 lc "green" lt 1 lw 3 pt 9 ps 3 pi 2
set style line 5 lc "cyan" lt 1 lw 3 pt 9 ps 3 pi 2
set style line 6 lc "blue" lt 1 lw 3 pt 9 ps 3 pi 2
set style line 7 lc "#00008b" lt 1 lw 3 pt 9 ps 3 pi 2

plot \
	"iu_curve_4x1n6_25gC.txt" using 2:3 with lp ls 1 title "25gC", \
	"iu_curve_4x1n6_20gC.txt" using 2:3 with lp ls 2 title "20gC", \
	"iu_curve_4x1n6_15gC.txt" using 2:3 with lp ls 3 title "15gC", \
	"iu_curve_4x1n6_10gC.txt" using 2:3 with lp ls 4 title "10gC", \
	"iu_curve_4x1n6_5gC.txt" using 2:3 with lp ls 5 title "5gC", \
	"iu_curve_4x1n6_0gC.txt" using 2:3 with lp ls 6 title "0gC", \
	"iu_curve_4x1n6_-25gC.txt" using 2:3 with lp ls 7 title "-25gC", \

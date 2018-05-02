# use with gnuplot

#set title "Single SiPM"

set terminal wxt size 1280,1024 enhanced font "Arial, 28"
set termoptions enhanced

set style line 101 lc "black" lt 1 lw 3 pt 9 ps 3 pi 2

set border front ls 101

set xlabel "Voltage [V]" offset 0 font "Arial, 32"
set ylabel "Current [nA]" offset 0 font "Arial, 32"

#set key outside
set key left top box lw 2

#set ytics 100
set mytics 2
#set xtics 5
set mxtics 2

set grid lc "grey" lw 2
set grid mxtics
set grid mytics

set style line 1 lc "red" lt 1 lw 3 pt 9 ps 3 pi 1
set style line 2 lc "orange" lt 1 lw 3 pt 9 ps 3 pi 2
set style line 3 lc "yellow" lt 1 lw 3 pt 9 ps 3 pi 2
set style line 4 lc "green" lt 1 lw 3 pt 9 ps 3 pi 2
set style line 5 lc "cyan" lt 1 lw 3 pt 9 ps 3 pi 2
set style line 6 lc "blue" lt 1 lw 3 pt 9 ps 3 pi 2
set style line 7 lc "#00008b" lt 1 lw 3 pt 9 ps 3 pi 2

plot \
	"1x1n2_countrate_20gC_der3.txt" using 1:(log($3)) with lp ls 1, \
	"1x1n2_countrate_20gC_der5.txt" using 1:(log($3)+1) with lp ls 2, \
	"1x1n2_countrate_20gC_der7.txt" using 1:(log($3)+2) with lp ls 3, \
	"1x1n2_countrate_20gC_der9.txt" using 1:(log($3)+3) with lp ls 4, \
# use with gnuplot

#set title "Single SiPM (logscale)"

set terminal wxt size 1280,1024 enhanced font "Arial, 28"
set termoptions enhanced

set style line 101 lc "black" lt 1 lw 3 pt 9 ps 3 pi 2

set border front ls 101

#set xrange [22:29]
#set yrange [-1:log10(1200)]

set xlabel "Time [ns]" offset 0 font "Arial, 32"
set ylabel "Amplitude [mV]" offset 0 font "Arial, 32"

#set key outside
set key left top box lw 2 opaque

#set ytics 1
#set mytics 2
#set xtics 5
#set mxtics 2
#set ticscale 1
#set tics in
#set format y "10^{%1.0f}"

set grid lc "grey" lw 2
#set grid mxtics
#set grid mytics

#set logscale y

set style line 1 lc "blue" lt 1 lw 1 pt 1 ps 1 
set style line 2 lc "red" lt 1 lw 1 pt 1 ps 1 

norm1 = 23.35
norm2 = 59.23

plot \
	"C2hybridwave00000.txt" using ($1*1e9):($2*1e3/norm1) ls 1 title "Hybrid", \
	"C2hybridwave00002.txt" using ($1*1e9):($2*1e3/norm2) ls 2 title "Hybrid", \
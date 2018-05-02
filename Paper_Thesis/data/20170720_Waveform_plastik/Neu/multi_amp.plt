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
set style line 3 lc "green" lt 1 lw 1 pt 1 ps 1 

norm_single = 406
norm_hybrid = 527.9
norm_par = 1065

t_single = 0
t_hybrid = -10
t_par = -4.5

plot \
	"C2singlewaveamp00000.txt" using ($1*1e9+t_single):($2*1e3/norm_single) ls 1 title "Single-amp" ,\
	"C2hybridwaveamp00000.txt" using ($1*1e9+t_hybrid):($2*1e3/norm_hybrid) ls 2 title "Hybrid-amp" ,\
	"C2parwaveamp00000.txt" using ($1*1e9+t_par):($2*1e3/norm_par) ls 3 title "Par-amp"
	

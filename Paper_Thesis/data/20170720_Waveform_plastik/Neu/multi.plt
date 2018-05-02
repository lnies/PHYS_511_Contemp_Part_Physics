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

set style line 1 lc "blue" lt 1 lw 4 pt 1 ps 1 
set style line 2 lc "red" lt 1 lw 4 pt 1 ps 1 
set style line 3 lc "green" lt 1 lw 4 pt 1 ps 1 

t_single = 12.876
t_hybrid = 8.66509
t_par = 11.2786

norm_single = 1
norm_hybrid = 1
norm_par = 1

#norm_single = 14.3479
#norm_hybrid = 8.99513
#norm_par = 14.443


plot \
	"C2h10mV00000.txt" using (($1*1e9)+t_hybrid):($2*1e3/norm_hybrid) ls 1 title "Hybrid" smooth acsp, \
	"C2p20mV-200000.txt" using (($1*1e9)+t_par):($2*1e3/norm_par) ls 2 title "Parallel" smooth acsp, \
	"C1s20mV00000.txt" using (($1*1e9)+t_single):($2*1e3/norm_single) ls 3 title "Single" smooth acsp
	

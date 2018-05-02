# use with gnuplot

#set title "Single SiPM (logscale)"

set terminal wxt size 1280,1024 enhanced font "Arial, 28"
set termoptions enhanced

set style line 101 lc "black" lt 1 lw 3 pt 9 ps 3 pi 2

set border front ls 101 

set xrange [10:140]
set x2range [8:39.25]
set yrange [1e-4:10]

set xlabel "Amplitude Single [-mV]" offset 0 font "Arial, 28"
set x2label "Amplitude Hybrid [-mV]" offset 0 font "Arial, 28"
set ylabel "Normalized counts" offset 0 font "Arial, 32"

#set key outside
set key left top box lw 2 opaque

#set ytics 1
#set y2tics
#set mytics 2
#set xtics 5
set x2tics
#set mxtics 2
#set ticscale 1
#set tics in
set format y "10^{%T}"

set grid lc "grey" lw 2
#set grid mxtics
#set grid mytics

#set boxwidth binwidth

#amplitude1 = 1
#amplitude2 = 1
amplitude1 = 12872
amplitude2 = 957

set logscale y
set logscale y2
set style fill solid  0.1 
#set style fill transparent solid  0.1 

set style line 1 lc "blue" lt 1 lw 1 pt 1 ps 1 
set style line 2 lc "red" lt 1 lw 1 pt 1 ps 1 
 
plot "F6hybridpulse100000.txt" using (-1000*$1):(($2+0.1)/amplitude2) axis x2y1 smooth freq w boxes ls 2 title "Hybrid",\
	 "F6pulse300000.txt" using (-1000*$1):(($2+0.1)/amplitude1) smooth freq w boxes ls 1 title "Single"
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
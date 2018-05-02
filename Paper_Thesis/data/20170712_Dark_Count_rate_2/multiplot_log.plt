# use with gnuplot

#set title "Single SiPM"

set terminal wxt size 1280,1024 enhanced font "Arial, 28"
set termoptions enhanced

set style line 101 lc "black" lt 1 lw 3 pt 9 ps 3 pi 2

set border front ls 101

set ylabel "Normalized slope of countrate [counts/mV]" offset 0 font "Arial, 32"
set xlabel "Threshold [mV]" offset 0 font "Arial, 32"

#set key outside
set key right top box lw 2 opaque 

set yrange [0.001:1.1]
set xrange [40:680]

#set ytics 100
#set mytics 20
#set xtics 5
#set mxtics 



set grid lc "grey" lw 2
#set grid mxtics
set grid mytics

set style line 1 lc "red" lt 1 lw 3 pt 9 ps 3 
set style line 2 lc "orange" lt 1 lw 3 pt 9 ps 3 
set style line 3 lc "yellow" lt 1 lw 3 pt 9 ps 3 
set style line 4 lc "green" lt 1 lw 3 pt 9 ps 3 
set style line 5 lc "cyan" lt 1 lw 3 pt 9 ps 3 
set style line 6 lc "blue" lt 1 lw 3 pt 9 ps 3 
set style line 7 lc "#00008b" lt 1 lw 3 pt 9 ps 3 

#set logscale y 

amplitude1 = 20051 
amplitude2 = 22760
amplitude3 = 33287

m1 = 1
m2 = 1
m3 = 1

b1 = 1
b2 = 1
b3 = 1

f1(x)=m1*x+b1
f2(x)=m2*x+b2
f3(x)=m3*x+b3

fit [100:350] f1(x) "1x1n2_countrate_20gC_der3.txt" using 1:(log(((-1*$3)/amplitude1))) via m1,b1
fit [100:350] f2(x) "4x1n6p_countrate_20gC_der3.txt" using 1:(log(((-1*$3)/amplitude2))) via m2,b2
fit [100:350] f3(x) "4x1n6h_countrate_20gC_der3.txt" using 1:(log(((-1*$3)/amplitude3))) via m3,b3

plot \
	"1x1n2_countrate_20gC_der3.txt" using 1:(log(((-1*$3)/amplitude1))) with lp ls 6 title "(s)-configuration", \
	"4x1n6p_countrate_20gC_der3.txt" using 1:(log(((-1*$3)/amplitude2))) with lp ls 4 title "(p)-configuration", \
	"4x1n6h_countrate_20gC_der3.txt" using 1:(log(((-1*$3)/amplitude3))) with lp ls 1 title "(h)-configuration", \
	f1(x) ls 6,\
	f2(x) ls 4,\
	f3(x) ls 1

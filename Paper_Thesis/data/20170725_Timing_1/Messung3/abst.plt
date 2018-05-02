# use with gnuplot

#set title "Single SiPM"

set terminal wxt size 1280,1024 enhanced font "Arial, 28"
set termoptions enhanced

set datafile sep ";"

set style line 101 lc "black" lt 1 lw 3 pt 9 ps 3 pi 2

set border front ls 101

set xlabel "Threshold [-mV]" offset 0 font "Arial, 32"
#set x2label "Time [ps]"
set ylabel "Distance [ns]" offset 0 font "Arial, 32"

#set key outside
set key left top box lw 2
set key font ",20"

#set ytics 100
#set mytics 2
#set xtics 5
#set mxtics 2

set grid lc "grey" lw 2
#set grid mxtics
#set grid mytics

set style line 1 lc "red" lt 1 lw 3 pt 9 ps 3 
set style line 2 lc "orange" 
set style line 3 lc "yellow" 
set style line 4 lc "green" 
set style line 5 lc "cyan" 
set style line 6 lc "blue" 
set style line 7 lc "#00008b" 

eichung1(x)=6.3611*x-23631
eichung2(x)=6.3611*x

#set xrange [0:8191]
#set x2range [eichung1(0):eichung1(8191)]
#set x2tics

plot \
	"abst.csv" using (-1*$1):(($3)/1) with lp ls 1 title "Time distance"
	
	
	
#		"abst.csv" using (-1*$1):(($14)/1000) with lp ls 1 title "Time distance"

	
	
	
	
	
	
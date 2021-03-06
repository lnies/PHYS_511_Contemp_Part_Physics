# use with gnuplot

#set title "Single SiPM (logscale)"

set terminal wxt size 740,1280 enhanced font "Arial, 40"
set termoptions enhanced

set style line 101 lc "black" lt 1 lw 3 pt 9 ps 3 pi 2

set border front ls 101 front

set xrange [-6.5:6.5]
set yrange [-12.5:12.5]

set xlabel "x position [cm]" offset +0,+2.0 font "Arial, 40"
set ylabel "y position [cm]" offset +0.75 font "Arial, 40"

set key outside 
set key center over box lw 2 opaque 

set datafile sep ";"

tickss = 5

set ytics tickss 
set mytics tickss
set xtics tickss offset +0.0,+1.25
set mxtics tickss
#set ticscale 1
#set tics in
#set format y "10^{%1.0f}"

set grid lc "grey" lw 2 
set grid mxtics
set grid mytics

#set logscale y

set style line 1 lc "blue" lt 1 lw 3 pt 5 ps 3

set view map


splot \
	"aufl.csv" using 1:2:3 ls 1 notitle 

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
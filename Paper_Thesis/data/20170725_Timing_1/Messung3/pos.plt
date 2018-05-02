# use with gnuplot

#set title "Single SiPM (logscale)"

set terminal wxt size 740,1280 enhanced font "Arial, 28"
set termoptions enhanced

set style line 101 lc "black" lt 1 lw 3 pt 9 ps 3 pi 2

set border front ls 101 front

set xrange [-6.5:6.5]
set yrange [-12.5:12.5]

set xlabel "x position [cm]" offset +0 font "Arial, 28"
set ylabel "y position [cm]" offset +0.75 font "Arial, 28"

set cblabel "Score" 

set key outside 
set key center over box lw 2 opaque 

set datafile sep ";"

set ytics 2
set mytics 2
set xtics 2
set mxtics 2
#set ticscale 1
#set tics in
#set format y "10^{%1.0f}"

set grid lc "black" lw 0.75 
set grid mxtics
set grid mytics

#set logscale y

set style line 1 lc "blue" lt 1 lw 3 pt 5 ps 3

set view map

set pm3d interpolate 0,0

set palette defined (0 0 0 0.5, 1 0 0 1, 2 0 0.5 1, 3 0 1 1, 4 0.5 1 0.5, 5 1 1 0, 6 1 0.5 0, 7 1 0 0, 8 0.5 0 0)


set cblabel "Time delay [ns]" 
set lmargin at screen 0.2
set rmargin at screen 0.7

eichung(x)=6.3611*x-23631

splot \
	"aufl.csv" using 1:2:(eichung($4)/1000) ls 1 notitle with pm3d

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
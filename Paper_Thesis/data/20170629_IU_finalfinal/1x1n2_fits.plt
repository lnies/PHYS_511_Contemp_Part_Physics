# use with gnuplot

#set title "Single SiPM (logscale)"

set terminal wxt size 1280,1024 enhanced font "Arial, 28"
set termoptions enhanced

set style line 101 lc "black" lt 1 lw 3 pt 9 ps 3 pi 2

set border front ls 101


set xlabel "Temperature [{/Symbol \260}C]" offset 0 font "Arial, 32"
set ylabel "Voltage [V]" offset 0 font "Arial, 32"

#set key outside
set key left top box lw 2 opaque

set ytics 1
set mytics 2
#set xtics 5
#set mxtics 2

set grid lc "grey" lw 2
set grid mxtics
set grid mytics



m1 = 1
y1 = 1
m2 = 1
y2 = 1


pol1(x) =  m1*x+y1
pol2(x) =  m2*x+y2 

set fit errorvariables

fit pol1(x) "1x1n2_fits.txt" using 1:2:3 via m1,y1 
fit pol2(x) "1x1n2_fits.txt" using 1:4:5 via m2,y2 

plot \
	"1x1n2_fits.txt" using 1:2:3 w yerr lw 5 lc "blue" title "Operation Voltage", \
	"1x1n2_fits.txt" using 1:4:5 w yerr lw 5 lc "red" title "Breakdown Voltage", \
	pol1(x) lw 4 lc "blue" title "Linear Fit", \
	pol2(x) lw 4 lc "red" title "Linear Fit" 


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
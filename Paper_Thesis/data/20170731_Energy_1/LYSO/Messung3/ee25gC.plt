# use with gnuplot

#set title "Single SiPM"

set terminal wxt size 1280,1024 enhanced font "Arial, 28"
set termoptions enhanced

set datafile sep ";"

set style line 101 lc "black" lt 1 lw 3 pt 9 ps 3 pi 2

set border front ls 101

set xlabel "ADC channel" offset 0 font "Arial, 32"
set x2label "Energy calibration [keV]" offset 0 font "Arial, 32"
set ylabel "Energy [keV]" offset 0 font "Arial, 32"

#set key outside
set key left top box lw 2
set key font ",32"

#set ytics 100
set mytics 2
#set xtics 5
set mxtics 2

set grid lc "grey" lw 2
set grid mxtics
set grid mytics

set style line 1 lc "red" lt 1 lw 3 pt 9 ps 3 
set style line 2 lc "orange" 
set style line 3 lc "yellow" 
set style line 4 lc "green" 
set style line 5 lc "cyan" 
set style line 6 lc "blue" 
set style line 7 lc "#00008b" 



linfit(x)=m*x+b

fit linfit(x) "ee25gC.csv" using 3:9 via m,b 

set xrange [0:9000]
set x2range [linfit(0):linfit(9000)]
set x2tics

plot linfit(x) ls 6 lw 5 title "Linear fit", \
	"ee25gC.csv" using 3:9:5 ps 4 pt 9 lc "red" with xerr title "Data"
	
	
	
	
	
	
	
	
	
	
	
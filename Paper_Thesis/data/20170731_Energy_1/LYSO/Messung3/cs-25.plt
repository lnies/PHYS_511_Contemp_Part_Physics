# use with gnuplot

#set title "Single SiPM"

set terminal wxt size 1280,1024 enhanced font "Arial, 28"
set termoptions enhanced

set style line 101 lc "black" lt 1 lw 3 pt 9 ps 3 pi 2

set border front ls 101

set xlabel "ADC Channel" offset 0 font "Arial, 32"
#set x2label "Time [ps]"
set ylabel "Counts" offset 0 font "Arial, 32"

#set key outside
set key right top box lw 2
set key font ",20"

#set ytics 100
#set mytics 2
#set xtics 5
#set mxtics 2

set grid lc "grey" lw 2
#set grid mxtics
#set grid mytics

set style line 1 lc "red" 
set style line 2 lc "orange" 
set style line 3 lc "yellow" 
set style line 4 lc "green" 
set style line 5 lc "cyan" 
set style line 6 lc "blue" 
set style line 7 lc "#00008b" 

eichung(x)=0.258725*x+24.9225



set xrange [0:6000]
set x2range [eichung(0):eichung(6000)]
set x2tics
set x2label "Energy [keV]" font ",32"

n=2000
max=8191
min=0
width=(max-min)/n
hist(x,width)=width*floor(x/width)+width/2.0
set boxwidth width*0.9

set style fill transparent solid 0.5 noborder

norm_cs_1=1
norm_cs_2=1


plot \
	"cs-25gC_1.txt" using (hist($0,width)):($1/norm_cs_1) smooth freq w boxes ls 6 title "137Cs -25 °C", \
	"cs-25gC_1.txt" using (hist($0,width)):($1/norm_cs_1) smooth freq w histeps ls 6 lw 2 notitle, \
	
	
	
	
	
	
	
	
	
	

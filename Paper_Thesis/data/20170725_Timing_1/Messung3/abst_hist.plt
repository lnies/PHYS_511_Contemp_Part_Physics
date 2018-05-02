# use with gnuplot

#set title "Single SiPM"

set terminal wxt size 1280,1024 enhanced font "Arial, 28"
set termoptions enhanced

set style line 101 lc "black" lt 1 lw 3 pt 9 ps 3 pi 2

set border front ls 101

set xlabel "ADC Channel" offset 0 font "Arial, 32"
set x2label "Time [ps]"
set ylabel "Counts" offset 0 font "Arial, 32"

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

set style line 1 lc "red" 
set style line 2 lc "orange" 
set style line 3 lc "yellow" 
set style line 4 lc "green" 
set style line 5 lc "cyan" 
set style line 6 lc "blue" 
set style line 7 lc "#00008b" 

eichung(x)=6.3611*x-23631

untere = 2200
obere = 5200

set xrange [untere:obere]
set x2range [eichung(untere):eichung(obere)]
set x2tics

n=1000
max=8191
min=0
width=(max-min)/n
hist(x,width)=width*floor(x/width)+width/2.0
set boxwidth width*0.95

set style fill solid 0.75 noborder


plot \
	"abstand_-50mV.txt" using (hist($0,width)):($1) smooth freq w boxes ls 1 title "-50mV", \
	"abstand_-50mV.txt" using (hist($0,width)):($1) smooth freq w histeps ls 1 lw 2 notitle, \
	"abstand_-100mV.txt" using (hist($0,width)):($1) smooth freq w boxes ls 2 title "-100mV", \
	"abstand_-100mV.txt" using (hist($0,width)):($1) smooth freq w histeps ls 2 lw 2 notitle, \
	"abstand_-200mV.txt" using (hist($0,width)):($1) smooth freq w boxes ls 4 title "-200mV", \
	"abstand_-200mV.txt" using (hist($0,width)):($1) smooth freq w histeps ls 4 lw 2 notitle, \
	"abstand_-300mV.txt" using (hist($0,width)):($1) smooth freq w boxes ls 5 title "-300mV", \
	"abstand_-300mV.txt" using (hist($0,width)):($1) smooth freq w histeps ls 5 lw 2 notitle, \
	"abstand_-500mV.txt" using (hist($0,width)):($1) smooth freq w boxes ls 7 title "-500mV",\
	"abstand_-500mV.txt" using (hist($0,width)):($1) smooth freq w histeps ls 7 lw 2 notitle
	
	
	
	
	
	
	
	
	
	
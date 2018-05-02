# use with gnuplot

#set title "Single SiPM"

reset

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

set xrange [0:8191]
set x2range [eichung(0):eichung(8191)]
set x2tics

n=410
max=8191
min=0
width=(max-min)/n
hist(x,width)=width*floor(x/width)+width/2.0
set boxwidth width*0.9

set style fill solid 0.75 noborder


plot \
	"ze-10ns.txt" using (hist($0,width)):($1) smooth freq w boxes ls 1 title "-10ns", \
	"ze-10ns.txt" using (hist($0,width)):($1) smooth freq w histeps ls 1 lw 2 notitle, \
	"ze-15ns.txt" using (hist($0,width)):($1) smooth freq w boxes ls 2 title "-5ns", \
	"ze-15ns.txt" using (hist($0,width)):($1) smooth freq w histeps ls 2 lw 2 notitle, \
	"ze-20ns.txt" using (hist($0,width)):($1) smooth freq w boxes ls 3 title "0ns", \
	"ze-20ns.txt" using (hist($0,width)):($1) smooth freq w histeps ls 3 lw 2 notitle, \
	"ze-25ns.txt" using (hist($0,width)):($1) smooth freq w boxes ls 4 title "5ns", \
	"ze-25ns.txt" using (hist($0,width)):($1) smooth freq w histeps ls 4 lw 2 notitle, \
	"ze-30ns.txt" using (hist($0,width)):($1) smooth freq w boxes ls 5 title "10ns", \
	"ze-30ns.txt" using (hist($0,width)):($1) smooth freq w histeps ls 5 lw 2 notitle, \
	"ze-35ns.txt" using (hist($0,width)):($1) smooth freq w boxes ls 6 title "15ns", \
	"ze-35ns.txt" using (hist($0,width)):($1) smooth freq w histeps ls 6 lw 2 notitle, \
	"ze-40ns.txt" using (hist($0,width)):($1) smooth freq w boxes ls 7 title "20ns",\
	"ze-40ns.txt" using (hist($0,width)):($1) smooth freq w histeps ls 7 lw 2 notitle
	
	
	
	
	
	
	
	
	
	
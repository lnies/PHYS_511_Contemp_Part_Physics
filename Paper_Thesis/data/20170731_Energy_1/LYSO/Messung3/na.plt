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

eichung1(x)=0.439336*x+107.465
eichung2(x)=0.391819*x+97.1193

set xrange [0:3800]
#set x2range [eichung(0):eichung(8191)]
#set x2tics

n=410
max=8191
min=0
width=(max-min)/n
hist(x,width)=width*floor(x/width)+width/2.0
set boxwidth width*0.9

set style fill transparent solid 0.5 noborder

norm_na_1=1
norm_na_2=1


plot \
	"na25gC_1.txt" using (eichung1((hist($0,width)))):($1/norm_na_1) smooth freq w boxes ls 1 title "22Na 25gC", \
	"na-25gC_2.txt" using (eichung2((hist($0,width)))):($1/norm_na_2) smooth freq w boxes ls 4 title "22Na -25gC", \
	
	
	
	
	
	
	
	
	
	

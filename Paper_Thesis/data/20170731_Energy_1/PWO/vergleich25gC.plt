# use with gnuplot

#set title "Single SiPM"

reset

set terminal wxt size 1280,1024 enhanced font "Arial, 28"
set termoptions enhanced

set style line 101 lc "black" lt 1 lw 3 pt 9 ps 3 pi 2

set border front ls 101

set xlabel "ADC Channel" offset 0 font "Arial, 32"
#set x2label "Energy [keV]"
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

set style line 1 lc "red" lw 3
set style line 2 lc "orange" lw 3
set style line 3 lc "yellow" lw 3
set style line 4 lc "green" lw 3
set style line 5 lc "cyan" lw 3
set style line 6 lc "blue" lw 3
set style line 7 lc "#00008b" lw 3

#eichung(x)=0.268752*x+11.3597

set xrange [0:8192]
#set x2range [eichung(0):eichung(8192)]
#set x2tics

n=410
max=8191
min=0
width=(max-min)/n
hist(x,width)=width*floor(x/width)+width/2.0
set boxwidth width*0.9

set style fill transparent solid 0.5 noborder

norm_ba=1
norm_co=1
norm_cs=1
norm_na=1 
norm_eu=1


plot \
	"co25gC_1.txt" using (hist($0,width)):(log($1/norm_ba)) smooth frequency with histeps ls 4 title "60Co 25gC", \
	"na25gC_1.txt" using (hist($0,width)):(log($1/norm_na)) smooth frequency with histeps ls 5 title "22Na 25gC", \
	"unter25gc_1.txt" using (hist($0,width)):(log($1/norm_cs)) smooth frequency with histeps ls 1 title "Untergrund 25gC", \
	
	
	
	
	
	
	
	
	

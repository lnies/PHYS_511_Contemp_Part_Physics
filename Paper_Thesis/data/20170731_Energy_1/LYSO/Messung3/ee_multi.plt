# use with gnuplot

#set title "Single SiPM"

unset multiplot

set terminal wxt size 1100,600 enhanced font "Arial, 28"

set termoptions enhanced

set style line 101 lc "black" lt 1 lw 3 pt 9 ps 3 pi 2

set datafile sep ";"

set border front ls 101

#set xlabel "ADC Channel" offset 0 font "Arial, 32"
#set x2label "Energy [keV]"
#set ylabel "Counts" offset 0 font "Arial, 32"

#set key outside
set key left top box lw 2
set key font ",20"

#set ytics 100
set mytics 2
#set xtics 5
set mxtics 2

set grid lc "grey" lw 2
set grid mxtics
set grid mytics

set multiplot layout 0,1 rowsfirst

set macros

AAMARGIN = "set tmargin at screen 0.90; set bmargin at screen 0.20"
BAMARGIN = "set tmargin at screen 0.90; set bmargin at screen 0.20"

LMARGIN = "set lmargin at screen 0.15; set rmargin at screen 0.55"
RMARGIN = "set lmargin at screen 0.55; set rmargin at screen 0.95"

NOXTICS = "set xtics ('' 1000) format ' '; \
          unset xlabel"
XTICS = "set xtics ('1000' 1000, '2000' 2000, '3000' 3000, '4000' 4000, '5000' 5000) format '%.0f' font ',18' offset 0,0 ;\
          set xlabel 'Channel' offset 10,0.5 "
NOYTICS = "set format y ''; unset ylabel"
YTICS = "set ytics 500 format '%.0f' font ',18' offset -0,0 ; set ylabel 'Energy [keV]' offset 1,0"

set style line 1 lc "red" 
set style line 2 lc "orange" 
set style line 3 lc "yellow" 
set style line 4 lc "green" 
set style line 5 lc "cyan" 
set style line 6 lc "blue" 
set style line 7 lc "#00008b" 

eichungA(x)=0.268752*x+11.3597
eichungB(x)=0.258725*x+24.9225

set grid mxtics
set grid mytics

set xrange [0:6000]
set yrange [0:1500]
#set x2range [eichung(0):eichung(6000)]
#set x2tics

linfitA(x)=mA*x+bA
linfitB(x)=mB*x+bB

mA=1;mB=1;bA=1;bB=1

fit linfitA(x) "ee25gC.csv" using 3:9 via mA,bA 

fit linfitB(x) "ee-25gC.csv" using 3:9 via mB,bB 

@AAMARGIN; @LMARGIN; @XTICS; @YTICS; set x2label "Temperature 25 °C" font ",20"
plot linfitA(x) ls 6 lw 5 title "Linear fit", \
	"ee25gC.csv" using 3:9:5 ps 4 pt 9 lc "red" with xerr title "Data 25 °C"
@BAMARGIN; @RMARGIN; @XTICS; @NOYTICS; set x2label "Temperature -25 °C" font ",20"; unset xlabel
plot linfitB(x) ls 6 lw 5 title "Linear fit", \
	"ee-25gC.csv" using 3:9:5 ps 4 pt 9 lc "red" with xerr title "Data -25 °C"

	
	
	
	
	

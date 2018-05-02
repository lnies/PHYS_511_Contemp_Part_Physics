# use with gnuplot

#set title "Single SiPM (logscale)"

set terminal wxt size 1280,1024 enhanced font "Arial, 28"
set termoptions enhanced

set style line 101 lc "black" lt 1 lw 3 pt 9 ps 3 pi 2

set border front ls 101


set xlabel "Voltage [V]" offset 0 font "Arial, 32"
set ylabel "Counts" offset 0 font "Arial, 32"

#set key outside
set key left top box lw 2 opaque

#set ytics 1
#set mytics 2
#set xtics 5
#set mxtics 2

set grid lc "grey" lw 2
#set grid mxtics
#set grid mytics

#set boxwidth binwidth


n=462 #number of intervals
max=170#max value
min=18 #min value
width=(max-min)/n #interval width
hist(x,width)=width*floor(x/width)+width/2.0
set boxwidth width*1

set style fill solid 0.15 
 
plot "F6pulse300000.txt" using (hist(-1000*$1,width)):(log($2)) smooth freq w boxes title "1x1n2" lc "black"
#plot "F6pulse300000.txt" using (-1*$1):(log($2)) smooth freq with boxes title "1x1n2" lc "black" , \

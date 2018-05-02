#set object 1 rectangle from graph 0, graph 0 to graph 1, graph 1 behind fc rgbcolor "grey" fs noborder

set terminal qt enhanced font "Arial, 16"

set style line 11 lc rgb '#808080' lt 1
set border 3 back ls 11
set tics nomirror
set style line 12 lc rgb '#808080' lt 0 lw 1
set grid back ls 12

set title "Histrogram der Spannungsversorgung bei konstanter Temperatur bei Durchbruchsspannung"
set ylabel "Counts per Voltage"
set xlabel "Voltage [V]"

set style fill transparent solid 0.35

n=50000 #number of intervals
max=23.0 #max value
min=23.5 #min value
width=(max-min)/n #interval width
#function used to map a value to the intervals
hist(x,width)=width*floor(x/width)+width/2.0
set boxwidth width*0.9

#count and plot
plot \
	"test3.txt" using (hist($4,width)):(1.0) smooth freq with boxes lc "red" notitle
	


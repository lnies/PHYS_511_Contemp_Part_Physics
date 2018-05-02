set object 1 rectangle from graph 0, graph 0 to graph 1, graph 1 behind fc rgbcolor "grey" fs noborder

set terminal qt enhanced font "Arial, 20"

set grid

#set logscale y

set title "Histrogram der Spannungsversorgung beim Temperaturtest"
set ylabel "Counts per Voltage"
set xlabel "Voltage [V]"

set style fill transparent solid 0.35

n=200 #number of intervals
max=33.2 #max value
min=31.8 #min value
width=(max-min)/n #interval width
#function used to map a value to the intervals
hist(x,width)=width*floor(x/width)+width/2.0
set boxwidth width*0.9

#count and plot
plot \
	"test2.txt" u (hist($2,width)):(1.0) smooth freq w boxes lc rgb"red" notitle, \
	"test1.txt" u (hist($2,width)):(1.0) smooth freq w boxes lc rgb"green" notitle
	


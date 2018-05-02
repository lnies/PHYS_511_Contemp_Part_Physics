set terminal wxt enhanced font "Arial, 20"
set termoption enhanced 
set grid
set object 1 rectangle from graph 0, graph 0 to graph 1, graph 1 behind fc rgbcolor 'grey' fs noborder

set ylabel "Kanalnummer K"
set xlabel "Energie E[MeV]"
set title "Eichmessung"

set datafile separator "&"

K(x)=b*x+a
a=1;b=1

fit K(x) "energieeichung.txt" u 1:2:3 yerr via a, b

plot 	"energieeichung.txt" u ($1):($2-(b*$1+a)):($3) with yerr pt 2 ps 3 lc "red" title "Residuen der Energieeichung"
		#K(x) title "Linear Fit"
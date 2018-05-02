set terminal wxt enhanced font "Arial, 20"
set termoption enhanced 
set grid
set object 1 rectangle from graph 0, graph 0 to graph 1, graph 1 behind fc rgbcolor 'grey' fs noborder

set ylabel "Kanalnummer K"
set xlabel "Energie E [MeV]"
set title "Eichmessung"

set datafile separator "&"

K(E)=b*E+a
a=1;b=1

fit K(x) "energieeichung.txt" u 1:2:3 yerr via a, b

set label 1 sprintf("K(E)=b*E+a") at graph 0.8,0.54 font "arialbd,18"
set label 2 sprintf("a = %3.4f",a) at graph 0.8,0.5 font "arialbd,18"
set label 3 sprintf("b = %3.4f",b) at graph 0.8,0.46 font "arialbd,18"

plot 	K(x) title "Linear Fit" lw 4 lc rgb "#228b22", \
		"energieeichung.txt" u 1:2:3 with yerr pt 2 ps 3 lc "red" title "Messwerte"
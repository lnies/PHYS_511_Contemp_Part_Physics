set object 1 rectangle from graph 0, graph 0 to graph 1, graph 1 behind fc rgbcolor "grey" fs noborder

set terminal qt enhanced font "Arial, 16"

set grid


set title "Stromfluss 1x1n2 25Gray bei 32V"
set ylabel "Strom [nA]"
set xlabel "Temperatur [gradCelc]"



plot \
	"test1.txt" using 4:3 title "Abkuehlen" with points pt 4 ps 0.5, \
	"test2.txt" using 4:3 title "Auftauen" with points pt 1 ps 1, \
	"test3_gestern.txt" using 4:3 title "Auftauen gestern" with points pt 1 ps 1
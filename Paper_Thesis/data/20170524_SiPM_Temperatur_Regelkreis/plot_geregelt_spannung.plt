#set object 1 rectangle from graph 0, graph 0 to graph 1, graph 1 behind fc rgbcolor "grey" fs noborder

set terminal qt enhanced font "Arial, 16"

set style line 11 lc rgb '#808080' lt 1
set border 3 back ls 11
set tics nomirror
set style line 12 lc rgb '#808080' lt 0 lw 1
set grid back ls 12


set title "Vergleich geregelt/ungeregelt"
set ylabel "Strom [muA]"
set xlabel "Spannung [V]"

#set y2tics
#set y2label "Temperatur [gradC]"

#set y2range [-25:30]

plot \
	"regel.txt" using 2:($3/1000) title "Spannung geregelt", \
	"test1_alt.txt" using 2:($3/1000) title "Spannung ungeregelt"
	#"regel.txt" using 2:4 title "Temperatur" axes x1y2

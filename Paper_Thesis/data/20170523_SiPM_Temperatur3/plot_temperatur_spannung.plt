#set object 1 rectangle from graph 0, graph 0 to graph 1, graph 1 behind fc rgbcolor "grey" fs noborder

set terminal qt enhanced font "Arial, 16"

set style line 11 lc rgb '#808080' lt 1
set border 3 back ls 11
set tics nomirror
set style line 12 lc rgb '#808080' lt 0 lw 1
set grid back ls 12

set y2range [10.0:25.0]
set grid 
set y2tic

set title "Spannungs beim Auftauen"
set xlabel "Messpunkt"
set ylabel "Spannung [V]"
set y2label "Temperatur [gC]"

plot \
	"test1.txt" using 0:2 title "Spannung bei U=30.8V", \
	"test1.txt" using 0:4 axes x1y2 smooth bez lw 3 title "Temperatur"

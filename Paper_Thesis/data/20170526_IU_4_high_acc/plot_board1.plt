#set object 1 rectangle from graph 0, graph 0 to graph 1, graph 1 behind fc rgbcolor "grey" fs noborder

set terminal qt enhanced font "Arial, 16"

set style line 11 lc rgb '#808080' lt 1
set border 3 back ls 11
set tics nomirror
set style line 12 lc rgb '#808080' lt 0 lw 1
set grid back ls 12


set title "IU-Kennlinien Board 1x1n1"
set ylabel "Strom [muA]"
set xlabel "Spannung [V]"

#set y2tics
#set y2label "Temperatur [gradC]"

#set y2range [-25:30]

plot \
	"iu_curve_1x1n5_N1n100loop_0gC.txt" using 2:(log($3+18)) title "0 gC" ,\
	"iu_curve_1x1n5_N1n100loop_10gC.txt" using 2:(log($3+18)) title "10 gC" ,\
	"iu_curve_1x1n5_N1n100loop_20gC.txt" using 2:(log($3+18)) title "20 gC" ,\
	"iu_curve_1x1n5_N1n100loop_-25gC.txt" using 2:(log($3+18)) title "-25 gC" 

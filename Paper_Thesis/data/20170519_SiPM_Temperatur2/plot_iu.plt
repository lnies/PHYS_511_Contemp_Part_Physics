#set object 1 rectangle from graph 0, graph 0 to graph 1, graph 1 behind fc rgbcolor "grey" fs noborder

set terminal qt enhanced font "Arial, 16"

set style line 11 lc rgb '#808080' lt 1
set border 3 back ls 11
set tics nomirror
set style line 12 lc rgb '#808080' lt 0 lw 1
set grid back ls 12


set title "IU-Kennlinie bei eigentlich gleichbleibender Spannung 1x1n2 25Gray bei 32V"
set ylabel "Spannung [V]"
set xlabel "Strom [muA]"

m = 1
b = 1

f(x)=m*x+b 

fit f(x) "test1.txt" using ($3/1000):($2) via m, b

set label 1 sprintf("slope = %2.4f*10e6 Ohm ",m) at 22,33 font "Arial, 18"

plot \
	"test1.txt" using ($3/1000):($2) title "Abkuehlen", \
	"test2.txt" using ($3/1000):($2) title "Auftauen", \
	f(x) title "Linear Fit" lw 2 lc "red"
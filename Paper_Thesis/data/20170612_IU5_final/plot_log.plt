

set title "Fein-Messung im Durchbruch"
set xlabel "Spannung [V]"
set ylabel "Strom [nA]"
set grid
set xrange [24:29]

plot \
	"iu_1x1n1_fein_n100l2h_20gC.txt" using 2:(log($3)) with lp title "20gC" lc "red",\
	"iu_1x1n1_fein_n100l2h_15gC.txt" using 2:(log($3)) with lp title "15gC" lc "orange",\
	"iu_1x1n1_fein_n100l2h_10gC.txt" using 2:(log($3)) with lp title "10gC" lc "yellow",\
	"iu_1x1n1_fein_n100l2h_0gC.txt" using 2:(log($3)) with lp title "0gC" lc "blue",\
	"iu_1x1n1_fein_n100l2h_5gC.txt" using 2:(log($3)) with lp title "5gC" lc "green",\
	"iu_1x1n1_fein_n200l2h_-25gC.txt" using 2:(log($3)) with lp title "-25gC",\
	#"iu_1x1n1_manual_20gC.txt" using 1:(log($2)) with lp title "20gC Manuell" lc "blue"
	#"iu_1x1n1_fein_n100l2h_20gC.txt" using ($2-0.35):(log($3)) with lp title "20gC verschoben" lc "blue",\
set title "Fein-Messung im Durchbruch"
set xlabel "Spannung [V]"
set ylabel "Strom [nA]"
set grid
set xrange [24:29]

plot \
	"iu_1x1n1_fein_n100l2h_20gC.txt" using 2:3 with lp ,\
	"iu_1x1n1_fein_n100l2h_15gC.txt" using 2:3 with lp,\
	"iu_1x1n1_fein_n100l2h_0gC.txt" using 2:3 with lp,\
	"iu_1x1n1_fein_n100l2h_10gC.txt" using 2:3 with lp,\
	"iu_1x1n1_fein_n100l2h_5gC.txt" using 2:3 with lp,\
	"iu_1x1n1_fein_n200l2h_-25gC.txt" using 2:3 with lp,\
	#"iu_1x1n1_fein_n100l2h_15gC.txt" using 2:3 with lp,\
	#"iu_1x1n1_manual_20gC.txt" using 1:2 with lp
	#"iu_1x1n1_fein_n100l2h_20gC.txt" using ($2-0.35):3 with lp,\
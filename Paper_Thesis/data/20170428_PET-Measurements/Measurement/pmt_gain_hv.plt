#use with gnuplot

set grid

set terminal qt font "Arial,20"

set title "Scan PMT-Gain TH:70mV with source t=60s"
set xlabel "Voltage [V]"
set ylabel "Counts in 60 secs"

set style fill transparent solid 0.5

plot \
	"pmt_gain_hv_det1.txt" using 1:2 with lines title "Det1", \
	"pmt_gain_hv_det2.txt" using 1:2 with lines title "Det2"
	

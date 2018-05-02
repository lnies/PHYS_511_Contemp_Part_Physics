reset
fontsize = 12
set terminal wxt size 1024,1024 enhanced font "Arial, 28"

set style line 101 lc "black" lt 1 lw 3 pt 9 ps 3 pi 2

set border front ls 101

set grid lc "grey" lw 2

set key center top box lw 2
set key font ",20"
set style fill solid 1.00 border 0
set style histogram errorbars gap 1 lw 3
set style data histogram
set xtics rotate by -45
set grid ytics
set ytics format ",20"
set xtics 
set format y "%.0f%%" 
set format x "%.0f%"
set xlabel "Calibration source energy [keV]"
set ylabel "Resolution"
set yrange [0:*]
set datafile separator ";"
plot 'ee25gC.csv' using 12:13 ti "25 °C" linecolor "red", \
	 'ee-25gC.csv' using 12:13:xtic(9) ti "-25 °C" lt 1 lc "blue"
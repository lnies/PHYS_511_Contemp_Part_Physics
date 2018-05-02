# use with gnuplot

set title "Multiplot SiPMs (Logscale)"

#set object 1 rectangle from graph 0, graph 0 to graph 1, graph 1 behind fc rgbcolor "grey" fs noborder

set terminal qt size 1400,900 enhanced font "Arial, 20"
set termoptions enhanced

set xlabel "Voltage (NOT CALIBRATED) [V]"
set ylabel "Current (NOT CALIBRATED) [log(nA)]"

set key outside
set key right top

set xrange [20:78]
#set yrange [0:0.9]

set ytics 0.5
set mytics 2
set xtics 4
set mxtics 5

set grid lw 1.2 lc "grey"
set grid mxtics
set grid mytics

plot \
	"iu_curve_Wien_sipm_1_tstable.txt" using 2:(log($3)) lc "red" lw 1 title "Data SiPM#1", \
	"iu_curve_Wien_sipm_2_tstable.txt" using 2:(log($3)) lc "orange" lw 1 title "Data SiPM#2", \
	"iu_curve_Wien_sipm_3_tstable.txt" using 2:(log($3)) lc "yellow" lw 1 title "Data SiPM#3", \
	"iu_curve_Wien_sipm_4_tstable.txt" using 2:(log($3)) lc "blue" lw 1 title "Data SiPM#4", \
	"iu_curve_Wien_sipm_5_tstable.txt" using 2:(log($3)) lc "green" lw 1 title "Data SiPM#5", \
	"iu_curve_Wien_sipm_6_tstable.txt" using 2:(log($3)) lc "brown" lw 1 title "Data SiPM#6", \

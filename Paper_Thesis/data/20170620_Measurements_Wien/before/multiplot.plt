# use with gnuplot

set title "Multiplot SiPMs"

#set object 1 rectangle from graph 0, graph 0 to graph 1, graph 1 behind fc rgbcolor "grey" fs noborder

set terminal qt size 1400,900 enhanced font "Arial, 20"
set termoptions enhanced

set xrange [20:78]

set xlabel "Voltage (NOT CALIBRATED) [V]"
set ylabel "Current (NOT CALIBRATED) [nA]"

set key outside
set key right top

set ytics 100
set mytics 2
set xtics 5
set mxtics 2

set grid lc "grey" lw 2
set grid mxtics
set grid mytics

plot \
	"iu_curve_Wien_sipm_1_tstable.txt" using 2:3 lc "red" lw 1 title "Data SiPM#1", \
	"iu_curve_Wien_sipm_2_tstable.txt" using 2:3 lc "orange" lw 1 title "Data SiPM#2" , \
	"iu_curve_Wien_sipm_3_tstable.txt" using 2:3 lc "yellow" lw 1 title "Data SiPM#3" , \
	"iu_curve_Wien_sipm_4_tstable.txt" using 2:3 lc "blue" lw 1 title "Data SiPM#4", \
	"iu_curve_Wien_sipm_5_tstable.txt" using 2:3 lc "green" lw 1 title "Data SiPM#5", \
	"iu_curve_Wien_sipm_6_tstable.txt" using 2:3 lc "brown" lw 1 title "Data SiPM#6", \


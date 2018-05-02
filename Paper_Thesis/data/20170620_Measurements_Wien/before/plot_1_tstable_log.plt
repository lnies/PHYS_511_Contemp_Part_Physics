# use with gnuplot

set title "IV-Curve SiPM #1 (Logscale)"

#set object 1 rectangle from graph 0, graph 0 to graph 1, graph 1 behind fc rgbcolor "grey" fs noborder

set terminal qt size 1000,900 enhanced font "Arial, 20"
set termoptions enhanced

set xlabel "Voltage (NOT CALIBRATED) [V]"
set ylabel "Current (NOT CALIBRATED) [log(nA)]"

set xrange [45:58]
#set yrange [0:0.9]

set ytics 0.5
set mytics 2
set xtics 4
set mxtics 5

set grid
set grid mxtics
set grid mytics


pol(x) = ( x > 52 && x < 53.7 ) ? a * x**2 + b * x + c : 1/0
lin(x) = ( x > 27 && x < 54 ) ? m * x + y0 : 1/0

a = 1
b = 1
c = 1
m = 1
y0 = 1

fit [0:52.5] lin(x) "iu_curve_Wien_sipm_1_tstable.txt" using 2:(log($3)) via m,y0
fit [52.5:53.7] pol(x) "iu_curve_Wien_sipm_1_tstable.txt" using 2:(log($3)) via a,b,c

x1 = -(b-m)/(2.0*a) + sqrt((((b-m)/((2.0*a)))**2.0)-((c-y0)/a))
x2 = -(b-m)/(2.0*a) - sqrt((((b-m)/((2.0*a)))**2.0)-((c-y0)/a))
sqrttt = sqrt((((b-m)/((2.0*a)))**2.0)-((c-y0)/a))


set label 1 sprintf("x1 = %2.4f",x1) at graph 0.05,0.90 font "Arial, 18"
set label 2 sprintf("U_{BD} = %2.4f",x2) at graph 0.05,0.95 font "Arial, 18"
#set label 3 sprintf("sqrttt = %2.8f",sqrttt) at 53.25,3 font "Arial, 18"



plot \
	"iu_curve_Wien_sipm_1_tstable.txt" using 2:(log($3)) lc "red" lw 1 title "Data SiPM#1", \
	lin(x) lw 2 lc "green" title "Linear Fit of Baseline",\
	pol(x) lw 2 lc "blue" title "2nd Order Polynomial Fit Breakdown"

# use with gnuplot

set title "IV-Curve SiPM #4"

#set object 1 rectangle from graph 0, graph 0 to graph 1, graph 1 behind fc rgbcolor "grey" fs noborder

set terminal qt size 1000,900 enhanced font "Arial, 20"
set termoptions enhanced

set xlabel "Voltage (NOT CALIBRATED) [V]"
set ylabel "Current (NOT CALIBRATED) [nA]"

set xrange [38:68]
set yrange [-50:1100]

set ytics 100
set mytics 2
set xtics 2
set mxtics 2

set grid
set grid mxtics
set grid mytics


pol(x) = ( x > 53.00 && x < 57 ) ? a * x**2 + b * x + c : 1/0
lin(x) = ( x > 38.5 && x < 56.00 ) ? m * x + y0 : 1/0

a = 1
b = 1
c = 1
m = 1
y0 = 1

#fit [0:53.25] lin(x) "iu_curve_Wien_sipm_4.txt" using 2:(log($3)) via m,y0
#fit [53.30:57] pol(x) "iu_curve_Wien_sipm_4.txt" using 2:(log($3)) via a,b,c

#x1 = -(b-m)/(2.0*a) + sqrt((((b-m)/((2.0*a)))**2.0)-((c-y0)/a))
#x2 = -(b-m)/(2.0*a) - sqrt((((b-m)/((2.0*a)))**2.0)-((c-y0)/a))
#sqrttt = sqrt((((b-m)/((2.0*a)))**2.0)-((c-y0)/a))


#set label 1 sprintf("x1 = %2.4f",x1) at graph 0.05,0.90 font "Arial, 18"
#set label 2 sprintf("U_{BD} = %2.4f",x2) at graph 0.05,0.95 font "Arial, 18"
#set label 3 sprintf("sqrttt = %2.8f",sqrttt) at 53.25,3 font "Arial, 18"



plot \
	"iu_curve_Wien_sipm_4.txt" using 2:3 lc "red" lw 1 title "Data SiPM#4" with lp, \
	#lin(x) lw 2 lc "green" title "Linear Fit of Baseline",\
	#pol(x) lw 2 lc "blue" title "2nd Order Polynomial Fit Breakdown"

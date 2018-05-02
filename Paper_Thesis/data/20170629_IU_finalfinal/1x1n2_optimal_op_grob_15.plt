# use with gnuplot

#set title "Single SiPM (logscale)"

set terminal wxt size 1280,1024 enhanced font "Arial, 28"
set termoptions enhanced

set style line 101 lc "black" lt 1 lw 3 pt 9 ps 3 pi 2

set border front ls 101

set xrange [25.5:34]
set yrange [0.5:2.5]

set xlabel "Voltage [V]" offset 0 font "Arial, 32"
set ylabel "dI/dU * 1/I [1/V]" offset 1.75 font "Arial, 32"

#set key outside
set key left top box lw 2 opaque

#set ytics 100
set mytics 2
#set xtics 5
set mxtics 2

set grid lc "grey" lw 2
set grid mxtics
set grid mytics

set style line 1 lc "yellow" lt 1 lw 2 pt 9 ps 1 pi 2

A=1
B=1
C=1

x_min = 29
x_max = 32.5

pol2(x) = ( x > x_min && x < x_max ) ? A*x**2+B*x+C : 1/0

set fit errorvariables

fit [x_min:x_max] pol2(x) "iu_curve_1x1n2_grob_15gC_der.txt" using 1:4 via A,B,C

x0 = - (B/(2*A))
y0 = pol2(x0)
x0_err = (B/(2*A))*A_err+(1/(2*A))*B_err

set label 1 sprintf("U_{OP} = (%2.4f {/Symbol \261} %2.4f)V",x0,x0_err) at x0-1.75,y0+0.5 font "Arial, 28"

#set label 2 sprintf("dx0 = %2.4f",dx0) at graph 0.7,0.9 font "Arial, 28"


set arrow 1 from x0,y0+0.40 to x0,y0+0.05 lw 3

plot \
	"iu_curve_1x1n2_grob_15gC_der.txt" using 1:4 with lp ls 1 title "15 {/Symbol \260}C", \
	pol2(x) lc "green" lw 3 title "Fit"
	
	
	
	
	
	
	
	
	
	
	
	

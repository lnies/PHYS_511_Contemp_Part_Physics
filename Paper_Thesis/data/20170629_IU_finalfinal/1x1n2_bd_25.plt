# use with gnuplot

#set title "Single SiPM (logscale)"

set terminal wxt size 1280,1024 enhanced font "Arial, 28"
set termoptions enhanced

set style line 101 lc "black" lt 1 lw 3 pt 9 ps 3 pi 2

set border front ls 101

set xrange [22:29]
set yrange [-0.5:log10(1200)]

set xlabel "Voltage [V]" offset 0 font "Arial, 32"
set ylabel "Current [nA]" offset 0 font "Arial, 32"

#set key outside
set key left top box lw 2 opaque

set ytics 1
set mytics 2
#set xtics 5
#set mxtics 2
set ticscale 1
set tics in
set format y "10^{%1.0f}"

set grid lc "grey" lw 2
set grid mxtics
set grid mytics

#set logscale y

set style line 1 lc "red" lt 1 lw 3 pt 9 ps 3 pi 2

m = 1
y0 = 1
A = 1
B = 1
C = 1

x_min1 = 0
x_max1 = 25.5

x_min2 = 25.5
x_max2 = 25.9

pol1(x) = ( x > x_min1 && x < x_max1+1 ) ? m*x+y0 : 1/0
pol2(x) = ( x > x_min2-1 && x < x_max2 ) ? A*x**2+B*x+C : 1/0

set fit errorvariables

fit [x_min1:x_max1] pol1(x) "iu_curve_1x1n2_25gC.txt" using 2:(log10($3-12.27)) via m,y0
fit [x_min2:x_max2] pol2(x) "iu_curve_1x1n2_25gC.txt" using 2:(log10($3-12.27)) via A,B,C

x1 = -(B-m)/(2.0*A) + sqrt((((B-m)/((2.0*A)))**2.0)-((C-y0)/A))
x2 = -(B-m)/(2.0*A) - sqrt((((B-m)/((2.0*A)))**2.0)-((C-y0)/A))

y1 = m*x1+y0
#y2 = pol1(x1) 

if (x1<x2) x1_err = \
	-((2*B - 2*m + sqrt(2)*A*sqrt((B - 2*C - m + 2*y0)/A))/(4*A**2)) * A_err \
	+ (1/(2*A) + 1/(4* A* sqrt((B - m)/(2* A) - (C - y0)/A))) *B_err \
	-(1/(2 *A* sqrt((B - m)/(2* A) - (C - y0)/A))) *C_err \
	-((1/(2* A)) - 1/(4 *A* sqrt((B - m)/(2 *A) - (C - y0)/A))) *m_err \
	+(1/(4 *A* sqrt((B - m)/(2 *A) - (C - y0)/A)))*y0_err; \
	else x2_err = \
	-((-2*B + 2*m + sqrt(2)*A*sqrt((B - 2*C - m + 2*y0)/A))/(4*A**2)) * A_err \
	+ (1/(2*A) - 1/(4* A* sqrt((B - m)/(2* A) - (C - y0)/A))) *B_err \
	+(1/(2 *A* sqrt((B - m)/(2* A) - (C - y0)/A))) *C_err \
	+((1/(2* A)) - 1/(4 *A* sqrt((B - m)/(2 *A) - (C - y0)/A))) *m_err \
	+(1/(4 *A* sqrt((B - m)/(2 *A) - (C - y0)/A)))*y0_err

if (x1<x2) set label 1 sprintf("U_{BD} = (%2.4f {/Symbol \261} %2.4f)V",x1,x1_err) at x1+0.5,y1+1.2 font "Arial, 28"; \
	else set label 2 sprintf("U_{BD} = (%2.4f {/Symbol \261} %2.4f)V",x2,x2_err) at x2+0.5,y1+1.2 font "Arial, 28"

if (x1<x2) set arrow 1 from x1+1,y1+1 to x1+0.1,y1+0.1 lw 3; \
	else set arrow 1 from x2+1,y1+1 to x2+0.1,y1+0.1 lw 3



plot \
	"iu_curve_1x1n2_25gC.txt" using 2:(log10($3-12.27)) with lp ls 1 title "25 {/Symbol \260}C", \
	pol1(x) lw 5 lc "blue" title "1st order fit", \
	pol2(x) lw 5 lc "green" title "2nd order fit"


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
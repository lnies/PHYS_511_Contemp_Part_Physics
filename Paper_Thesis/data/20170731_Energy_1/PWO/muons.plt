# use with gnuplot

#set title "Single SiPM"

reset

set terminal wxt size 1280,1024 enhanced font "Arial, 28"
set termoptions enhanced

set style line 101 lc "black" lt 1 lw 3 pt 9 ps 3 pi 2

set border front ls 101

set xlabel "ADC Channel" offset 0 font "Arial, 32"
#set x2label "Channels"
set ylabel "Counts in arbitrary units (logscale)" offset 0 font "Arial, 32"

#set key outside
set key right top box lw 2
set key font ",20"

#set ytics 100
#set mytics 2
#set xtics 5
#set mxtics 2

set grid lc "grey" lw 2
#set grid mxtics
#set grid mytics

set style line 1 lc "red" lw 3
set style line 2 lc "orange" lw 3
set style line 3 lc "yellow" lw 3
set style line 4 lc "green" lw 3
set style line 5 lc "cyan" lw 3
set style line 6 lc "blue" lw 3
set style line 7 lc "#00008b" lw 3

#eichung(x)=0.268752*x+11.3597

set xrange [0:8192]
#set x2range [eichung(0):eichung(8192)]
#set x2tics

n=1000
max=8191
min=0
width=(max-min)/n
hist(x,width)=width*floor(x/width)+width/2.0
set boxwidth width*0.9

set style fill transparent solid 0.5 noborder

norm_ba=1
norm_co=1
norm_cs=1
norm_na=1 
norm_eu=1

unset logscale y

set table $histtabledata1

plot \
	"muon-25gC_4.txt" using (hist($0,width)):($1) smooth freq with boxes ls 4 title "Muons -25gC with trigger", \
	#"muon-25gC_1.txt" using (hist($0,width)):($1) smooth freq with boxes ls 1 title "Muons -25gC ohne Trigger oben", \
		
unset table 

set table $histtabledata2

plot \
	"co-25gC_mu_3.txt" using (hist($0,width)):($1) smooth freq with boxes ls 4 title "60Co calibration", \

unset table 
	
set logscale y 

plot $histtabledata1 using 1:($2 == 0 || strcol(3) eq "u" ? 1/0 : $2) w boxes ls 4 title "Muon spectrum with trigger", \
	 $histtabledata1 using 1:($2 == 0 || strcol(3) eq "u" ? 1/0 : $2) w histeps ls 4 notitle, \
	 $histtabledata2 using 1:($2 == 0 || strcol(3) eq "u" ? 1/0 : $2) w histeps ls 1 title "Calibration 60Co spectrum", \
	 
	
	
	
	
	
	

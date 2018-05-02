# use with gnuplot

#set title "Single SiPM"

reset

unset multiplot

set terminal wxt size 1000,1000 enhanced font "Arial, 28"
set termoptions enhanced

set multiplot layout 5,2 rowsfirst

set style line 101 lc "black" lt 1 lw 3 pt 9 ps 3 pi 2

set border front ls 101

#set xlabel "ADC Channel" offset 0 font "Arial, 32"
#set x2label "Energy [keV]"
#set ylabel "Counts" offset 0 font "Arial, 32"

#set key outside
set key right top box lw 2 opaque
set key font ",20"

#set ytics 100
#set mytics 2
#set xtics 5
#set mxtics 2

set grid lc "grey" lw 2
#set grid mxtics
#set grid mytics

set macros

AAMARGIN = "set tmargin at screen 0.90; set bmargin at screen 0.725"
BAMARGIN = "set tmargin at screen 0.725; set bmargin at screen 0.55"
CAMARGIN = "set tmargin at screen 0.550; set bmargin at screen 0.375"
DAMARGIN = "set tmargin at screen 0.375; set bmargin at screen 0.20"
DOUBLEMARGIN = "set tmargin at screen 0.550; set bmargin at screen 0.20"
QUADRAMARGIN = "set tmargin at screen 0.90; set bmargin at screen 0.20"

LMARGIN = "set lmargin at screen 0.15; set rmargin at screen 0.55"
RMARGIN = "set lmargin at screen 0.55; set rmargin at screen 0.95"

NOXTICS = "set xtics 1000 format ' '; \
          unset xlabel"
XTICS = "set xtics format '%.0f' font ',14' offset 0,0.5 ;\
          set xlabel 'Channel' offset 9,1.2 "
NOYTICS = "set format y ''; unset ylabel"
YTICS = "set format y ''; set ylabel 'Counts in arbitrary units (log scale)'"

set style line 1 lc "red" 
set style line 2 lc "orange" 
set style line 3 lc "yellow" 
set style line 4 lc "green" 
set style line 5 lc "cyan" 
set style line 6 lc "blue" 
set style line 7 lc "#00008b" 

#eichungA(x)=0.268752*x+11.3597
#eichungB(x)=0.258725*x+24.9225


set xrange [0:8192]
#set x2range [eichung(0):eichung(6000)]
#set x2tics

n=410
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
norm_u1=1.75
norm_u2=1.40
norm_u3=1.25


@QUADRAMARGIN; @LMARGIN; @XTICS; @YTICS; set x2label "Temperature 25 °C" font ",20"
plot "co25gC_1.txt" using (hist($0,width)):(log10($1/norm_ba)) smooth freq w boxes ls 4 title "60Co" ,\
	 "co25gC_1.txt" using (hist($0,width)):(log10($1/norm_ba)) smooth freq w histeps ls 4 lw 3 notitle,\
	 "na25gC_1.txt" using (hist($0,width)):(log10($1/norm_ba)) smooth freq w boxes ls 5 title "22Na" ,\
	 "na25gC_1.txt" using (hist($0,width)):(log10($1/norm_ba)) smooth freq w histeps ls 5 lw 3 notitle ,\
	 "unter25gc_1.txt" using (hist($0,width)):(log10($1/norm_ba)) smooth freq w histeps ls 1 lw 3 title "Background"

@AAMARGIN; @RMARGIN; @NOXTICS; @NOYTICS; set x2label "Temperature -25 °C" font ",20"
plot "co-25gC_3.txt" using (hist($0,width)):(log10($1/norm_ba)) smooth freq w boxes ls 4 title "60Co",\
     "co-25gC_3.txt" using (hist($0,width)):(log10($1/norm_ba)) smooth freq w histeps ls 4 lw 3 notitle,\
 	 "unter-25gC_1.txt" using (hist($0,width)):(log10($1)/norm_u1) smooth freq w histeps ls 1 lw 3 notitle
@BAMARGIN; @RMARGIN; @NOXTICS; @NOYTICS; unset x2label
plot "na-25gC_1.txt" using (hist($0,width)):(log10($1/norm_ba)) smooth freq w boxes ls 5 title "22Na",\
     "na-25gC_1.txt" using (hist($0,width)):(log10($1/norm_ba)) smooth freq w histeps ls 5 lw 3 notitle,\
 	 "unter-25gC_1.txt" using (hist($0,width)):(log10($1)/norm_u2) smooth freq w histeps ls 1 lw 3 notitle
@CAMARGIN; @RMARGIN; @NOXTICS; @NOYTICS
plot "cs-25gC_1.txt" using (hist($0,width)):(log10($1/norm_ba)) smooth freq w boxes ls 6 title "137Cs",\
     "cs-25gC_1.txt" using (hist($0,width)):(log10($1/norm_ba)) smooth freq w histeps ls 6 lw 3 notitle ,\
	 "unter-25gC_1.txt" using (hist($0,width)):(log10($1)/norm_u3) smooth freq w histeps ls 1 lw 3 notitle
@DAMARGIN; @RMARGIN; @XTICS; @NOYTICS; unset xlabel
plot "unter-25gC_1.txt" using (hist($0,width)):(log10($1/norm_ba)) smooth freq w boxes ls 1 title "Background",\
     "unter-25gC_1.txt" using (hist($0,width)):(log10($1/norm_ba)) smooth freq w histeps ls 1 lw 3 notitle			

	
	
	
	
	

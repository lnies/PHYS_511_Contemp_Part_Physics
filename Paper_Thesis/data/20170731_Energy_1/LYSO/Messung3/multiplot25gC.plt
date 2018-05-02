# use with gnuplot

#set title "Single SiPM"

unset multiplot

set terminal wxt size 1100,1000 enhanced font "Arial, 28"
set termoptions enhanced

set style line 101 lc "black" lt 1 lw 3 pt 9 ps 3 pi 2

set border front ls 101

#set xlabel "ADC Channel" offset 0 font "Arial, 32"
#set x2label "Energy [keV]"
#set ylabel "Counts" offset 0 font "Arial, 32"

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

set multiplot layout 5,2 rowsfirst

set macros

AAMARGIN = "set tmargin at screen 0.90; set bmargin at screen 0.74"
BAMARGIN = "set tmargin at screen 0.74; set bmargin at screen 0.58"
CAMARGIN = "set tmargin at screen 0.58; set bmargin at screen 0.42"
DAMARGIN = "set tmargin at screen 0.42; set bmargin at screen 0.26"
EAMARGIN = "set tmargin at screen 0.26; set bmargin at screen 0.10"

LMARGIN = "set lmargin at screen 0.15; set rmargin at screen 0.55"
RMARGIN = "set lmargin at screen 0.55; set rmargin at screen 0.95"

NOXTICS = "set xtics 200 format ' '; \
          unset xlabel"
XTICS = "set xtics format '%.0f' font ',16' offset 0,0.5 ;\
          set xlabel 'Energy [keV]' offset 9,1.2 "
NOYTICS = "set format y ''; unset ylabel"
YTICS = "set format y ''; set ylabel 'Counts in arbitrary units'"

set style line 1 lc "red" 
set style line 2 lc "orange" 
set style line 3 lc "yellow" 
set style line 4 lc "green" 
set style line 5 lc "cyan" 
set style line 6 lc "blue" 
set style line 7 lc "#00008b" 

eichungA(x)=0.268752*x+11.3597
eichungB(x)=0.258725*x+24.9225


set xrange [eichungA(0):eichungA(6000)]
#set x2range [eichung(0):eichung(6000)]
#set x2tics

n=410
max=8191
min=0
width=(max-min)/n
hist(x,width)=width*floor(x/width)+width/2.0
set boxwidth width*0.9

set style fill transparent solid 0.2 noborder

norm_ba=36510
norm_co=3114
norm_cs=40715
norm_na=9182 
norm_eu=51832

@AAMARGIN; @LMARGIN; @NOXTICS; @NOYTICS; set x2label "Temperature 25 °C" font ",20";
plot "ba25gC_1.txt" using (eichungA(hist($0,width))):($1/norm_ba) smooth freq w boxes ls 1 notitle,\
     "ba25gC_1.txt" using (eichungA(hist($0,width))):($1/norm_ba) smooth freq w histeps ls 1 lw 2 title "133Ba"
@BAMARGIN; @LMARGIN; @NOXTICS; @NOYTICS; unset x2label
plot "co25gC_1.txt" using (eichungA(hist($0,width))):($1/norm_co) smooth freq w boxes ls 4 notitle,\
	 "co25gC_1.txt" using (eichungA(hist($0,width))):($1/norm_co) smooth freq w histeps ls 4 lw 2 title "60Co"
@CAMARGIN; @LMARGIN; @NOXTICS; @YTICS
plot "cs25gC_1.txt" using (eichungA(hist($0,width))):($1/norm_cs) smooth freq w boxes ls 6 notitle,\
     "cs25gC_1.txt" using (eichungA(hist($0,width))):($1/norm_cs) smooth freq w histeps ls 6 lw 2 title "137Cs"
@DAMARGIN; @LMARGIN; @NOXTICS; @NOYTICS
plot "na25gC_1.txt" using (eichungA(hist($0,width))):($1/norm_na) smooth freq w boxes ls 5 notitle,\
     "na25gC_1.txt" using (eichungA(hist($0,width))):($1/norm_na) smooth freq w histeps ls 5 lw 2 title "22Na"
@EAMARGIN; @LMARGIN; @XTICS; @NOYTICS
plot "eu25gC_1.txt" using (eichungA(hist($0,width))):($1/norm_eu) smooth freq w boxes ls 2 notitle,\
     "eu25gC_1.txt" using (eichungA(hist($0,width))):($1/norm_eu) smooth freq w histeps ls 2 lw 2 title "152Eu"	
@AAMARGIN; @RMARGIN; @NOXTICS; @NOYTICS; set x2label "Temperature -25 °C" font ",20"
plot "ba-25gC_1.txt" using (eichungB(hist($0,width))):($1/norm_ba) smooth freq w boxes ls 1 notitle,\
     "ba-25gC_1.txt" using (eichungB(hist($0,width))):($1/norm_ba) smooth freq w histeps ls 1 lw 2 title "133Ba"	
@BAMARGIN; @RMARGIN; @NOXTICS; @NOYTICS; unset x2label
plot "co-25gC_test3.txt" using (eichungB(hist($0,width))):($1/norm_co) smooth freq w boxes ls 4 notitle,\
     "co-25gC_test3.txt" using (eichungB(hist($0,width))):($1/norm_co) smooth freq w histeps ls 4 lw 2 title "60Co"	
@CAMARGIN; @RMARGIN; @NOXTICS; @NOYTICS
plot "cs-25gC_1.txt" using (eichungB(hist($0,width))):($1/norm_cs) smooth freq w boxes ls 6 notitle,\
     "cs-25gC_1.txt" using (eichungB(hist($0,width))):($1/norm_cs) smooth freq w histeps ls 6 lw 2 title "137Cs"	
@DAMARGIN; @RMARGIN; @NOXTICS; @NOYTICS
plot "na-25gC_1.txt" using (eichungB(hist($0,width))):($1/norm_na) smooth freq w boxes ls 5 notitle,\
     "na-25gC_1.txt" using (eichungB(hist($0,width))):($1/norm_na) smooth freq w histeps ls 5 lw 2 title "22Na"	
@EAMARGIN; @RMARGIN; @XTICS; @NOYTICS; unset  xlabel
plot "eu-25gC_1.txt" using (eichungB(hist($0,width))):($1/norm_eu) smooth freq w boxes ls 2 notitle,\
     "eu-25gC_1.txt" using (eichungB(hist($0,width))):($1/norm_eu) smooth freq w histeps ls 2 lw 2 title "152Eu"	
		
	
	
	
	
	
	

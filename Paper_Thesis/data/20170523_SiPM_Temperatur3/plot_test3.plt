set terminal wxt enhanced font "Arial, 12"

set y2range [23.0:23.3]
set grid 
set y2tic

set title "Spannungs- und Temperaturschwankungen bei etwa 30.8V"
set xlabel "Messpunkt"
set ylabel "Spannung [V]"
set y2label "Temperatur [gC]"

plot "test3.txt" using 0:2, "test3.txt" using 0:4 axes x1y2 

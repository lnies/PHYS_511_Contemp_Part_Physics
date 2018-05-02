binwidth=10
bin(x,width)=width*floor(x/width)+binwidth/2.0

set style fill transparent solid 0.5 noborder

plot \
	"spek1.txt" using (bin($0,binwidth)):($1*1.00) smooth freq with boxes title "Spek1", \
	"spek5.txt" using (bin($0,binwidth)):($1*1) smooth freq with boxes title "Spek5"
	#"referenz.txt" using (bin($0,binwidth)):($1) smooth freq with boxes title "Referenz", \

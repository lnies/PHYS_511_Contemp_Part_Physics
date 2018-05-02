/*                      STAND 22.04.2016
	difflines berechnet die Differenz zwischen zwei Zeilen
	einer Datei
							*/

// On Linux compile with 'g++ -o difflines difflines.cpp

#include <sstream>
#include <fstream>
#include <iostream>
#include <string>
#include <iomanip>
#include <vector>
#include <cmath>
#include <time.h>
#include <unistd.h>
#include <stdlib.h>
using namespace std;


//+++++++++++++++++++++++++++++++++++++++ Algorithmen ++++++++++++++++++++++++++++++++++++++++//

vector<long double> algorithmus(vector<long double> liste1)
{
	long double diff;
	vector<long double> diffvector;
	for(int i = 0; i < liste1.size()-1; i++)
    	{
       		diff = fabs(liste1[i+1]-liste1[i]);
		diffvector.push_back(diff);
	}
	return diffvector;
}




//++++++++++++++++++++++++++++++++++++ Andere Funktionen ++++++++++++++++++++++++++++++++++++//


void Usage()
{
	cout<<endl;
	cout<<"Berechnet die Differenz benachbarter Eintraege einer Liste"<<endl;
	cout<<"Das Ergebnis wird in der Form" <<endl;
	cout<<"[ Differenz ]		"<<endl;
	cout<<"in <output> gespeichert. <File1> sollte die Form haben:" <<endl;
	cout<<"[ Timestamp ]		"<<endl<<endl;
	cout<<"Benutzung:    " <<"difflines"<<" [-vh?][-o<output> File1"<<endl;
	cout<<"		Optionen:"<<endl;
	cout<<"		-h?		  : Zeigt diese Hilfeseite an."<<endl;
 	cout<<"		-v		  : Steigert das Verbosity-Level"<<endl;
	cout<<"		-o <output>	  : Pfad/Name der Output-Datei."<<endl;
	cout<<"		-f 		  : Zeitformate sind UNIX-Timestamps"<<endl;
	cout<<endl<<endl;
	cout<<"Geschrieben von <Lukas.Nies@physik.uni-giesse.de> Stand 29.04.2016"<<endl<<endl;
}


int main (int argc, char** argv)
{
    int ch, verbose = 0;
    bool formatabfrage = false;
    string dat1, out, suche;
    while ((ch = getopt(argc, argv, "fvo:h?")) != EOF)
    {
       if ((char)ch == 'o')
       {
            out = optarg;
            //printf("Output wurde gewaehlt. %s.c_str()\n", out.c_str());
       }
       if ((char)ch == 'h' || (char)ch == '?' )
       {
	   Usage();
	   return -1;
       }
       if ((char)ch == 'v')
       {
	   verbose++;
       }
       if ((char)ch=='f')
       {
           formatabfrage=true;
       }
    }
    argc -= optind;
    argv += optind;
    if (argc > 1)
    {
	perror("Falsche Eingabe, zu viele Argumente!\n");
	Usage();
    	return -1;
    }
    if (argc < 1)
    {
	perror("Falsche Eingabe, zu wenige Argumente!\n");
	Usage();
	return -1;
    }
    dat1 = *argv;
    if ( verbose > 0 )
    {
	cout << "Erster Dateiname ist " << dat1.c_str() <<"."<<endl;
    }
    --argc;
    ++argv;
    char date[20];
    vector<long double> liste1;
    ifstream data1(dat1.c_str());
    // Test, ob die angegeben Dateien zu oeffnen sind
    if ( !data1.is_open() )
    {
        cout << "Can't open " << dat1.c_str() << endl;
        return -1;
    }
    string line1;
    while( !data1.eof() )
    {
        getline(data1, line1);
        stringstream str1(line1);
        long double value1 = 0;
        str1 >> value1;
        // Test, ob der Zeitstempel "gesund" ist
        if (formatabfrage==true)
        {
            if ( value1 < 1400000000 ||value1 > 2000000000 )
            {
	        if ( verbose > 0 )
	        {
		    cout << "Fehlerhafter Eintrag (Wert kein plausibler Timestamp): " << value1 << endl;
	        }
                continue;
            }
        }
        // Wenn man nicht den ersten Eintrag betrachtet, dann
        if ( (liste1.size() > 0) )
        {
            // wird getestet, ob der einzulesende Wert groesser ist, als der vorherige (muss so sein)
            if (  liste1.back() < value1  )
            {
                liste1.push_back(value1);
            }
	    if ( verbose > 0 || liste1.back() > value1 )
	    {
		cout << "Fehler: Wert liegt zeitlich in Vergangenheit: " << value1 <<endl;
 	    }
        }
        else { liste1.push_back(value1); }
    }
    if ( verbose > 0 )
    {
    	cout << "Laenge Liste1: " << liste1.size() << endl;
    }
    vector<long double> diffvector;

    diffvector = algorithmus(liste1);

    ofstream output(out.c_str());
    for(int i = 0; i < diffvector.size(); i++)
    {
        output.precision(9);
        output << fixed << diffvector[i] << endl;
    }
}

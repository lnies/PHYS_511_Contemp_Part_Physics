void hist()
{
	gROOT->Reset();
	gROOT->SetStyle("Plain");
	ifstream in;
	in.open("referenz.txt");
	Float_t xi;
	Int_t nlines = 0;
	
	TH1F* _histo = new TH1F("_histo","Spektrum",3000,0.,16385.);

	while( !in.eof() )
	{
		if ( in >> xi )
		{
			_histo->SetBinContent( nlines, xi );
			nlines++;
			//cout << nlines << ": " << xi << endl;
		}
	}
	cout << "found " << nlines << " data points" << endl;
	in.close();
	_histo->Draw();
}

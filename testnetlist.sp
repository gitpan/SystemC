
//error test:
///*AUTOSIGNAL*/

SC_MODULE (mod_sub) {
    sc_in_clk		clk;		  // **** System Inputs
    sc_in<bool>		in;
    sc_out<bool>	out;
}

SC_MODULE (mod) {

    sc_in_clk		clk;		  // **** System Inputs
    sc_in<bool>		in;
    sc_out<bool>	out;

    /*AUTOSUBCELLS*/

    //error test:
    //sc_signal<bool> in;

    /*AUTOSIGNAL*/

    SC_CTOR(__MODULE__) {
	//====
	SP_CELL (sub0, mod_sub);
	 SP_PIN  (sub0, out, cross);
	 /*AUTOINST*/
	 //Error test:
	 //SP_PIN  (sub0, nonexisting_error, cross);

	//====
	SP_CELL (sub1, mod_sub);
	 SP_PIN  (sub1, in, cross);
	 /*AUTOINST*/
    };
}

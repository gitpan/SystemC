
#sp interface
#include "tte_struct.h"

enum myenum {
    IDLE = 0,
    ONE, TWO, THREE, FOUR, FIVE
};
struct showmyenum {
    myenum en;
    /*AUTOASCIIENUM(myenum)*/
    const char *ascii (void) {
	switch (en) {
	case IDLE: return "IDLE";
	case ONE: return "ONE";
	case TWO: return "TWO";
	case THREE: return "THREE";
	case FOUR: return "FOUR";
	case FIVE: return "FIVE";
	};
    }
};

SC_MODULE (tte) {
    sc_in_clk		clk;		  // **** System Inputs
    sc_in<bool>		reset;		  //  system reset

    /*AUTOSUBCELLS*/
   // Beginning of SystemPerl automatic foo
rip this out please
   // End of SystemPerl automatic foo
    /*AUTOSIGNAL*/

    sc_signal<TTEMxb> 	cac_pdm;	// CAC->PDM Return
    SC_CTOR(tte) {
	// Instantion and Inter-Connect
	int i;
	SP_CELL (pec, tte_pktcmd_in);
	SP_PIN (pec, foo, bar);
	for (i=0;i<C14_POS_NUM_PRTS;i++) {
	    SP_PIN (pec, rnpi_pec_clav[i], rnpi_pec_clav[i]);
	    pec->rnpi_pec_clav[i] 	(rnpi_pec_clav[i]);
	}
	 /*AUTOINST*/
    }

#line 100
/*100comment
  101comment*/
#line 200 "scfoo"
// 200 comment
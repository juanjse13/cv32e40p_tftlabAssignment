#include "tests.h"


const signature_t const GOLDEN_SIGNATURES[NUMTESTS] = {
	0xCAFECAFE,	// TEST1
	0xCAFECAFE,	// TEST2
	0xCAFECAFE,	// TEST3
	0xCAFECAFE,	// TEST4

};

int main()
{
	int i, fails;
	signature_t signatures[NUMTESTS];
	
	signatures[TEST1] = test1();
	signatures[TEST2] = test2();
	signatures[TEST3] = atpg_patterns_DIV();
	signatures[TEST4] = div_test();	
	

	for(i=0; i<NUMTESTS; i++) {
		fails += signatures[i] != GOLDEN_SIGNATURES[i];
	}

 	return fails;
}
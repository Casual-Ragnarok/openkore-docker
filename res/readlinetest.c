#include <stdio.h>
#include <readline/readline.h>
	#if !defined(RL_READLINE_VERSION)
     	 #error "You do not have the GNU readline development headers installed!"
	#elif RL_READLINE_VERSION < 0x0500
     	 #error "Your version of GNU readline is too old. Please install version 5.0 or higher."
#endif
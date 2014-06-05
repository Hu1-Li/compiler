#ifndef VAR_H
#define VAR_H

#define VAR_LENGTH 4
#define HASHSIZE 19

#define SCALAR 1
#define ARRAY 2
#define GENERAL 1
#define PARAMETER 2

#define FUNC_OUTPUT_NAME "output"
#define FUNC_INPUT_NAME "input"

HashNode *var_local[HASHSIZE];
HashNode *var_local_SorA[HASHSIZE];     /* local scalar or array */
HashNode *var_local_GorP[HASHSIZE];     /* local general or param */
HashNode *var_global_SorA[HASHSIZE];    /* global array or scalar*/

#endif

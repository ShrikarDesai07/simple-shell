#ifndef EXECUTOR_H
#define EXECUTOR_H

#include "parser.h"

int execute_pipeline(const struct Pipeline *pipeline);
void reap_background(void);

#endif

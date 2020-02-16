#!/bin/bash

sar -n DEV -B -r -u 1 1| grep Average | awk '{if (NR==2) printf("idle: %s%% | ",$8); else if (NR==4) printf("page: in %sKBps out %sKBps | ", $2, $3); else if (NR==6) printf("mem: %s%% | ", $4); else if (NR==11) printf("↑ %sKBps ↓ %sKBps\n", $6, $5);}'

#!/bin/bash
salloc -n 1 -N 1 -c 40 -t 2:00:00 --qos=debug --gres=gpu:1

#!/bin/bash

module load python
module load gpu
module load e4s/23.08
module load PrgEnv-nvidia

spack env activate gcc
spack load py-libensemble

cc -O3 -DGPU -fopenmp -mp=gpu -target-accel=$CRAY_ACCEL_TARGET -o forces.x forces.c
python run_libe_forces.py --comms local --nworkers 8

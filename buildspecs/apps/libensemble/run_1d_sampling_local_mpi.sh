#!/bin/bash

module load python
module load e4s/23.08

spack env activate gcc
spack load py-libensemble
spack load py-mpi4py

python test_1d_sampling.py --comms local --nworkers 4
srun --ntasks=5 --nodes=1 python test_1d_sampling.py

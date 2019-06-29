# Conda from Scratch

This repository contains Dockerfiles which can be used to build a working conda
install from scratch. That is to say without the use of Miniconda or other
conda packages.  Two Dockerfile exist, `cfs_base` which includes conda and
`cfs_builder` which includes conda and conda-build.

The create docker images:
    docker build -t cfs_base cfs_base
    docker build -t cfs_builder cfs_builder




#!/bin/bash
# Utility script for running a local cdash instance

docker run -it --rm -p 80:80 -v $(pwd)/data:/var/lib/mysql cdash $*

#!/bin/bash

set -x

docker build -t cdash -f Dockerfile .

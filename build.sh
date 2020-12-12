#!/bin/bash

./prepare-files.sh
docker build -t ac-server .

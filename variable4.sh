#!/bin/bash

START_TIME=$(date +%s)



END_TIME=$(date +%s)

TOTAL_TIME=$(($END_TIME-$START_TIME))

echo "script executed in: $TOTAL_TIME seconds"

sudo dnf update && sudo dnf install
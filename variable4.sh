#!/bin/bash

DATE=$(date)

echo "executed on: $DATE"
START_TIME=$(DATE +%S)
sleep 10
END_TIME=$(DATE +%S)
TOTAL_TIME=$(($START_TIME-$END_TIME))

echo "script executed in:"$TOTAL_TIME"
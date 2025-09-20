#!/bin/bash

DATE=$(date)

echo "executed on: $DATE"
START_TIME=$(DATE +%s)
sleep 10
END_TIME=$(DATE +%s)
TOTAL_TIME=$(($START_TIME-$END_TIME))

echo "script executed in:"$TOTAL_TIME"
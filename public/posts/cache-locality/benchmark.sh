#!/bin/bash

NUM_RUNS=100

# Controllo argomento
if [ $# -eq 0 ]; then
    echo "Usage: $0 <executable_path>"
    exit 1
fi

EXECUTABLE="$1"

# Controllo eseguibilità
if [ ! -x "$EXECUTABLE" ]; then
    echo "Error: '$EXECUTABLE' is not an executable file!"
    exit 1
fi

TOTAL_REAL=0
TOTAL_USER=0
TOTAL_SYS=0
TOTAL_MINFLT=0
TOTAL_MAJFLT=0

for ((i=1; i<=NUM_RUNS; i++)); do
    OUTPUT=$( { /usr/bin/time -v "$EXECUTABLE" 2>&1; } )

    # Estrai il tempo elapsed (wall clock time)
    REAL_TIME=$(echo "$OUTPUT" | grep "Elapsed (wall clock) time" | awk '{print $8}')

    
    REAL_TIME=$(echo "$REAL_TIME" | sed 's/^0://')  # Rimuove "0:" se presente
    REAL_TIME=$(echo "$REAL_TIME" | sed 's/^0//' )  # Rimuove il primo "0"

    # Estrai user e system time
    USER_TIME=$(echo "$OUTPUT" | grep "User time" | awk '{print $4}')
    SYS_TIME=$(echo "$OUTPUT" | grep "System time" | awk '{print $4}')

    # Estrai page faults (major e minor) correttamente
    MIN_FAULTS=$(echo "$OUTPUT" | grep "Minor (reclaiming a frame) page faults" | awk '{print $(NF)}')
    MAJ_FAULTS=$(echo "$OUTPUT" | grep "Major (requiring I/O) page faults" | awk '{print $(NF)}')

    echo "Run $i: real=$REAL_TIME sec, user=$USER_TIME sec, sys=$SYS_TIME sec, minflt=$MIN_FAULTS, majflt=$MAJ_FAULTS"

    # Somma i valori per il calcolo della media
    TOTAL_REAL=$(echo "$TOTAL_REAL + $REAL_TIME" | bc -l)
    TOTAL_USER=$(echo "$TOTAL_USER + $USER_TIME" | bc -l)
    TOTAL_SYS=$(echo "$TOTAL_SYS + $SYS_TIME" | bc -l)
    TOTAL_MINFLT=$(echo "$TOTAL_MINFLT + $MIN_FAULTS" | bc -l)
    TOTAL_MAJFLT=$(echo "$TOTAL_MAJFLT + $MAJ_FAULTS" | bc -l)
done

# Calcolo delle medie
AVG_REAL=$(echo "scale=6; $TOTAL_REAL / $NUM_RUNS" | bc -l)
AVG_USER=$(echo "scale=6; $TOTAL_USER / $NUM_RUNS" | bc -l)
AVG_SYS=$(echo "scale=6; $TOTAL_SYS / $NUM_RUNS" | bc -l)
AVG_MINFLT=$(echo "scale=6; $TOTAL_MINFLT / $NUM_RUNS" | bc -l)
AVG_MAJFLT=$(echo "scale=6; $TOTAL_MAJFLT / $NUM_RUNS" | bc -l)

echo "Average time: real=$AVG_REAL sec, user=$AVG_USER sec, sys=$AVG_SYS sec, minflt=$AVG_MINFLT, majflt=$AVG_MAJFLT"

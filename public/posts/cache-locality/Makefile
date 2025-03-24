# Compiler
CC = gcc

# Flags
OPT_FLAGS = -O2 -Wall
NO_OPT_FLAGS = -Wall

# Paths
SRC_DIR = .  # Assuming the .c files are in the same directory as the Makefile
BIN_DIR = bin
BENCHMARK_SCRIPT = benchmark.sh

# Source files
ROW_SRC = loop_row.c
COLUMN_SRC = loop_column.c

# Binary names
ROW_BIN = $(BIN_DIR)/loop_row
COLUMN_BIN = $(BIN_DIR)/loop_column
ROW_BIN_OPT = $(BIN_DIR)/loop_row_opt
COLUMN_BIN_OPT = $(BIN_DIR)/loop_column_opt

# Default rule: compile non-optimized versions
all: $(ROW_BIN) $(COLUMN_BIN)

# Compile optimized versions
opt: $(ROW_BIN_OPT) $(COLUMN_BIN_OPT)

# Ensure the bin directory exists before compiling
$(BIN_DIR):
	mkdir -p $(BIN_DIR)

# Compile loop_row (non-optimized)
$(ROW_BIN): $(ROW_SRC) | $(BIN_DIR)
	$(CC) $(NO_OPT_FLAGS) $(ROW_SRC) -o $(ROW_BIN)

# Compile loop_column (non-optimized)
$(COLUMN_BIN): $(COLUMN_SRC) | $(BIN_DIR)
	$(CC) $(NO_OPT_FLAGS) $(COLUMN_SRC) -o $(COLUMN_BIN)

# Compile loop_row (optimized)
$(ROW_BIN_OPT): $(ROW_SRC) | $(BIN_DIR)
	$(CC) $(OPT_FLAGS) $(ROW_SRC) -o $(ROW_BIN_OPT)

# Compile loop_column (optimized)
$(COLUMN_BIN_OPT): $(COLUMN_SRC) | $(BIN_DIR)
	$(CC) $(OPT_FLAGS) $(COLUMN_SRC) -o $(COLUMN_BIN_OPT)

# Ensure benchmark.sh is executable
$(BENCHMARK_SCRIPT):
	chmod +x $(BENCHMARK_SCRIPT)

# Run the binaries
run_row: $(ROW_BIN)
	./$(ROW_BIN

run_column: $(COLUMN_BIN)
	./$(COLUMN_BIN)

run_row_opt: $(ROW_BIN_OPT)
	./$(ROW_BIN_OPT)

run_column_opt: $(COLUMN_BIN_OPT)
	./$(COLUMN_BIN_OPT)

# Run with time
time_row: $(ROW_BIN)
	/usr/bin/time -v ./$(ROW_BIN)

time_column: $(COLUMN_BIN)
	/usr/bin/time -v ./$(COLUMN_BIN)

time_row_opt: $(ROW_BIN_OPT)
	/usr/bin/time -v ./$(ROW_BIN_OPT)

time_column_opt: $(COLUMN_BIN_OPT)
	/usr/bin/time -v ./$(COLUMN_BIN_OPT)

# Run benchmarks (ensure benchmark.sh is executable)
benchmark_row: $(ROW_BIN) $(BENCHMARK_SCRIPT)
	./$(BENCHMARK_SCRIPT) $(ROW_BIN)

benchmark_column: $(COLUMN_BIN) $(BENCHMARK_SCRIPT)
	./$(BENCHMARK_SCRIPT) $(COLUMN_BIN)

benchmark_row_opt: $(ROW_BIN_OPT) $(BENCHMARK_SCRIPT)
	./$(BENCHMARK_SCRIPT) $(ROW_BIN_OPT)

benchmark_column_opt: $(COLUMN_BIN_OPT) $(BENCHMARK_SCRIPT)
	./$(BENCHMARK_SCRIPT) $(COLUMN_BIN_OPT)


perf_row: $(ROW_BIN)
	sudo perf stat -e cache-references,cache-misses,\
	cycles,instructions,branches,branch-misses,\
	L1-dcache-load-misses,\
	L1-icache-load-misses,LLC-load-misses,LLC-store-misses,\
	dTLB-load-misses,dTLB-store-misses,iTLB-load-misses,\
	page-faults,minor-faults,major-faults ./$(ROW_BIN)

perf_column: $(COLUMN_BIN)
	sudo perf stat -e cache-references,cache-misses,\
	cycles,instructions,branches,branch-misses,\
	L1-dcache-load-misses,\
	L1-icache-load-misses,LLC-load-misses,LLC-store-misses,\
	dTLB-load-misses,dTLB-store-misses,iTLB-load-misses,\
	page-faults,minor-faults,major-faults ./$(COLUMN_BIN)

# Clean compiled files
clean:
	rm -rf $(BIN_DIR)

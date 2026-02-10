SRC_DIR := ./src
BIN_DIR := ./build/bin
TOOLBIN := $(HOME)/opt/tools/lib # Path to libcob.so in my system

find_cobol := $(shell find $(SRC_DIR) -type f -name '*.cbl')

executable := $(patsubst $(SRC_DIR)/%.cbl,$(BIN_DIR)/%,$(find_cobol))

all: $(executable)

clean:
	rm -f $(executable)

$(BIN_DIR)/%: $(SRC_DIR)/%.cbl
	@mkdir -p $(dir $@)
	cobc -x -o $@ $< -L$(TOOLBIN) -Q -Wl,-rpath=$(TOOLBIN)
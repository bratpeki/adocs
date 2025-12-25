
COMPILER = asciidoctor

SRC_DIR = doc
BIN_DIR = out

SOURCE = $(wildcard $(SRC_DIR)/*.adoc)
TARGETS = $(patsubst $(SRC_DIR)/%.adoc, $(BIN_DIR)/%.html, $(SOURCE))

.PHONY: all clean

all: $(TARGETS)

$(BIN_DIR):
	mkdir -p $(BIN_DIR)

$(BIN_DIR)/%.html: $(SRC_DIR)/%.adoc | $(BIN_DIR)
	$(COMPILER) $< -o $@

clean:
	-rm -rf $(BIN_DIR)


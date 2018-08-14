# Makefile

ENDPOINT=http://www.stat.go.jp/data/mesh/csv

FILES=$(shell grep -v "^#" files.txt)

all: $(FILES)

%.csv:
	curl -R -o $@ $(ENDPOINT)/$(notdir $@)

clean:
	/bin/rm -f $(FILES)

.PHONY: all clean

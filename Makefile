# Makefile

ENDPOINT=http://www.stat.go.jp/data/mesh/csv

FILES=$(shell node -pe 'require(".").files.join(" ")')

all: $(FILES)

%.csv:
	curl -R -o $@ $(ENDPOINT)/$(notdir $@)

clean:
	/bin/rm -f $(FILES)

.PHONY: all clean

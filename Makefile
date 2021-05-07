# Makefile

ENDPOINT=https://www.stat.go.jp/data/mesh/csv
UA="User-Agent: Mozilla/5.0 (jp-data-mesh-csv)"
FILES=$(shell node -pe 'require(".").files.join(" ")')

all: $(FILES)

%.csv:
	curl -sR -o $@ $(ENDPOINT)/$(notdir $@) -H $(UA)

clean:
	/bin/rm -f $(FILES)

.PHONY: all clean

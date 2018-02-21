.PHONY: all
all: $(shell echo P*.pas | sed -E "s/P([^.]*)\.pas/bin\/\1/g")

bin/:
	mkdir bin

bin/%: P%.pas $(wildcard U*.pas) bin/
	fpc -TLinux -o$@ $<

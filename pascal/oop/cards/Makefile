.PHONY: all
all: $(shell echo P*.pas | sed -E "s/P([^.]*)\.pas/bin\/\1/g") clean

.PHONY: clean
clean:
	rm -f *.o *.ppu

bin/%: P%.pas $(wildcard U*.pas)
	fpc -TLinux -o$@ $<

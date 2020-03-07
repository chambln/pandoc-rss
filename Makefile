PROG = pandoc-rss
PREFIX = /usr/local
BIN = $(PREFIX)/bin
INSTALL = install

all: README.md

install: $(PROG)
	$(INSTALL) -d $(BIN)
	$(INSTALL) -m 0755 $(PROG) $(BIN)

uninstall:
	@rm -fv $(BIN)/$(PROG)

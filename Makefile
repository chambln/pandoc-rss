PREFIX = /usr/local
BIN = $(PREFIX)/bin
SHARE = $(PREFIX)/share
PROGRAM = pandoc-rss

all:
	chmod +x bin/*

install: bin/$(PROGRAM)
	mkdir -p $(BIN)
	cp -f bin/$(PROGRAM) $(BIN)
	chmod 775 $(BIN)/$(PROGRAM)

	mkdir -p $(SHARE)
	cp -fr share/$(PROGRAM) $(SHARE)

uninstall:
	rm -f $(BIN)/$(PROGRAM)

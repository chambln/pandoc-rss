PROGRAM = pandoc-rss
PREFIX = /usr/local

all: $(PROGRAM)
	chmod +x pandoc-rss

install: $(PROGRAM)
	mkdir -p $(BIN)
	cp -f $(PROGRAM) $(PREFIX)/bin
	chmod 755 $(PREFIX)/bin/$(PROGRAM)

uninstall:
	rm -f $(PREFIX)/bin/$(PROGRAM)

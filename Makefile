PREFIX = /usr/local
PROGRAM = pandoc-rss

all:
	chmod +x bin/$(PROGRAM)

install: bin/$(PROGRAM)
	mkdir -p $(PREFIX)/bin \
	         $(PREFIX)/share/$(PROGRAM)/data/templates \
	         $(PREFIX)/share/man/man1

	cp -f bin/$(PROGRAM) $(PREFIX)/bin
	chmod 775 $(PREFIX)/bin/$(PROGRAM)

	cp -f share/man/man1/$(PROGRAM).1 $(PREFIX)/share/man/man1

	cp -f share/$(PROGRAM)/data/language-codes $(PREFIX)/share/$(PROGRAM)/data
	cp -f share/$(PROGRAM)/data/templates/* $(PREFIX)/share/$(PROGRAM)/data/templates

uninstall:
	rm -f $(PREFIX)/bin/$(PROGRAM)

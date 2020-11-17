# pandoc-rss

pandoc-rss is a command-line utility for generating partial or
complete RSS feeds from the content and metadata of markup files.
Any markup format which can be read by Pandoc will do.

It is implemented as a shell script using only the shell command
language sh(1) and other utilities specified by POSIX with the sole
exception that GNU date(1) is used to transform date metadata to
conform with [RSS Best Practices section
3.2](https://www.rssboard.org/rss-profile#data-types-datetime).  Any
other non-POSIX code would be considered a bug.  If you're certain
your markup files conform to the standard date format then you can
easily patch the script and drop this dependency.

## Usage

    pandoc-rss [OPTIONS] [FILE]...

where each `FILE` corresponds to a feed item and `OPTIONS` are any
combination of the following:

      -s                Produce standalone XML
      -t TITLE         'Example Feed'
      -d DESCRIPTION   'Short description of the feed'
      -l LINK           http://example.net
      -f FORMAT         blog/%s.html  =>  http://example.net/blog/%s.html
      -w WEBMASTER     'webmaster@example.net (Real Name)'
      -c COPYRIGHT     'Year © Name, CC BY-SA 4.0'
      -n LANGUAGE       en-GB

With `-s` you should consider specifying `-t`, `-d`, `-l`, `-w`, `-c`
and `-n` as well (the defaults are guesswork based on `$PWD` and other
environment variables like `$EMAIL`).

See pandoc-rss(1) for detailed information -- you can run `man
share/man/man1/pandoc-rss.1` to read this without installing it.

## Bugs and notes

  - RSS enclosures are not supported.  Nobody uses them anyway.
  - Any relative links in the body of an input-file will become
    relative links in the feed and therefore render the feed invalid.

## To-do

  - [x] Add options for specifying channel title, link and description
  - [x] Add Makefile rule to install the man page
  - [x] Cite pandoc-rss as the generator element
  - [x] Produce a standalone feed if and only if at least the channel
    title, description and link are provided.
  - [x] Add option to specify the channel language
  - [x] Infer the guid/permalink format based on the channel link; for
    example if the channel link is `http://example.net` then the
    format is `http://example.net/%s.html`.
  - [x] Finish writing the man page
  - [ ] With input-file "-" read file names line-by-line from stdin
  - [ ] With no input-file, print the usage message
  - [ ] Instead of using a CDATA block, encode special characters in
    the body text as HTML entities.
	
    I think this is not possible using the current template because
    Pandoc simply replaces `$body$` with the rendered HTML; I’m not
    sure how we could intercept that process to escape all `[&<>]`
    characters as required.
  - [ ] Print warnings about relative links in the description element
    (this is non-trivial). Or better, use the channel link as a base
    for relative links. Perhaps only do this with an explicit option,
    otherwise this could lead to confusion and spurious links.
  - [ ] Support for input files in a directory tree.

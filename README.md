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

Partial feed of item fragments:

> **pandoc‑rss** [**‑hop**] [**‑f** *format*|auto|omit]
> [**‑l** *link*] *input‑file*...

Complete valid XML feed:

> **pandoc‑rss** **‑s** [‑**hop**] [**‑f** *format*|auto|omit]
> [**‑l** *link*] [**‑t** *title*] [**‑d** *description*]
> [**‑n** *language*]
> [**‑w** "*webmaster@example.net* (*Real Name*)" ]
> [**‑c** *copyright*] *input‑file*... **>** *feed.xml*

where each *input-file* corresponds to a feed item.  Items in the
resulting XML appear in the order they were given on the command-line.

See pandoc-rss(1) for more detailed information—you can run `man
share/man/man1/pandoc-rss.1` to read this without installing it.

### Example

For example I could render two blog articles `foo.md` and `bar.md`
along with the corresponding `rss.xml` feed using something like the
following:

    $ pandoc --template=page -o foo.html foo.md
    $ pandoc --template=page -o bar.html bar.md
    $ pandoc-rss foo.md bar.md > rss.xml \
        -t cosine.blue \
        -d 'Blog by Gregory Chamberlain' \
        -l https://cosine.blue \
        -c 'GPLv3+ or CC BY-SA 4.0' \
        -w 'greg@cosine.blue (Gregory Chamberlain)' \
        -n en-GB

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

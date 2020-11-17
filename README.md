# Pandoc RSS

This is a simple script that can generate an RSS feed from the content
and metadata of markup files.

It is implemented in POSIX shell, though GNU date(1) is needed to
transform date metadata to conform with [RSS Best Practices section
3.2](https://www.rssboard.org/rss-profile#data-types-datetime).

## Usage

See pandoc-rss(1).

## Bugs and notes

  - Not tested with filenames that have spaces or other characters
    considered special in URLs.

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
  - [ ] With no input-file, read file names line-by-line from stdin
  - [ ] Instead of using a CDATA block, encode special characters in
    the body text as HTML entities.
	
    I think this is not possible using the current template because
    Pandoc simply replaces `$body$` with the rendered HTML; I’m not
    sure how we could intercept that process to escape all `[&<>]`
    characters as required.
  - [ ] Finish writing the man page
  - [ ] Print warnings about relative links in the description element
    (this is non-trivial). Or better, use the channel link as a base
    for relative links. Perhaps only do this with an explicit option,
    otherwise this could lead to confusion and spurious links.
  - [ ] Support for input files in a directory tree.
